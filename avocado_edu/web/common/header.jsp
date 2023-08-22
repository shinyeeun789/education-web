<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<div class="hd_wrap">
    <a href="<%=path%>/" class="logo">
        <img src="<%=path%>/images/logo_96.png" alt="아보카도 로고타입">
        <p class="logo_title"> 아보카도 </p>
    </a>
    <nav class="gnb">
        <ul class="menu">
            <li class="item1">
                <a href="" class="dp1"> 경영 계열 </a>
                <ul class="sub">
                    <li><a href="<%=path%>/lecture/lectureList.jsp?category=경영"> 경영 </a></li>
                    <li><a href="<%=path%>/lecture/lectureList.jsp?category=회계"> 회계 </a></li>
                </ul>
            </li>
            <li class="item2">
                <a href="" class="dp1"> 컴퓨터공학 계열 </a>
                <ul class="sub">
                    <li><a href="<%=path%>/lecture/lectureList.jsp?category=프론트엔드"> 프론트엔드 </a></li>
                    <li><a href="<%=path%>/lecture/lectureList.jsp?category=백엔드"> 백엔드 </a></li>
                    <li><a href="<%=path%>/lecture/lectureList.jsp?category=데이터베이스"> 데이터베이스 </a></li>
                </ul>
            </li>
            <li class="item3">
                <a href="" class="dp1"> 디자인 계열 </a>
                <ul class="sub">
                    <li><a href="<%=path%>/lecture/lectureList.jsp?category=메이크업"> 메이크업 </a></li>
                    <li><a href="<%=path%>/lecture/lectureList.jsp?category=헤어"> 헤어 </a></li>
                </ul>
            </li>
            <li class="item4">
                <a href="" class="dp1"> 커뮤니티 </a>
                <ul class="sub">
                    <li><a href="<%=path%>/board/boardList.jsp?page=1"> 커뮤니티 </a></li>
                    <li><a href="<%=path%>/notice/noticeList.jsp?page=1"> 공지사항 </a></li>
                    <li><a href="<%=path%>/qna/qnaList.jsp?page=1"> QnA </a></li>
                    <li><a href="<%=path%>/faq/faqList.jsp"> FAQ </a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <nav class="tnb">
        <ul class="menu">
            <% if(sid != null) { %>
                <li><a href="<%=path%>/member/logout.jsp"> 로그아웃 </a></li>
                <li><a href="<%=path%>/member/mypage.jsp"> 마이페이지 </a></li>
            <% } else { %>
                <li><a href="<%=path%>/member/login.jsp"> 로그인 </a></li>
                <li><a href="<%=path%>/member/join.jsp"> 회원가입 </a></li>
            <% } %>
            <li><a href="<%=path%>/info/company.jsp"> 오시는 길 </a></li>
        </ul>
    </nav>
</div>