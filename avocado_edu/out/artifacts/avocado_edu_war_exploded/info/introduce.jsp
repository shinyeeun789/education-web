<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 회사소개 </title>
    <%@ include file="../common/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path%>/css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path%>/css/common.css">
    <link rel="stylesheet" href="<%=path%>/css/header.css">
    <link rel="stylesheet" href="<%=path%>/css/content_header.css">
    <link rel="stylesheet" href="<%=path%>/css/footer.css">

    <style>
        body {
            background: white;
        }

        .contents {
            clear: both;
            min-height: 153vh;
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
            min-height: 50vh;
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
        #page1 .page_wrap {
            position: relative;
            clear: both;
            width: 100%;
            height: 500px;
            margin: 0 auto;
            background-image: url(/images/logo_96.png);
            background-repeat: no-repeat;
            background-position: center;
        }
        #page1 .content_tit1 {
            position: absolute;
            font-weight: bold;
            font-size: 25px;
            text-align: center;
            top: 30%;
            left: 50%;
            margin-left: -153px;
            transition: 0.5s;
        }
        #page1 .page_wrap:hover .content_tit1 {
            top: 20%;
        }
        #page1 .content_tit2 {
            font-weight: bold;
            font-size: 25px;
            text-align: center;
            position: absolute;
            top: 70%;
            left: 50%;
            margin-left: -236px;
        }

        #page2 .page {
            clear: both;
            width: 100%;
            min-height: 50vh;
            position: relative;
            top: 50px;
            margin: 0px auto;
        }

        #page2 .page_wrap {
            position: relative;
            clear: both;
            width: 100%;
            height: 600px;
            margin: 0 auto;
            background-image: url(https://cdn.pixabay.com/photo/2022/01/11/19/43/avocado-6931344_1280.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            background-position-y: -250px;
        }

        #page2 .content_tit1 {
            position: absolute;
            font-weight: bold;
            font-size: 25px;
            text-align: center;
            top: 30%;
            left: 50%;
            margin-left: -42px;
            transition: 0.5s;
            color: #fff;
        }
        #page2 .page_wrap:hover .content_tit1 {
            top: 20%;
        }

        #page2 .content_tit2 {
            position: absolute;
            font-weight: bold;
            font-size: 25px;
            text-align: center;
            top: 55%;
            left: 50%;
            margin-left: -375px;
        }

        #page2 .content_tit3 {
            position: absolute;
            font-weight: bold;
            font-size: 25px;
            text-align: center;
            top: 70%;
            left: 50%;
            margin-left: -424px;
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
                <p><a href="<%=path %>">Home</a> &gt; <span> 오시는 길 </span></p>
                <h2 class="page_tit"> 오시는 길 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit1"> 아보카도, 지식의 열매를 키우다. </p>
                <p class="content_tit2"> 창의, 성장, 성공을 함께하는 혁신적인 학습의 시작 </p>
            </div>
        </section>
        <section class="page" id="page2">
            <div class="page_wrap" style="filter: brightness(-10)">
                <p class="content_tit1"> VISION </p>
                <p class="content_tit2"> 미래 사회에서 요구되는 창의성, 혁신, 협업 능력을 강화시키는 온라인 교육 제공 </p>
                <p class="content_tit3"> 학생들이 잠재력을 최대한 발휘하고 성공적인 미래를 위한 토대를 다져나갈 수 있도록 지원 </p>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/common/footer.jsp" %>
    </footer>
</div>
</body>
</html>
