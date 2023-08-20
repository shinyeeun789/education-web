<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.avocado.db.*" %>

<%@ include file="../common/encoding.jsp"%>

<%
    int nno = Integer.parseInt(request.getParameter("nno"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Connection conn = null;
    PreparedStatement pstmt = null;

    /* 3. DB 연결 */
    DBC con = new MariaDBCon();
    conn = con.connect();

    /* 4. SQL을 실행하여 처리된 건수 반환받기 */
    String sql = "update notice set title=?, content=? where nno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setInt(3, nno);
    int cnt = pstmt.executeUpdate();

    /* 5. 처리된 건수가 0보다 크면(성공처리가 되었으면) 목록 페이지로 이동하고,
    아니면(실패처리가 되었으면), 수정할 폼 화면으로 이동한다. */
    if(cnt>0){
        response.sendRedirect("/notice/getNotice.jsp?nno="+nno);
    } else {
        out.println("<script> history.go(-1); </script>");
    }
    con.close(pstmt, conn);
%>