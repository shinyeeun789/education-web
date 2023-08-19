<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 아보카도 </title>
    <%@include file="./common/head.jsp" %>

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

    <style>
        /* 본문 영역 스타일 */
        .slide_menu {
            clear: both;
            width: 100%;
            height: 500px;
        }

        .vs {
            clear: both;
            position: relative;
            width: 100%;
            min-height: 500px;
            overflow: hidden;
        }

        .img_box {
            width: 100%;
            height: 500px;
            overflow: hidden;
        }

        .img_box li {
            visibility: hidden;
            opacity: 0;
            transition-duration: 0.7s;
            transition-delay: 0.1s;
            width: 100%;
            height: 500px;
        }

        .img_box li .bg_box {
            width: 100%;
            height: 500px;
            background-repeat: no-repeat;
            background-position: center center;
            background-size: cover;
            position: absolute;
            left: 0;
            top: 0;
            z-index: 5;
        }

        .img_box li.active .bg_box {
            z-index: 6;
        }

        .img_box li.item1 .bg_box {
            background-image: url("<%=path%>/images/vs1.png");
        }

        .img_box li.item2 .bg_box {
            background-image: url("<%=path%>/images/vs2.jpg");
        }

        .img_box li .vs_tit {
            position: absolute;
            top: 180px;
            left: 100px;
            z-index: 10;
            font-weight: 300;
            font-size: 60px;
            line-height: 1.3;
        }

        .img_box li .vs_tit strong {
            font-weight: 500;
        }

        .img_box li.active {
            visibility: visible;
            opacity: 1;
        }

        .vs_tit {
            font-size: 60px;
            font-weight: 300;
            color: #fff;
            text-shadow: #333 1px 0px 10px;
        }

        .btn_box li .vs_btn {
            display: block;
            width: 12px;
            height: 12px;
            background-color: rgba(255, 255, 255, 0.8);
            border: 2px solid #fff;
            position: absolute;
            top: 100px;
            left: 100px;
            z-index: 14;
            cursor: pointer;
            border-radius: 50%;
        }

        .btn_box li.item2 .vs_btn {
            left: 132px;
        }

        .btn_box li.active .vs_btn {
            background-color: #aaa;
            border: 2px solid #aaa;
        }

        .play_btn {
            display: block;
            width: 12px;
            height: 12px;
            position: absolute;
            top: 98px;
            left: 164px;
            z-index: 14;
            cursor: pointer;
            color: #fff;
            border: 0;
            background-color: transparent;
            font-weight: 900;
        }

        .play_btn:after {
            content: "| |";
        }

        .play_btn.active:after {
            content: "▶";
        }

        .page {
            clear: both;
            width: 100%;
            height: 80vh;
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
            height: auto;
            margin: 0 auto;
        }

        .page_tit {
            font-size: 48px;
            text-align: center;
            padding-top: 1.75em;
        }

        .pic_lst {
            clear: both;
            width: 1200px;
            margin: 60px auto;
        }

        .pic_lst li {
            width: 280px;
            margin-right: 26px;
            height: 400px;
            float: left;
            background-repeat: no-repeat;
            background-position: center center;
            filter: brightness(50%);
            margin-top: 30px;
            transition: 0.4s;
            box-shadow: 12px 12px 12px #999;
            overflow: hidden;
        }

        .pic_lst li:hover {
            filter: brightness(100%);
            margin-top: -10px;
        }

        .pic_lst li a {
            display: block;
            width: 256px;
            height: 376px;
            margin: 11px;
            border: 1px solid #fff;
            color: #fff;
        }

        .pic_lst li:last-child {
            margin-right: 0;
        }

        .pic_lst li.item1 {
            background-image: url("<%=path%>/images/lecture_img01.jpg");
        }

        .pic_lst li.item2 {
            background-image: url("<%=path%>/images/lecture_img02.jpg");
        }

        .pic_lst li.item3 {
            background-image: url("<%=path%>/images/lecture_img03.png");
        }

        .pic_lst li.item4 {
            background-image: url("<%=path%>/images/lecture_img04.jpg");
        }

        .pic_com {
            padding-left: 20px;
            padding-top: 20px;
            font-size: 14px;
        }

        .pic_tit {
            padding-left: 20px;
            padding-top: 20px;
            font-size: 18px;
        }

        .pic_arrow {
            display: block;
            width: 110px;
            height: 10px;
            border-bottom: 1px solid #fff;
            margin-top: 20px;
            margin-left: -12px;
            transition: 0.4s;
            position: relative;
        }

        .pic_lst li:hover a .pic_arrow {
            margin-left: 20px;
        }

        .pic_arrow::after {
            content: "";
            display: block;
            width: 10px;
            height: 10px;
            position: absolute;
            right: 0;
            top: 0;
            border-bottom: 1px solid #fff;
            transform-origin: 100% 100%;
            transform: rotate(45deg);
            display: none;
        }

        .pic_lst li:hover a .pic_arrow::after {
            display: block;
        }
    </style>
