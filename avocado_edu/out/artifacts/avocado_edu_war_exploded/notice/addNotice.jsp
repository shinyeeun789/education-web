<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-cmtale=1.0">
    <title> 게시글 작성 </title>
    <%@ include file="../common/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path%>/css/fonts.css">
    <link rel="stylesheet" href="<%=path%>/css/content_header.css">

    <!-- 필요한 플러그인 연결 -->
    <cmtript src="https://code.jquery.com/jquery-latest.js"></cmtript>
    <link rel="stylesheet" href="<%=path%>/css/common.css">
    <link rel="stylesheet" href="<%=path%>/css/header.css">
    <link rel="stylesheet" href="<%=path%>/css/footer.css">

    <style>
        /* 본문 영역 스타일 */
        .contents {
            clear: both;
        }

        .contents::after {
            content: "";
            clear: both;
            display: block;
            width: 100%;
        }

        .page {
            position: relative;
            clear: both;
            width: 100%;
        }

        .page::after {
            content: "";
            display: block;
            width: 100%;
            clear: both;
        }

        .page_wrap {
            clear: both;
            width: 800px;
            height: 100%;
            margin: 100px auto;
            background-color: #eee;
            padding: 60px;
            border-radius: 10px;
        }

        .frm1 {
            width: 100%;
        }

        .tb1 {
            width: 100%;
        }
        .tb1 tr th {
            width: 70px;
            line-height: 70px;
        }
        .tb1 tr td input[type="text"] {
            width: 98%;
            height: 40px;
            margin: 20px 0px;
            font-family: 'suite', Noto-Sans;
            font-size: 15px;
            padding: 10px;
            box-sizing: border-box;
        }
        .tb1 tr td textarea {
            width: 98%;
            height: 150px;
            resize: none;
            font-family: 'suite', Noto-Sans;
            font-size: 15px;
            padding: 10px;
            box-sizing: border-box;
        }

        .tb1 tr td input[type="submit"] {
            width: 100px;
            height: 40px;
            float: right;
            margin-top: 20px;
            background-color: #333;
            color: #fff;
            border-radius: 10px;
        }

        .tb1 tr:nth-child(2) th {
            position: relative;
        }
        .tb1 tr:nth-child(2) th label {
            position: absolute;
            top: 0;
            left: 50%;
            margin-left: -13px;
        }
    </style>
</head>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="../common/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="<%=path %>">Home</a> &gt; <a href="<%=path %>/notice/noticeList.jsp?page=1"> 공지사항  </a> > <span> 공지사항 글 작성하기 </span> </p>
                <h2 class="page_tit"> 공지사항 글 작성 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <form action="<%=path%>/notice/addNoticePro.jsp" class="frm1" method="post">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th><label for="title"> 제목 </label></th>
                            <td>
                                <input type="text" id="title" name="title">
                            </td>
                        </tr>
                        <tr>
                            <th><label for="content"> 내용 </label></th>
                            <td><textarea name="content" id="content"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="submit" value="작성하기"></td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
        <footer class="ft" id="ft">
            <%@include file="../common/footer.jsp"%>
        </footer>
    </div>
</div>
