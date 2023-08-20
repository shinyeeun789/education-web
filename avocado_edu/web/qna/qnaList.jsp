<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="edu.avocado.db.*" %>
<%@ page import="edu.avocado.vo.Qna" %>
<%@ include file="../common/encoding.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> QnA </title>
    <%@ include file="../common/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <link rel="stylesheet" href="<%=path%>/css/fonts.css">
    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>

    <link rel="stylesheet" href="<%=path%>/css/common.css">
    <link rel="stylesheet" href="<%=path%>/css/header.css">
    <link rel="stylesheet" href="<%=path%>/css/content_header.css">
    <link rel="stylesheet" href="<%=path%>/css/list.css">
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
        .btn_group {clear:both;}
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #8CB964; color:#fff; font-size: 18px; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }

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
        String sql = "SELECT COUNT(*) as 'count' FROM qna";
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
        sql = "SELECT a.qno AS qno, a.title AS title, a.content AS content, a.resdate AS resdate, a.cnt as cnt, a.lev AS lev, a.par AS par, b.name AS NAME FROM qna a, member b WHERE a.author=b.id order BY a.par DESC, a.lev ASC, a.qno ASC LIMIT ?, 10";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, 10*(pageNo-1));
        rs = pstmt.executeQuery();

        List<Qna> qnaList = new ArrayList<>();
        while(rs.next()){
            Qna qna = new Qna();
            qna.setQno(rs.getInt("qno"));
            qna.setTitle(rs.getString("title"));
            qna.setContent(rs.getString("content"));
            qna.setResdate(rs.getString("resdate"));
            qna.setLev(rs.getInt("lev"));
            qna.setCnt(rs.getInt("cnt"));
            qna.setName(rs.getString("name"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date d = sdf.parse(rs.getString("resdate"));
            qna.setResdate(sdf.format(d));
            qnaList.add(qna);
        }
        con.close(rs, pstmt, conn);
    %>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../common/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="<%=path %>/">Home</a> &gt; <a href="<%=path %>/qna/qnaList.jsp?page=1"> 커뮤니티 </a> &gt; <span> QnA </span> </p>
                <h2 class="page_tit"> QnA </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit"> QnA </p>
                <hr>
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="no"> 글번호 </div>
                            <div class="title"> 제목 </div>
                            <div class="author"> 작성자 </div>
                            <div class="cnt"> 조회수 </div>
                            <div class="resdate"> 작성일 </div>
                        </div>
                        <% for(Qna qna: qnaList) { %>
                        <div>
                            <div class="no"> <%=qna.getQno()%> </div>
                            <% if(sid!=null) {
                                    if(qna.getLev()==0){%>
                                        <div class="title"> <a href="<%=path%>/qna/getQna.jsp?qno=<%=qna.getQno() %>"><%=qna.getTitle() %></a> </div>
                                <% } else { %>
                                        <div class="title"> <a href="<%=path%>/qna/getQna.jsp?qno=<%=qna.getQno() %>">ㄴ<%=qna.getTitle() %></a> </div>
                                <% }
                            } else {
                                    if(qna.getLev()==0){ %>
                                        <div class="title"><%=qna.getTitle() %></div>
                                <% } else { %>
                                        <div class="title">ㄴ<%=qna.getTitle() %></div>
                                <% }
                            } %>
                            <div class="author"> <%=qna.getName()%> </div>
                            <div class="cnt"> <%=qna.getCnt()%> </div>
                            <div class="resdate"> <%=qna.getResdate()%> </div>
                        </div>
                        <% } %>
                        <% if(count == 0) { %>
                        <div>
                            <p class="result"> 질의응답이 없습니다 :) </p>
                        </div>
                        <% } %>
                    </div>
                    <div class="board_page">
                        <a href="<%=path%>/qna/qnaList.jsp?page=1" class="bt first"> &lt;&lt; </a>
                        <a href="<%=path%>/qna/qnaList.jsp?page=<%=pageNo-1 < 1 ? 1 : pageNo-1%>" class="bt prev"> &lt; </a>
                        <%  for(int p : pageList) {  %>
                        <a href="<%=path%>/qna/qnaList.jsp?page=<%=p%>" class="num <%=(p==pageNo) ? "on" : ""%>"> <%=p%> </a>
                        <%  } %>
                        <a href="<%=path%>/qna/qnaList.jsp?page=<%=pageNo+1 > totalPage ? totalPage : pageNo+1%>" class="bt next"> &gt; </a>
                        <a href="<%=path%>/qna/qnaList.jsp?page=<%=totalPage%>" class="bt last"> &gt;&gt; </a>
                    </div>
                    <div class="btn_group" style="margin:0; width:1000px; padding-top:25px; ">
                        <% if(sid!=null) { %>
                        <a href="<%=path%>/qna/addQuestion.jsp" class="inbtn" style="float:right; ">질문하기</a>
                        <% } %>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../common/footer.jsp" %>
    </footer>
</div>
</body>
</html>