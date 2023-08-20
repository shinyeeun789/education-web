<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="../common/encoding.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="edu.avocado.db.*" %>
<%@ page import="edu.avocado.vo.Qna" %>
<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    int qno = (request.getParameter("qno") != null) ? Integer.parseInt(request.getParameter("qno")) : 0;

    // 2. DB 연결하기
    DBC conn = new MariaDBCon();
    con = conn.connect();

    //3. 조회수 처리
    int count=0;
    String sql = "UPDATE qna SET cnt=cnt+1 WHERE qno=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, qno);
    count = pstmt.executeUpdate();
    pstmt.close();


    //4. SQL을 실행하여 Result(공지사항 한 레코드)을 가져오기
    sql = "select * from qna where qno=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, qno);
    rs = pstmt.executeQuery();


    //5. 가져온 한 레코드를 하나의 qna 객체에 담기
    Qna qna  = new Qna();
    if(rs.next()){
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = sdf.parse(rs.getString("resdate"));
        qna.setResdate(sdf.format(d));
        qna.setCnt(rs.getInt("cnt"));
        qna.setLev(rs.getInt("lev"));
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

        .view_detail .btn_wrap {
            width: 100%;
        }

        .view_detail .btn_wrap .btn {
            min-width: 200px;
            height: 45px;
            float: right;
            text-align: center;
            font-size: 18px;
            background-color: #8CB964;
            color: #fff;
            border-radius: 100px;
            cursor: pointer;
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
                <p><a href="<%=path %>">Home</a> &gt; <a href="<%=path %>/qna/qnaList.jsp?page=1"> Qna  </a> > <span> QnA 상세보기 </span> </p>
                <h2 class="page_tit"> QnA 상세보기 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <table class="view_detail color">
                    <tbody>
                    <% if(sid.equals("admin") || sid.equals(qna.getAuthor())) { %>
                    <tr>
                        <td colspan="3">
                            <a href="/qna/delQna.jsp?qno=<%=qno%>" class="btn"> 삭제 </a>
                            <a href="/qna/updateQna.jsp?qno=<%=qno%>" class="btn"> 수정 </a>
                        </td>
                    </tr>
                    <% } %>
                    <tr>
                        <td class="title" colspan="3">
                            <%=qna.getTitle() %>
                        </td>
                    </tr>
                    <tr>
                        <td class="resdate">
                            작성일 | <%=qna.getResdate()%>
                        </td>
                        <td style="width:10%; text-align: right;">
                            조회수 | <%=qna.getCnt() %>
                        </td>
                        <td style="min-width:10%; max-width: 15%; text-align: right;">
                            작성자 | <%=qna.getAuthor()%>
                        </td>
                    </tr>
                    <tr>
                        <td class="content" colspan="2">
                            <%=qna.getContent() %>
                        </td>
                    </tr>
                    <tr>
                        <td class="btn_wrap" colspan="3">
                            <% if(qna.getLev() == 0) { %>
                                <button class="btn" onclick="javascript: location.href='<%=path%>/qna/addAnswer.jsp?qno=<%=qno%>'"> 답변 달기 </button>
                            <% } %>
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