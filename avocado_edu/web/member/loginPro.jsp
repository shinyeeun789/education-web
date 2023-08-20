<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.avocado.util.*" %>
<%@ page import="edu.avocado.db.*" %>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String db_pw = null;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn != null){
        System.out.println("DB 연결 성공");
    }

    try {
        String sql = "select id, pw, name from member where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if(rs.next()){
            session.setAttribute("id", id);
            session.setAttribute("name", rs.getString("name"));
            db_pw = AES256.decryptAES256(rs.getString("pw"), "%02x");
            if(pw.equals(db_pw)) {
                response.sendRedirect("/");
            } else {
                response.sendRedirect("/member/login.jsp");
            }
        } else {
            response.sendRedirect("/member/login.jsp");
        }
    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(rs, pstmt, conn);
    }
%>