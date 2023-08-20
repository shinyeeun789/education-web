<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="../common/encoding.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.avocado.db.*" %>
<%
    String title = request.getParameter("title");
    String author = (String) session.getAttribute("id");
    String content = request.getParameter("content");

    //3. DB 접속
    Connection conn = null;
    PreparedStatement pstmt = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    //4. SQL 구문 처리(insert문)
    String sql = "insert into notice(title, content, author) values (?, ?, ?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setString(3, author);

    //5. 처리된 결과의 건수를 반환받아 글등록이 성공되었으면, 목록 페이지로 이동(boardList.jsp)
    //실패하면, 글쓰기(addBoard.jsp) 창으로 이동
    int cnt = pstmt.executeUpdate();
    if(cnt>0){
        response.sendRedirect("./noticeList.jsp?page=1");
    } else { %>
<script>
    alert("글 작성에 실패했습니다. 잠시 후 시도해주세요.");
    history.go(-1);
</script>
<%  }
    con.close(pstmt, conn);
%>