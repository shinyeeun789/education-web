<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.avocado.db.*" %>
<%@ page import="edu.avocado.dto.Lecture" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 강의 목록 </title>
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

        .page_wrap .info {
            font-size: 15pt;
            text-align: center;
            margin-top: 20px;
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
            border: 1px solid #333;
            text-decoration: none;
            text-align: center;
            color: #333;
            font-size: 20px;
            transition: 0.3s;
            cursor: pointer;
        }

        .item_wrap .item:hover {
            box-shadow: 5px 5px 0px #ddd;
        }

        .item_wrap .item .img_box {
            width: 270px;
            height: 200px;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .item_wrap .lec_name {
            padding: 20px 0px;
        }
    </style>
<%
    String category = request.getParameter("category");

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC conn = new MariaDBCon();
    con = conn.connect();
    String sql = "select * from lecture where category=? order by likes desc";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, category);
    rs = pstmt.executeQuery();

    List<Lecture> lecList = new ArrayList<>();
    while(rs.next()) {
        Lecture lec = new Lecture();
        lec.setLno(rs.getInt("lno"));
        lec.setLname(rs.getString("lname"));
        lec.setLteacher(rs.getString("lteacher"));
        lec.setLexplain(rs.getString("lexplain"));
        lec.setFilePath(rs.getString("filePath"));
        lec.setCategory(rs.getString("category"));
        lec.setLikes(rs.getInt("likes"));
        lecList.add(lec);
    }
%>
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="../common/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="<%=path %>">Home</a> &gt; <span> <%=category%> 강의 목록 </span> </p>
                <h2 class="page_tit"> <%=category%> 강의 목록 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit"> 인기 강의 </p>
                <hr>
                <div class="item_wrap">
                    <% for(Lecture lec : lecList) { %>
                        <div class="item" onclick="javascript: location.href='<%=path%>/lecture/lectureInfo.jsp?category=<%=lec.getCategory()%>&lno=<%=lec.getLno()%>&page=1'">
                            <table>
                                <tbody>
                                <tr>
                                    <td class="img_box" style="background-image: url('<%=path%>/images/<%=lec.getFilePath()%>')"></td>
                                </tr>
                                <tr>
                                    <td class="lec_name"><%=lec.getLname()%></td>
                                </tr>
                                <tr>
                                    <td> ❤️<%=lec.getLikes()%></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    <% } %>
                </div>
                <%  if(lecList.size() == 0) { %>
                    <p class="info"> 아직 오픈된 강의가 없습니다. </p>
                <%  } %>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../common/footer.jsp" %>
    </footer>
</div>
</body>
</html>