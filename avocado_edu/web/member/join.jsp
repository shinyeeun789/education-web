<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> JOIN </title>
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
            height: 686px;
            background-color: #fff;
            box-shadow: 2px 2px 10px #ddd;
            left: 50%;
            top: 50%;
            margin: -343px -500px;
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
            margin: 30px auto;
        }
        .tb1 {
            width: 100%;
        }
        .tb1 p.pw_info {
            margin-top: 0;
            margin-bottom: 10px;
            color: darkolivegreen;
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
            border-radius: 10px;
            float: right;
            transition: 0.5s;
        }
        .frm input[type=submit]:hover {
            background-color: #444444;
        }
        .btn {
            width: 94%;
            height: 45px;
            background-color: #81c147;
            transition: 0.5s;
            border-radius: 3px;
            border: #81c147;
        }
        .btn:hover {
            background-color: #70AD47;
        }
    </style>

    <script>
        var ck_pw = false;
        function inform(frm) {
            var ck_id = frm.ck_id;
            if (ck_id.value != "yes") {
                alert("아이디 중복 검사를 진행해주세요.");
                frm.id.focus();
                return false;
            }
            if (!ck_pw) {
                alert("비밀번호와 비밀번호 확인이 맞지 않습니다.");
                frm.pw.focus();
                return false;
            }
        }

        function idcheck() {
            var child;
            var id = document.getElementById("id");
            if(id.value != "") {
                child = window.open("<%=path%>/member/idcheck.jsp?id="+id.value, "child", "width=300, height=200");
                return false;
            } else {
                alert("아이디 입력란에 아이디를 입력해주세요.");
                return false;
            }
        }

        window.onload = function() {
            var pw = document.getElementById("pw");
            var check_pw = document.getElementById("check_pw");
            var info_wrap = document.getElementById("info_wrap");

            check_pw.addEventListener("input", function(e) {
                if(pw.value != e.target.value) {
                    info_wrap.innerHTML = "<td colspan='2'><p class='pw_info'> 비밀번호와 비밀번호 확인이 틀립니다. </p></td>";
                    ck_pw = false;
                } else {
                    info_wrap.innerHTML = "";
                    ck_pw = true;
                }
            });
        }
    </script>
</head>
<body class="wrap">
<header class="hd">
    <%@include file="../common/header.jsp"%>
</header>
<section class="page" id="page1">
    <div class="page_wrap">
        <h2 class="page_tit"> Join </h2>
        <p class="page_explain"> 세부 정보를 입력하여 계정을 생성하세요. </p>
        <form name="frm1" action="<%=path%>/member/joinPro.jsp" onsubmit="return inform(this)" class="frm" method="post">
            <table class="tb1">
                <tbody>
                <tr>
                    <th><label for="id"> 아이디 </label></th>
                    <td>
                        <input type="text" id="id" name="id" placeholder="Enter your ID" autocomplete="off" required>
                        <input type="hidden" name="ck_id" id="ck_id" value="no">
                    </td>
                    <td><button type="button" class="btn" onclick="idcheck()"> 중복체크 </button></td>
                </tr>
                <tr>
                    <th><label for="pw"> 비밀번호 </label></th>
                    <td colspan="2">
                        <input type="password" id="pw" name="pw" placeholder="Enter your password" required>
                    </td>
                </tr>
                <tr>
                    <th><label for="check_pw"> 비밀번호 확인 </label></th>
                    <td colspan="2">
                        <input type="password" id="check_pw" name="check_pw" placeholder="Enter your password" required>
                        <input type="hidden" name="ck_pw" id="ck_pw" value="no">
                    </td>
                </tr>
                <tr id="info_wrap"></tr>
                <tr>
                    <th><label for="name"> 이름 </label></th>
                    <td colspan="2"><input type="text" id="name" name="name" placeholder="Enter your name" required></td>
                </tr>
                <tr>
                    <th><label for="email"> 이메일 </label></th>
                    <td colspan="2"><input type="text" id="email" name="email" placeholder="Enter your email" required></td>
                </tr>
                <tr>
                    <th><label for="tel"> 전화번호 </label></th>
                    <td colspan="2"><input type="text" id="tel" name="tel" placeholder="Enter your tel" required></td>
                </tr>
                <tr>
                    <td colspan="3"><input type="submit" id="sub_btn" value="JOIN"></td>
                </tr>
                </tbody>
            </table>
        </form>
        <p> 계정이 있으신가요? <a href="<%=path%>/member/login.jsp"> 로그인하기 </a> </p>
    </div>
</section>
<footer class="ft">
    <%@include file="../common/footer.jsp"%>
</footer>
</body>
</html>