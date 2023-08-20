<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="../common/encoding.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.avocado.db.*" %>
<%
    String path = request.getContextPath();

    String title = request.getParameter("title");
    String author = (String) session.getAttribute("id");
    String content = request.getParameter("content");

    //3. DB 접속
    Connection conn = null;
    PreparedStatement pstmt = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    //4. SQL 구문 처리(insert문)
    String sql = "insert into qna(title, content, author, lev) values (?, ?, ?, 0)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setString(3, author);

    int cnt = pstmt.executeUpdate();
    pstmt.close();

    sql = "update qna set par=qno where par=0 and lev=0";
    pstmt = conn.prepareStatement(sql);
    pstmt.executeQuery();
    cnt++;

    if(cnt == 2) { %>
        <script>
            alert("질문 글이 등록되었습니다");
            location.href = "<%=path%>/qna/qnaList.jsp?page=1";
        </script>
<%  } else { %>
        <script>
            alert("질문 글 작성에 실패했습니다. 잠시 후 시도해주세요.");
            history.go(-1);
        </script>
<%  }
    con.close(pstmt, conn);
%>