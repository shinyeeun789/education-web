<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String sid = (String) session.getAttribute("id");
%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Publisher" content="신예은">
<title>천재교육</title>

<!-- 검색엔진 최적화(SEO) -->
<meta name="Subject" content="아보카도, 특성화고등학교 학생">
<meta name="Keywords" content="아보카도, 특성화고, 학생, 교육 웹">
<meta name="Description" content="아보카도는 특성화고등학교 학생을 위한 ">
<meta name="robots" content="index,follow">           <!-- 검색되게 하는 코드 -->

<!-- 파비콘 설정 -->
<!-- 16x16, 24x24, 32x32, 48x48, 64x64, 96x96, 114x114, 128x128, 256x256 등을 활용-->
<!-- 표준 파비콘 -->
<link rel="shortcut icon" href="<%=path %>/images/logo.ico">
<!-- 애플 계열 모바일 -->
<link rel="apple-touch-icon-precomposed" href="<%=path %>/images/logo_64.png">
<!-- IE 계열 브라우저 -->
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="<%=path %>/images/logo_48.png">
<!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->
<!-- 브라우저에서 지원하는 것 중 제일 고화질의 파일 선택 -->
<link rel="icon" href="<%=path %>/images/logo_24.png" sizes="24x24">
<link rel="icon" href="<%=path %>/images/logo_48.png" sizes="48x48">
<link rel="icon" href="<%=path %>/images/logo_64.png" sizes="64x64">