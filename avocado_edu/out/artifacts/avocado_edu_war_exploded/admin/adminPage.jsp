<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-cmtale=1.0">
    <title> 관리자 페이지 </title>
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
            min-height: 90vh;
            height: 100%;
            padding-bottom: 100px;
            position:relative;
            top: 50px;
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
            margin: 50px 30px 30px 10px;
        }

        .item_wrap {
            width: 100%;
        }

        .item_wrap .item {
            display: block;
            float: left;
            margin: 15px;
            padding: 15px;
            box-sizing: border-box;
            width: 300px;
            height: 270px;
            border: 1px solid #333;
            text-decoration: none;
            text-align: center;
            color: #333;
            font-size: 20px;
            transition: 0.3s;
        }

        .item_wrap .item:hover {
            box-shadow: 5px 5px 0px #ddd;
        }

        .item_wrap .item img {
            width: 100%;
            height: auto;
            margin-bottom: 30px;
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
                <p><a href="<%=path %>">Home</a> > <span> 관리자 페이지 </span> </p>
                <h2 class="page_tit"> 관리자 페이지 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit"> 안녕하세요, 관리자님! </p>
                <hr>
                <div class="item_wrap">
                    <a href="<%=path%>/admin/memberMgmt.jsp?page=1" class="item"><img src="/images/admin_page.jpg" alt="회원 관리 이미지"><br> 회원 관리 </a>
                    <a href="<%=path%>/admin/qnaMgmt.jsp?page=1" class="item"><img src="/images/admin_page.jpg" alt="고객지원 관리 이미지"><br> 고객지원 관리 </a>
                    <a href="<%=path%>/admin/boardMgmt.jsp?page=1" class="item"><img src="/images/admin_page.jpg" alt="게시판 관리 이미지"><br> 게시판 관리 </a>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@include file="../common/footer.jsp"%>
    </footer>
    <% if(sid == null || !sid.equals("admin")) { %>
    <script>
        alert("관리자만 접근 가능한 페이지입니다.");
        history.go(-1);
    </script>
    <% } %>
</div>
</body>
</html>