</head>
<body class="wrap">
<header class="hd">
    <%@include file="./common/header.jsp" %>
</header>
<div class="slide_menu">
    <figure class="vs">
        <ul class="img_box">
            <li class="item1 active">
                <input type="radio" name="vs_ra" id="vs_ra1" class="va_ra">
                <div class="bg_box"></div>
                <h2 class="vs_tit"> 온라인 강의로 <br>
                    지식을 키워나가요🌱 </h2>
            </li>
            <li class="item2">
                <input type="radio" name="vs_ra" id="vs_ra2" class="va_ra">
                <div class="bg_box"></div>
                <h2 class="vs_tit"> 학습 스케줄 도우미와 함께 <br>
                    학습 성취도를 높여나가요🌸 </h2>
            </li>
        </ul>
        <ul class="btn_box">
            <li class="item1 active"><label for="vs_ra1" class="vs_btn"></label></li>
            <li class="item2"><label for="vs_ra2" class="vs_btn"></label></li>
        </ul>
        <button type="button" class="play_btn"></button>
    </figure>
</div>
<script>
    $(function () {
        $(".btn_box li .vs_btn").click(function () {
            var par = $(this).parents("li").index();
            $(".img_box li").removeClass("active");
            $(".img_box li").eq(par).addClass("active");
            $(".btn_box li").removeClass("active");
            $(".btn_box li").eq(par).addClass("active");
        });
        var sw = 1;
        var int1 = setInterval(function () {
            if (sw == 1) {
                autoplay(1);
                sw = 0;
            } else {
                autoplay(0);
                sw = 1;
            }
        }, 3500);

        function autoplay(n) {
            $(".img_box li").removeClass("active");
            $(".img_box li").eq(n).addClass("active");
            $(".btn_box li").removeClass("active");
            $(".btn_box li").eq(n).addClass("active");
        }

        $(".play_btn").click(function () {
            if ($(this).hasClass("active")) {
                $(this).removeClass("active");
                sw = 1;
                int1 = setInterval(function () {
                    if (sw == 1) {
                        autoplay(1);
                        sw = 0;
                    } else {
                        autoplay(0);
                        sw = 1;
                    }
                }, 3500);
            } else {
                $(this).addClass("active");
                sw = 0;
                clearInterval(int1);
            }
        });
    });
</script>
<section class="page" id="page1">
    <div class="page_wrap">
        <h2 class="page_tit"> 인기 강의 </h2>
        <ul class="pic_lst">
            <li class="item1">
                <a href="">
                    <p class="pic_com">설명</p>
                    <h3 class="pic_tit">제목</h3>
                    <span class="pic_arrow"></span>
                </a>
            </li>
            <li class="item2">
                <a href="">
                    <p class="pic_com">설명</p>
                    <h3 class="pic_tit">제목</h3>
                    <span class="pic_arrow"></span>
                </a>
            </li>
            <li class="item3">
                <a href="">
                    <p class="pic_com">설명</p>
                    <h3 class="pic_tit">제목</h3>
                    <span class="pic_arrow"></span>
                </a>
            </li>
            <li class="item4">
                <a href="">
                    <p class="pic_com">설명</p>
                    <h3 class="pic_tit">제목</h3>
                    <span class="pic_arrow"></span>
                </a>
            </li>
        </ul>
    </div>
</section>
</div>
<footer>
    <%@include file="./common/footer.jsp" %>
</footer>
</body>
</html>
