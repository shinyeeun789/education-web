<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 로딩 --%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="edu.avocado.db.*" %>
<%@ page import="edu.avocado.dto.*" %>

<%
    int pageNo = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 0;
    // 총 페이지 수
    int totalPage = 0;
    // 마지막 페이지
    int endPage = pageNo + 2 < 5 ? 5 : pageNo + 2;
    // 게시글 총 개수
    int count = 0;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    // 페이징 처리 - 전체 페이지 수 구하기
    String sql = "SELECT COUNT(*) as 'count' FROM notice";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    if (rs.next()) {
        count = rs.getInt("count");
        totalPage = count % 10 == 0 ? count / 10 : (count / 10) + 1;
        // 전체 페이지가 0일 경우 (=게시글이 없는 경우)
        totalPage = (totalPage == 0) ? 1 : totalPage;
    }
    rs.close();
    pstmt.close();

    // 페이징 처리 - 현재 페이지에 출력될 페이지 리스트 구하기
    if (endPage > totalPage) {
        endPage = totalPage;
    }
    List<Integer> pageList = new ArrayList<>();
    for (int p = (endPage - 4 > 0 ? endPage - 4 : 1); p <= endPage; p++) {
        pageList.add(p);
    }

    sql = "SELECT * FROM notice ORDER BY nno desc, author LIMIT ?,10 ";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, 10 * (pageNo - 1));
    rs = pstmt.executeQuery();

    List<Notice> noticeList = new ArrayList<>();
    while (rs.next()) {
        Notice notice = new Notice();
        notice.setNno(rs.getInt("nno"));
        notice.setTitle(rs.getString("title"));
        notice.setAuthor(rs.getString("author"));
        notice.setCnt(rs.getInt("cnt"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = sdf.parse(rs.getString("resdate"));
        notice.setResdate(sdf.format(d));
        noticeList.add(notice);
    }
    con.close(rs, pstmt, conn);
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 공지사항 </title>
    <%@ include file="../common/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path%>/css/google.css">
    <link rel="stylesheet" href="<%=path%>/css/fonts.css">
    <link rel="stylesheet" href="<%=path%>/css/content_header.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path%>/css/common.css">
    <link rel="stylesheet" href="<%=path%>/css/header.css">
    <link rel="stylesheet" href="<%=path%>/css/content_header.css">
    <link rel="stylesheet" href="<%=path%>/css/list.css">
    <link rel="stylesheet" href="<%=path%>/css/footer.css">
    <style>
        .contents {
            clear: both;
            min-height: 100vh;
        }
        .contents::after {
            content: "";
            clear: both;
            display: block;
            width: 100%;
        }
        .page {
            clear: both;
            width: 100%;
            min-height: 100vh;
            position: relative;
            top: 50px;
            margin: 0px auto;
        }
        .page::after {
            content: "";
            display: block;
            width: 100%;
            clear: both;
        }
        .page_wrap {
            clear: both;
            width: 1000px;
            height: auto;
            margin: 0 auto;
        }
        .content_tit {
            font-weight: bold;
            font-size: 25px;
            margin: 80px 30px 30px 10px;
        }
        .inbtn {
            display: block;
            border-radius: 100px;
            min-width: 140px;
            padding-left: 24px;
            padding-right: 24px;
            text-align: center;
            line-height: 48px;
            background-color: #8CB964;
            color: #fff;
            font-size: 18px;
        }
        .inbtn:first-child {
            float: left;
        }
        .inbtn:last-child {
            float: right;
        }
        .btn_group {
            clear: both;
            width: 100%;
            margin: 20px 0px;
        }
        .btn_group:after {
            content: "";
            display: block;
            width: 100%;
            clear: both;
        }
    </style>
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="../common/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="<%=path %>">Home</a> &gt; <span> 공지사항 </span></p>
                <h2 class="page_tit"> 공지사항 목록 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit"> 공지사항 </p>
                <hr>
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="no"> 글번호 </div>
                            <div class="title"> 제목 </div>
                            <div class="author"> 작성자 </div>
                            <div class="cnt"> 조회수</div>
                            <div class="resdate"> 작성일</div>
                        </div>
                        <% for (Notice notice : noticeList) { %>
                        <div>
                            <div class="no"><%=notice.getNno()%>
                            </div>
                            <% if (sid != null) { %>
                            <div class="title">
                                <a href="<%=path%>/notice/getNotice.jsp?nno=<%=notice.getNno() %>"><%=notice.getTitle() %></a>
                            </div>
                            <% } else { %>
                            <div class="title" onclick="javascript:alert('로그인 후 글을 열람할 수 있습니다.');"><%=notice.getTitle() %>
                            </div>
                            <% } %>
                            <div class="author"><%=notice.getAuthor()%>
                            </div>
                            <div class="cnt"><%=notice.getCnt()%>
                            </div>
                            <div class="resdate"><%=notice.getResdate()%>
                            </div>
                        </div>
                        <% } %>
                        <% if (count == 0) { %>
                        <div>
                            <p class="result"> 공지사항이 없습니다 :) </p>
                        </div>
                        <% } %>
                    </div>
                    <div class="board_page">
                        <a href="<%=path%>/notice/noticeList.jsp?page=1" class="bt first"> &lt;&lt; </a>
                        <a href="<%=path%>/notice/noticeList.jsp?page=<%=pageNo-1 < 1 ? 1 : pageNo-1%>" class="bt prev">
                            &lt; </a>
                        <% for (int p : pageList) { %>
                        <a href="<%=path%>/notice/noticeList.jsp?page=<%=p%>"
                           class="num <%=(p==pageNo) ? "on" : ""%>"><%=p%>
                        </a>
                        <% } %>
                        <a href="<%=path%>/notice/noticeList.jsp?page=<%=pageNo+1 > totalPage ? totalPage : pageNo+1%>"
                           class="bt next"> &gt; </a>
                        <a href="<%=path%>/notice/noticeList.jsp?page=<%=totalPage%>" class="bt last"> &gt;&gt; </a>
                    </div>
                    <div class="btn_group">
                        <% if (sid != null && sid.equals("admin")) { %>
                        <a href="/notice/addNotice.jsp" class="inbtn">글쓰기</a>
                        <% } %>
                    </div>
                </div>
            </div>
        </section>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/common/footer.jsp" %>
    </footer>
</div>
</body>
</html>