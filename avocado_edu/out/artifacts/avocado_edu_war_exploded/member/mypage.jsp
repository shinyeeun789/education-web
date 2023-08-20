<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.avocado.db.*" %>
<%@ page import="edu.avocado.dto.Member" %>
<%@ page import="edu.avocado.util.AES256" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> MYPAGE </title>
    <%@include file="../common/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트 로딩 -->
    <link rel="stylesheet" href="<%=path%>/css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>

    <!-- CSS 파일 연결 -->
    <link rel="stylesheet" href="<%=path%>/css/common.css">
    <link rel="stylesheet" href="<%=path%>/css/header.css">
    <link rel="stylesheet" href="<%=path%>/css/content_header.css">
    <link rel="stylesheet" href="<%=path%>/css/footer.css">

    <!-- 로그인 페이지 스타일 적용 -->
    <style>
        .page {
            position: relative;
            width: 100%;
            height: 100vh;
            background-color: #eee;
        }
        .page_wrap {
            position: absolute;
            width: 1000px;
            height: 576px;
            background-color: #fff;
            box-shadow: 2px 2px 10px #ddd;
            left: 50%;
            top: 50%;
            margin: -288px -500px;
            padding: 70px;
            box-sizing: border-box;
            transition: 0.3s;
        }
        .page:hover .page_wrap {
            box-shadow: 5px 5px 10px #ddd;
        }
        .page .page_wrap p {
            text-align: center;
            margin-top: 20px;
        }
        .page_explain {
            font-size: 13pt;
        }
        .page .page_wrap a {
            color: #70AD47;
        }

        /* 폼 스타일 */
        .frm {
            width: 700px;
            margin: 30px auto;
        }
        .tb1 {
            width: 100%;
        }
        .frm input {
            width: 98%;
            height: 45px;
            font-size: 12pt;
            margin: 5px;
            padding-left: 10px;
            box-sizing: border-box;
        }
        .frm input[type=submit] {
            width: 150px;
            background-color: #333333;
            color: #ffffff;
            border-radius: 100px;
            float: right;
            transition: 0.5s;
        }
        .frm input[type=submit]:hover {
            background-color: #444444;
        }
    </style>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC conn = new MariaDBCon();
    con = conn.connect();
    String sql = "select * from member where id=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, sid);
    rs = pstmt.executeQuery();

    Member member = new Member();
    if(rs.next()) {
        member.setId(rs.getString("id"));
        // 비밀번호 복호화
        member.setPw(AES256.decryptAES256(rs.getString("pw"), "%02x"));
        member.setName(rs.getString("name"));
        member.setEmail(rs.getString("email"));
        member.setTel(rs.getString("tel"));
    }
%>
</head>
<body class="wrap">
<div class="container">
    <header class="hd">
        <%@include file="../common/header.jsp"%>
    </header>
    <div class="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="<%=path %>">Home</a> > <span> 마이페이지 </span> </p>
                <h2 class="page_tit"> 개인 정보 수정 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="page_explain"> 세부 정보를 입력하여 개인 정보를 변경하세요. </p>
                <form name="frm1" action="<%=path%>/member/modifyPro.jsp" class="frm" method="post">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th><label for="id"> 아이디 </label></th>
                            <td>
                                <input type="text" id="id" name="id" placeholder="Enter your ID" autocomplete="off" value="<%=member.getId()%>" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th><label for="pw"> 비밀번호 </label></th>
                            <td>
                                <input type="password" id="pw" name="pw" placeholder="Enter your password" value="<%=member.getPw()%>" required>
                            </td>
                        </tr>
                        <tr>
                            <th><label for="name"> 이름 </label></th>
                            <td><input type="text" id="name" name="name" placeholder="Enter your name" value="<%=member.getName()%>" readonly></td>
                        </tr>
                        <tr>
                            <th><label for="email"> 이메일 </label></th>
                            <td><input type="text" id="email" name="email" placeholder="Enter your email" value="<%=member.getEmail()%>" required></td>
                        </tr>
                        <tr>
                            <th><label for="tel"> 전화번호 </label></th>
                            <td><input type="text" id="tel" name="tel" placeholder="Enter your tel" value="<%=member.getTel()%>" required></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="submit" id="sub_btn" value="수정하기"></td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </div>
    <footer class="ft">
        <%@include file="../common/footer.jsp"%>
    </footer>
</div>
</body>
</html>