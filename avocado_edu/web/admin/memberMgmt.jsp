<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="edu.avocado.db.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="edu.avocado.dto.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-cmtale=1.0">
    <title> 회원 관리 </title>
    <%@ include file="../common/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path%>/css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <cmtript src="https://code.jquery.com/jquery-latest.js"></cmtript>
    <link rel="stylesheet" href="<%=path%>/css/common.css">
    <link rel="stylesheet" href="<%=path%>/css/header.css">
    <link rel="stylesheet" href="<%=path%>/css/content_header.css">
    <link rel="stylesheet" href="<%=path%>/css/mgmt.css">
    <link rel="stylesheet" href="<%=path%>/css/footer.css">

    <style>
        .contents {
            clear:both;
            min-height:100vh;
        }
        .contents::after {
            content:"";
            clear:both;
            display:block;
            width:100%;
        }

        .page {
            clear:both;
            width: 100%;
            min-height: 100vh;
            position:relative;
            top: 50px;
            margin: 0px auto;
        }
        .page::after {
            content:"";
            display:block;
            width: 100%;
            clear:both;
        }

        .page_wrap {
            clear:both;
            width: 1000px;
            height: auto;
            margin:0 auto;
        }

        .content_tit {
            font-weight: bold;
            font-size: 25px;
            margin: 80px 30px 30px 10px;
        }
    </style>
<%
    int pageNo = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 0;
    // 총 페이지 수
    int totalPage = 0;
    // 마지막 페이지
    int endPage = pageNo+2 < 5 ? 5 : pageNo+2;
    // 전체 회원 수
    int count = 0;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    // 페이징 처리 - 전체 페이지 수 구하기
    String sql = "SELECT COUNT(*) as 'count' FROM member WHERE id != 'admin'";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    if(rs.next()) {
        count = rs.getInt("count");
        totalPage = count % 10 == 0 ? count / 10 : (count / 10) + 1;
        // 전체 페이지가 0일 경우 (=회원이 없는 경우)
        totalPage = (totalPage == 0) ? 1 : totalPage;
    }
    rs.close();
    pstmt.close();

    // 페이징 처리 - 현재 페이지에 출력될 페이지 리스트 구하기
    if(endPage > totalPage) {
        endPage = totalPage;
    }
    List<Integer> pageList = new ArrayList<>();
    for(int p=(endPage-4 > 0 ? endPage-4 : 1); p<=endPage; p++) {
        pageList.add(p);
    }

    // 현재 페이지에 출력할 회원 데이터만 가져오기
    sql = "SELECT * FROM member WHERE id !='admin' ORDER BY resdate, id LIMIT ?, 10";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, 10*(pageNo-1));
    rs = pstmt.executeQuery();

    List<Member> memberList = new ArrayList<>();
    while(rs.next()) {
        Member member = new Member();
        member.setId(rs.getString("id"));
        member.setName(rs.getString("name"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = (Date) sdf.parse(rs.getString("resdate"));
        member.setResdate(sdf.format(d));
        memberList.add(member);
    }
    con.close(rs, pstmt, conn);
%>
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="../common/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="<%=path %>/">Home</a> > <a href="<%=path %>/admin/adminPage.jsp"> 관리자 페이지 </a> > <span> 회원관리 </span> </p>
                <h2 class="page_tit"> 관리자 페이지 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit"> 회원 관리 </p>
                <hr>
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="id"> 회원 아이디 </div>
                            <div class="name"> 이름 </div>
                            <div class="date"> 가입일 </div>
                            <div class="kick"> 강퇴 </div>
                        </div>
                        <% for(Member member : memberList) { %>
                        <div>
                            <div class="id"> <%=member.getId()%> </div>
                            <div class="name"> <%=member.getName()%> </div>
                            <div class="date"> <%=member.getResdate()%> </div>
                            <div class="kick"><button onclick="javascript:location.href='<%=path%>/admin/kickpro.jsp?id=<%=member.getId()%>&pageNo=<%=pageNo%>'">강퇴</button></div>
                        </div>
                        <% } %>
                        <% if(count == 0) { %>
                        <div>
                            <p class="result"> 회원가입한 회원이 존재하지 않습니다 :( </p>
                        </div>
                        <% } %>
                    </div>
                    <div class="board_page">
                        <a href="<%=path%>/admin/memberMgmt.jsp?page=1" class="bt first"> &lt;&lt; </a>
                        <a href="<%=path%>/admin/memberMgmt.jsp?page=<%=pageNo-1 < 1 ? 1 : pageNo-1%>" class="bt prev"> &lt; </a>
                        <%  for(int p : pageList) {  %>
                        <a href="<%=path%>/admin/memberMgmt.jsp?page=<%=p%>" class="num <%=(p==pageNo) ? "on" : ""%>"> <%=p%> </a>
                        <%  } %>
                        <a href="<%=path%>/admin/memberMgmt.jsp?page=<%=pageNo+1 > totalPage ? totalPage : pageNo+1%>" class="bt next"> &gt; </a>
                        <a href="<%=path%>/admin/memberMgmt.jsp?page=<%=totalPage%>" class="bt last"> &gt;&gt; </a>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@include file="../common/footer.jsp"%>
    </footer>
    <% if(sid == null || !sid.equals("admin")) { %>
    <script>
        alert("관리자만 접근 가능한 페이지입니다.");
        history.go(-1);
    </script>
    <% } %>
</div>
</body>
</html>