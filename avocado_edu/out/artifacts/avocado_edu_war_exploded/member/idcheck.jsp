<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.avocado.db.*" %>

<style>
    p {
        position: relative;
        font-size: 18px;
        width: 80%;
        top: 50px;
        left: 20px;
    }
    .btn {
        position: relative;
        top: 70px;
        left: 195px;
        width: 80px;
        height: 30px;
        background-color: #333;
        color: #fff;
        border-radius: 10px;
    }
</style>

<%
    String id = request.getParameter("id");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();

    try {
        conn = con.connect();
        String sql = "SELECT id FROM member WHERE id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();

        if(rs.next()) {
            out.println("<p> 중복된 아이디입니다. </p>");
            out.println("<button class='btn' onclick='close_window(false)'> 확인 </button>");
        } else {
            out.println("<p> 사용 가능한 아이디입니다. </p>");
            out.println("<button class='btn' onclick='close_window(true)'> 확인</button>");
        }
    } catch(SQLException e) {
        e.printStackTrace();
    } finally {
        con.close(rs, pstmt, conn);
    }
%>

<script>
    function close_window(state) {
        if(state) {
            opener.document.frm1.ck_id.value="yes";
        } else {
            opener.document.frm1.ck_id.value="no";
            opener.document.frm1.ck_id.style.backgroundColor="#FF9393";
        }
        window.close();
    }
</script>