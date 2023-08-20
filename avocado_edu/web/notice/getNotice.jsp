<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="../common/encoding.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="edu.avocado.db.*" %>
<%@ page import="edu.avocado.dto.*" %>
<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    int nno = Integer.parseInt(request.getParameter("nno"));

    // 2. DB 연결하기
    DBC conn = new MariaDBCon();
    con = conn.connect();

    //3. 조회수 처리
    int count=0;
    String sql = "UPDATE notice SET cnt=cnt+1 WHERE nno=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, nno);
    count = pstmt.executeUpdate();
    pstmt.close();


    //4. SQL을 실행하여 Result(공지사항 한 레코드)을 가져오기
    sql = "select * from notice where nno=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, nno);
    rs = pstmt.executeQuery();


    //5. 가져온 한 레코드를 하나의 Notice 객체에 담기
    Notice notice  = new Notice();
    if(rs.next()){
        notice.setNno(rs.getInt("nno"));
        notice.setTitle(rs.getString("title"));
        notice.setContent(rs.getString("content"));
        notice.setAuthor(rs.getString("author"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = sdf.parse(rs.getString("resdate"));
        notice.setResdate(sdf.format(d));
        notice.setCnt(rs.getInt("cnt"));
    }
    conn.close(rs, pstmt, con);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-cmtale=1.0">
    <title> 공지사항 상세보기 </title>
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
    <link rel="stylesheet" href="<%=path%>/css/footer.css">
    <style>
        /* 본문 영역 스타일 */
        .contents {
            clear: both;
        }

        .contents::after {
            content: "";
            clear: both;
            display: block;
            width: 100%;
        }

        .page {
            position: relative;
            clear: both;
            width: 100%;
            min-height: 55vh;
        }

        .page::after {
            content: "";
            display: block;
            width: 100%;
            clear: both;
        }

        .page_wrap {
            clear: both;
            width: 1200px;
            margin: 0 auto;
        }

        .view_detail {
            width: 800px;
            margin: 50px auto;
        }

        .view_detail tr {
            width: 100%;
        }

        .view_detail tr td {
            width: 100%;
        }

        .view_detail .btn {
            float: right;
            width: 50px;
            height: 50px;
            text-align: right;
            line-height: 50px;
            border: none;
            background-color: #fff;
        }

        .view_detail .title {
            padding: 20px;
            font-size: 18pt;
            font-weight: bold;
            line-height: 30px;
        }

        .view_detail .author {
            width: 50%;
            padding: 0px 20px 10px 20px;
            text-align: right;
        }

        .view_detail .resdate {
            width: 50%;
            padding: 0px 20px 10px 20px;
        }

        .view_detail .content {
            clear: both;
            width: 100%;
            padding: 20px;
            box-sizing: border-box;
            line-height: 20px;
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
                <p><a href="<%=path %>">Home</a> &gt; <a href="<%=path %>/notice/noticeList.jsp?page=1"> 공지사항  </a> > <span> 공지사항 상세보기 </span> </p>
                <h2 class="page_tit"> 공지사항 상세보기 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <!-- 5. Board 객체의 내용을 출력 -->
                <table class="view_detail color">
                    <tbody>
                    <% if(sid.equals("admin")) { %>
                    <tr>
                        <td colspan="3">
                            <a href="/notice/delNotice.jsp?nno=<%=nno%>" class="btn"> 삭제 </a>
                            <a href="/notice/updateNotice.jsp?nno=<%=nno%>" class="btn"> 수정 </a>
                        </td>
                    </tr>
                    <% } %>
                    <tr>
                        <td class="title" colspan="3">
                            <%=notice.getTitle() %>
                        </td>
                    </tr>
                    <tr>
                        <td class="resdate">
                            작성일 | <%=notice.getResdate()%>
                        </td>
                        <td style="width:10%; text-align: right;">
                            조회수 | <%=notice.getCnt() %>
                        </td>
                        <td style="min-width:10%; max-width: 15%; text-align: right;">
                            작성자 | <%=notice.getAuthor()%>
                        </td>
                    </tr>
                    <tr>
                        <td class="content" colspan="2">
                            <%=notice.getContent() %>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../common/footer.jsp" %>
    </footer>
</div>
</body>
</html>