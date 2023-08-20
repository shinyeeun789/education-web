<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="../common/encoding.jsp" %>
<%@ page import="edu.avocado.util.AES256" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.avocado.db.*" %>

<%
    String path = request.getContextPath();
    int cnt = 0;

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    pw = AES256.encryptAES256(pw, "%02x");                     // 비밀번호 암호화
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String tel = request.getParameter("tel");

    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    try {
        String sql = "insert into member(id, pw, name, email, tel) values (?,?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        pstmt.setString(3, name);
        pstmt.setString(4, email);
        pstmt.setString(5, tel);
        cnt = pstmt.executeUpdate();

        if (cnt > 0) {
%>
            <script>
                alert("회원가입에 성공했습니다.");
                location.href = "<%=path%>/member/login.jsp";
            </script>
<%      } else { %>
            <script>
                alert("회원가입에 실패했습니다. 잠시 후 다시 시도해주세요.");
                history.go(-1);
            </script>
<%
        }
    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(pstmt, conn);
    }
%>
