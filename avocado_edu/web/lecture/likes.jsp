<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder" %>
<%@ include file="../common/encoding.jsp"%>
<%@ page import="java.sql.*" %>
<%@ page import="edu.avocado.db.*" %>
<%
    String category = URLEncoder.encode(request.getParameter("category"), "UTF-8");
    int lno = request.getParameter("lno") != null ? Integer.parseInt(request.getParameter("lno")) : 0;

    Connection con = null;
    PreparedStatement pstmt = null;

    /* 3. DB 연결 */
    DBC conn = new MariaDBCon();
    con = conn.connect();

    /* 4. SQL을 실행하여 처리된 건수 반환받기 */
    String sql = "update lecture set likes=likes+1 where lno=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, lno);
    int cnt = pstmt.executeUpdate();

    /* 5. 처리된 건수가 0보다 크면(성공처리가 되었으면) 목록 페이지로 이동하고,
    아니면(실패처리가 되었으면), 해당 글 상세보기로 이동한다. */
    if(cnt > 0){
        response.sendRedirect("../lecture/lectureInfo.jsp?page=1&lno="+lno+"&category="+category);
    } else {
        out.println("<script> history.go(-1); </script>");
    }

    conn.close(pstmt, con);
%>