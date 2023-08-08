<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 아보카도 </title>
    <%@include file="./common/head.jsp"%>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트 로딩 -->
    <link rel="stylesheet" href="./css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>

    <!-- CSS 파일 연결 -->
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/main_header.css">
    <link rel="stylesheet" href="./css/header.css">

    <style>
      .contents {
        background-color: antiquewhite;
        width: 100vw;
        height: 500px;
      }
    </style>
  </head>
  <body>
    <div class="wrap">
      <header class="hd">
        <%@include file="common/main_header.jsp"%>
      </header>
      <div class="contents">

      </div>
      <footer class="ft">

      </footer>
    </div>
  </body>
</html>
