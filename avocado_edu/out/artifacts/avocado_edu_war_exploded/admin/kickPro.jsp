<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.avocado.db.*" %>
<%
    String id = request.getParameter("id");
    String path9 = request.getContextPath();

    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    String sql = "DELETE FROM member WHERE id=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    int cnt = pstmt.executeUpdate();
    con.close(pstmt, conn);

    if (cnt > 0) { %>
<script>
    alert("<%=id%> 회원을 강퇴시켰습니다 :)");
    location.href = "<%=path9%>/admin/memberMgmt.jsp?page=1";
</script>
<%  } else { %>
<script>
    alert("문제가 발생했습니다. 잠시 후 시도해주세요");
    location.href = "<%=path9%>/admin/memberMgmt.jsp?page=1";
</script>
<% } %>