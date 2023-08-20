<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> LOGIN </title>
        <%@include file="../common/head.jsp" %>

        <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
        <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

        <!-- 필요한 폰트 로딩 -->
        <link rel="stylesheet" href="<%=path%>/css/fonts.css">

        <!-- 필요한 플러그인 연결 -->
        <script src="https://code.jquery.com/jquery-latest.js"></script>

        <!-- CSS ICON 로딩 -->
        <link rel="stylesheet" href="<%=path%>/css/icono.min.css">
        <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">

        <!-- CSS 파일 연결 -->
        <link rel="stylesheet" href="<%=path%>/css/common.css">
        <link rel="stylesheet" href="<%=path%>/css/header.css">
        <link rel="stylesheet" href="<%=path%>/css/footer.css">

        <!-- 로그인 페이지 스타일 적용 -->
        <style>
            .page {
                position: relative;
                width: 100%;
                height: 75vh;
                background-color: #eee;
            }
            .page_wrap {
                position: absolute;
                width: 1000px;
                height: 500px;
                background-color: #fff;
                box-shadow: 2px 2px 10px #ddd;
                left: 50%;
                top: 50%;
                margin: -250px -500px;
                padding: 70px;
                box-sizing: border-box;
                transition: 0.3s;
            }
            .page:hover .page_wrap {
                box-shadow: 5px 5px 10px #ddd;
            }
            .page_tit {
                width: 100%;
                font-size: 30pt;
                font-weight: bolder;
                color: #70AD47;
                text-align: center;
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
                margin: 0 auto;
            }
            .frm .input_wrap {
                width: 300px;
                margin: 10px auto;
                border: 1px solid #ddd;
                border-radius: 10px;
            }
            .frm .input_wrap:first-of-type {
                margin-top: 50px;
            }
            .frm .input_wrap.color {
                background-color: #81c147;
                transition: 0.5s;
            }
            .frm .input_wrap.color:hover {
                background-color: #70AD47;
            }
            .frm input {
                width: 80%;
                height: 45px;
                border: none;
                outline: none;
                font-size: 12pt;
                margin-left: 12px;
            }
            .frm input[type=submit] {
                width: 100%;
                background-color: inherit;
                border-radius: inherit;
                margin: 0;
            }

            /* 아이콘 만들기 */
            span.icono-user {
                color: #999;
                width: 18px;
                height: 10px;
                margin-left: 20px;
            }
            span.icono-user::before {
                width: 6px;
                height: 6px;
                top: -14px;
                border-radius: 50%;
            }
            .icono-lock {
                height: 25px;
                width: 25px;
                display: inline-block;
                position: relative;
                margin: 0px -3px 0px 17px;

            }

            .icono-lock:before {
                content: '';
                height: 6px;
                width: 8px;
                display: block;
                border: 2px solid #999;
                border-bottom: none;
                border-radius: 50px 50px 0 0;
                -webkit-border-radius: 50px 50px 0 0;
                -moz-border-radius: 50px 50px 0 0;
                position: absolute;
                top: 0px;
                left: 6.5px;
            }

            .icono-lock:after {
                content: '';
                height: 6px;
                width: 18px;
                border-radius: 4px;
                -webkit-border-radius: 4px;
                -moz-border-radius: 4px;
                border: 2px solid #999;
                position: absolute;
                top: 10px;
                left: 1px;
            }
        </style>
    </head>
    <body class="wrap">
    <header class="hd">
        <%@include file="../common/header.jsp"%>
    </header>
    <section class="page" id="page1">
        <div class="page_wrap">
            <h2 class="page_tit"> Login </h2>
            <p class="page_explain"> 계정에 로그인하려면 세부 정보를 입력하세요. </p>
            <form action="<%=path%>/member/loginPro.jsp" class="frm" method="post">
                <div class="input_wrap">
                    <span class="icono-user"></span>
                    <input type="text" id="id" name="id" placeholder="Enter your ID" autocomplete="off" autofocus>
                </div>
                <div class="input_wrap">
                    <span class="icono-lock"></span>
                    <input type="password" id="pw" name="pw" placeholder="Enter your password">
                </div>
                <div class="input_wrap color">
                    <input type="submit" value="Login">
                </div>
            </form>
            <p> 계정이 없으신가요? <a href="<%=path%>/member/join.jsp"> 회원가입하기 </a> </p>
        </div>
    </section>
    <footer class="ft">
        <%@include file="../common/footer.jsp"%>
    </footer>
    </body>
</html>