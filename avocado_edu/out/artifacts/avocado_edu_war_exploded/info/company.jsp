<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 오시는 길 </title>
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

    <!-- 다음맵 연결 -->
    <link rel="stylesheet" type="text/css" href="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapidoc/1421136453605/service.min.css">
    <script type="text/javascript" src="http://dmaps.daum.net/map_js_init/v3.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U0301/cssjs/JSON-js/fc535e9cc8/json2.min.js"></script>

    <style>
        body {
            background: white;
        }

        .contents {
            clear: both;
            min-height: 100vh;
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
            min-height: 100vh;
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
        .page_wrap {
            clear: both;
            width: 1000px;
            height: auto;
            margin: 0 auto;
        }
        .content_tit {
            font-weight: bold;
            font-size: 25px;
            margin: 80px 30px 30px 10px;
        }

        .tab_box {
            clear: both;
            width: 1200px;
            height: 42px;
            margin-top: 120px;
            position: fixed;
            top: 100px;
            left: 50%;
            margin-left: -600px;
            z-index: 99;
        }

        .tab_box li {
            width: 25%;
            height: 42px;
            line-height: 42px;
            float: left;
        }

        .tab_box li a {
            display: block;
            width: 100%;
            text-align: center;
            background-color: rgba(255, 215, 0, 0.7);
        }

        #map {
            width: 80vw;
            margin-top: 50px;
            margin-bottom: 150px;
            background: white;
        }
    </style>
</head>
<body class="web guide" data-page_section="web" data-page_type="guide" data-title="Daum 지도 Web API 가이드">
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
            <section class="page" id="map">
                <div class="page_wrap">
                    <h2 class="page_tit">오시는길</h2>
                    <div class="maparea">
                        <div id="map"></div>
                        <script>
                            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                                mapOption = {
                                    center: new daum.maps.LatLng(37.4786713,126.8864968), // 지도의 중심좌표
                                    level: 2 // 지도의 확대 레벨
                                };
                            var map = new daum.maps.Map(mapContainer, mapOption);
                            // 마커가 표시될 위치입니다
                            var markerPosition  = new daum.maps.LatLng(37.4786713,126.8864968);
                            // 마커를 생성합니다
                            var marker = new daum.maps.Marker({
                                position: markerPosition
                            });
                            // 마커가 지도 위에 표시되도록 설정합니다
                            marker.setMap(map);
                            var iwContent = '<div style="padding:5px;">천재 IT교육센터 본원<br><a href="" style="color:blue" target="_blank"></a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                                iwPosition = new daum.maps.LatLng(37.4786713,126.8864968); //인포윈도우 표시 위치입니다
                            // 인포윈도우를 생성합니다
                            var infowindow = new daum.maps.InfoWindow({
                                position : iwPosition,
                                content : iwContent
                            });
                            // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                            infowindow.open(map, marker);
                        </script>
                        <script type="text/javascript" src="http://m1.daumcdn.net/tiara/js/td.min.js"></script>
                        <script type="text/javascript">
                            var _tiq = 'undefined' !== typeof _tiq ? _tiq : [];
                            window._tiq = _tiq;
                            _tiq.push(['__trackPageview']);
                        </script>
                        <script type="text/javascript" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapidoc/1421136453605/service.min.js">
                        </script>
                    </div>
                </div>
            </section>
        </div>
        <footer class="ft" id="ft">
            <%@ include file="/common/footer.jsp" %>
        </footer>
    </div>
</body>
</html>
