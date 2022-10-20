<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>index.jsp</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <!-- 사용자 정의 스타일과 자바스크립트 -->
  <!-- 주의사항 : CSS와 JS는 각 웹브라우저에서 쿠키삭제하고 확인할 것 -->
  <!-- layout.css import -->
  <link rel="stylesheet" href="./css/layout.css">
</head>
<body>

<!-- 메인 카테고리 -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./bss/bssList.jsp">게시판</a></li>
        <li><a href="./notice/noticeList.jsp">공지사항</a></li>
        <li><a href="./member/loginForm.jsp">로그인</a></li>
        <li><a href="./pds/pdsList.jsp">포토갤러리</a></li>
        <li><a href="./mail/mailForm.jsp">메일보내기</a></li>
      </ul>
    </div>
  </div>
</nav> <!-- 메인 카테고리 끝 -->

<!-- First Container 시작 -->
<div class="container-fluid bg-1 text-center">
  <img src="./images/miniproj/title.png" class="img-responsive margin" style="display:inline" alt="pacman" width="50%">
</div><!-- First Container 끝 -->

<!-- Contents 시작 -->
<div class="container-fluid bg-3 text-center"> 
  <div class="row">
    <div class="col-xs-12">
    	<!-- 본문 시작 -->
    		본문은 여기에 작성해주세요~
    	<!-- 본문 끝 -->
    </div> <!-- col 끝 -->
  </div> <!-- row 끝 -->
</div> <!-- Contents 끝 -->

<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
	Copyright &copy; 2022 MYWEB
</footer>

</body>
</html>
