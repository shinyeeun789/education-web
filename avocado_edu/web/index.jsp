<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.avocado.db.DBC" %>
<%@ page import="edu.avocado.db.MariaDBCon" %>
<%@ page import="edu.avocado.dto.Lecture" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
    <link rel="stylesheet" href="<%=path%>/css/index.css">
    <link rel="stylesheet" href="<%=path%>/css/footer.css">

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "SELECT * FROM lecture ORDER BY likes DESC LIMIT 0, 4";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Lecture> lecList = new ArrayList<>();
    while(rs.next()) {
        Lecture lec = new Lecture();
        lec.setLno(rs.getInt("lno"));
        lec.setLname(rs.getString("lname"));
        lec.setLteacher(rs.getString("lteacher"));
        lec.setLexplain(rs.getString("lexplain"));
        lec.setCategory(rs.getString("category"));

        lecList.add(lec);
    }
%>
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
                    <h2 class="vs_tit"> 다른 사람들과 함께 <br>
                        소통하며 미래를 디자인해요🌸 </h2>
                </li>
            </ul>
            <ul class="btn_box">
                <li class="item1 active"><label for="vs_ra1" class="vs_btn"></label></li>
                <li class="item2"><label for="vs_ra2" class="vs_btn"></label></li>
            </ul>
            <button type="button" class="play_btn"></button>
        </figure>
    </div>
    <script src="<%=path%>/js/index.js"></script>
    <section class="page" id="page1">
        <div class="page_wrap">
            <h2 class="page_tit"> 인기 강의 </h2>
            <ul class="pic_lst">
                <% for(int i=0; i<lecList.size(); i++) { %>
                <li class="item<%=i+1%>">
                    <a href="<%=path%>/lecture/lectureInfo.jsp?lno=<%=lecList.get(i).getLno()%>&category=<%=lecList.get(i).getCategory()%>&page=1">
                        <h3 class="pic_tit"><%=lecList.get(i).getLname()%>></h3>
                        <span class="pic_arrow"></span>
                    </a>
                </li>
                <% } %>
            </ul>
        </div>
    </section>
    </div>
    <footer>
        <%@include file="./common/footer.jsp" %>
    </footer>
  </body>
</html>
