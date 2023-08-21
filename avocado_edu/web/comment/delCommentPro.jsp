<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.avocado.db.*" %>
<%
    int bno = Integer.parseInt(request.getParameter("bno"));
    int cno = Integer.parseInt(request.getParameter("cno"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    int cnt = 0;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "DELETE FROM comment WHERE cno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, cno);
    cnt = pstmt.executeUpdate();

    con.close(pstmt, conn);

    if(cnt > 0) {
        response.sendRedirect("/board/getBoard.jsp?bno="+bno);
    } else { %>
<script>
    alert("문제가 발생했습니다. 잠시 후 시도해주세요");
    history.go(-1);
</script>
<% } %>