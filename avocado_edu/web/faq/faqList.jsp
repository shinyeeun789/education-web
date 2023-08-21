<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="edu.avocado.db.*" %>
<%@ page import="edu.avocado.dto.Faq" %>

<%@ include file="../common/encoding.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> FAQ </title>

    <%@ include file="../common/head.jsp" %>

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path%>/css/fonts.css">

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

        .faqList {
            width: 700px;
            margin: 100px auto;
        }

        .faqItem {
            width: 95%;
            margin: 0px auto;
            padding: 20px;
        }

        .question {
            cursor: pointer;
            padding: 10px;
        }

        .answer {
            display: none;
            padding: 10px 30px 10px 30px;
            background-color: #eee;
        }

        .inbtn {
            display: block;
            border-radius: 100px;
            min-width: 140px;
            padding-left: 24px;
            padding-right: 24px;
            text-align: center;
            line-height: 48px;
            background-color: #333;
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
            margin-top: 20px;
        }
    </style>
    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DBC con = new MariaDBCon();
        conn = con.connect();
        String sql = "SELECT * FROM faq ORDER BY cnt DESC, fno ASC";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        List<Faq> faqList = new ArrayList<>();
        while(rs.next()) {
            Faq faq = new Faq();
            faq.setFno(rs.getInt("fno"));
            faq.setQuestion(rs.getString("question"));
            faq.setAnswer(rs.getString("answer"));
            faq.setCnt(rs.getInt("cnt"));
            faqList.add(faq);
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
                <p><a href="<%=path %>">Home</a> &gt; <a href="<%=path %>/faq/faqList.jsp"> FAQ  </a> > <span> 자주 묻는 질문 </span> </p>
                <h2 class="page_tit"> 자주 묻는 질문 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <ul class="faqList">
                    <hr>
                    <% for(Faq faq : faqList) { %>
                    <li class="faqItem">
                        <div class="question"><b> Q </b><%=faq.getQuestion() %></div>
                        <div class="answer"><b> A </b><%=faq.getAnswer() %></div>
                    </li>
                    <hr>
                    <% } %>
                </ul>
                <div class="btn_group">
                    <% if(sid != null && sid.equals("admin")) { %>
                    <a class="inbtn" href="/faq/addFaq.jsp"> FAQ 추가 </a>
                    <% } %>
                </div>
            </div>
        </section>
        <script>
            $(document).ready(function() {
                $(".faqItem").click(function() {
                    $(this).find(".answer").slideToggle(500);
                });
            });
        </script>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../common/footer.jsp" %>
    </footer>
</div>
</body>
</html>