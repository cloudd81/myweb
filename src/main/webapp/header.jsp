<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>index.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Silkscreen&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/quiple/hbios-sys@latest/hbios-sys.css">
  
  <!-- 사용자 정의 스타일과 자바스크립트 -->
  <!-- 주의사항 : CSS와 JS는 각 웹브라우저에서 쿠키삭제하고 확인할 것 -->
  <!-- layout.css import -->
  <link rel="stylesheet" href="../css/layout.css">
  <script src="clock.js"></script>
  <script src="scroll.js"></script>
  <style type="text/css">
    @font-face {
    font-family: 'RIDIBatang';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
  </style>
</head>
<body>

<!-- 메인 카테고리 시작 -->
<nav class="navbar navbar-default">
<div class="container">
    <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <a id="title" class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
    <ul class="nav navbar-nav navbar-right">
        <li><a href="../bbs/bbsList.jsp">게시판</a></li>
        <li><a href="../notice/noticeList.jsp">공지사항</a></li>
        <li><a href="../member/loginForm.jsp">로그인</a></li>
        <li><a href="../pds/pdsList.jsp">포토갤러리</a></li>
        <li><a href="../mail/mailForm.jsp">메일보내기</a></li>
    </ul>
    </div>
</div>
</nav> <!-- 메인 카테고리 끝 -->

<!-- Contents 시작 -->
<div class="container-fluid bg-3 text-center"> 
  <div class="row">
    <div class="col-xs-12">

