<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.avocado.db.*" %>
<%@ page import="edu.avocado.dto.*" %>
<%@ include file="../common/encoding.jsp"%>

<%
    int dno = request.getParameter("dno") != null ? Integer.parseInt(request.getParameter("dno")) : 0;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "SELECT title, filePath FROM lectureInfo WHERE dno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, dno);
    rs = pstmt.executeQuery();

    LectureInfo info = new LectureInfo();
    while(rs.next()) {
        info.setTitle(rs.getString("title"));
        info.setFilePath(rs.getString("filePath"));
    }
    con.close(rs, pstmt, conn);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> <%=info.getTitle()%> </title>
    <%@ include file="../common/head.jsp" %>

    <% if(sid == null) { %>
    <script>
        alert("로그인 후 강의를 수강할 수 있습니다.");
        location.href="<%=path%>/member/login.jsp";
    </script>
    <%  } %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path%>/css/google.css">
    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path%>/css/common.css">
    <link rel="stylesheet" href="<%=path%>/css/vdo.css">

    <style>
        .contents {
            width: 100%;
            height:100vh;
            clear:both;
            overflow-y: hidden;
        }
        .contents::after {
            content:"";
            clear:both;
            display:block;
            width:100%;
        }

        .lecture_header {
            width: 100%;
            height: 60px;
            background-color: #8CB964;
            color: #fff;
        }

        .lecture_header div {
            float: left;
            line-height: 60px;
            font-size: 15px;
            font-weight: bold;
        }

        .lecture_header div:first-child {
            width: 150px;
            text-align: center;
            background-color: #80B153;
            cursor: pointer;
            transition: 0.3s;
        }
        .lecture_header div:first-child:hover {
            background-color: #6F9C46;
        }
        .lecture_header div:last-child {
            margin-left: 30px;
        }
    </style>
</head>
<body>
<div class="wrap">
    <div class="contents" id="contents">
        <div class="lecture_header">
            <div onclick="javascript: history.go(-1)"> ← 강의 대시보드 </div>
            <div> <%=info.getTitle() %></div>
        </div>
        <div class="player">
            <div class="vdo_fr">
                <video id="video" autoplay>
                    <source src="<%=path%>/videos/<%=info.getFilePath()%>.mp4" type="video/mp4" />
                    <source src="<%=path%>/videos/<%=info.getFilePath()%>.ogv" type="video/ogg" />
                    <source src="<%=path%>/videos/<%=info.getFilePath()%>.webm" type="video/webm" />
                </video>
            </div>
            <div id="progress">
                <div id="progressBar"></div>
            </div>
            <div id="buttonbar">
                <button id="play" class="player_btn"> ▶ </button>
                <button id="pause" class="player_btn"> | | </button>
                <button id="stop" class="player_btn"> ■ </button>
                <span id="currentTime"> 00:00 / <%=info.getDuration() %></span>
                <input id="vol" type="range" value="500" min="0" max="1000">
                <button id="volTxt">50%</button>
            </div>
        </div>
        <script src="<%=path%>/js/vdo.js"></script>
    </div>
</div>
</body>
</html>