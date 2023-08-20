<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.avocado.db.*" %>
<%@ page import="edu.avocado.util.AES256" %>
<%
    String id = request.getParameter("id");
    String pw = AES256.encryptAES256(request.getParameter("pw"), "%02x");
    String tel = request.getParameter("tel");
    String email = request.getParameter("email");
    int cnt = 0;

    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn != null){
        System.out.println("DB 연결 성공");
    }

    try {
        String sql = "update member set pw=?, email=?, tel=? where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, pw);
        pstmt.setString(2, email);
        pstmt.setString(3, tel);
        pstmt.setString(4, id);
        cnt = pstmt.executeUpdate();
        if (cnt > 0) {
            response.sendRedirect("/");
        } else {
            response.sendRedirect("/member/mypage.jsp");
        }
    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(pstmt, conn);
    }
%>