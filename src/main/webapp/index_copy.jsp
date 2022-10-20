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
		<!-- layout.css import -->
		<link rel="stylesheet" href="layout.css">
		<script src="clock.js"></script>
		<script src="scroll.js"></script> 
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
		    <a id="title" class="navbar-brand" href="#">HOME</a>
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
		
		<!-- Content 시작 -->
		<!-- First Container -->
		<div class="container-fluid bg-1 text-center">
		<h3 id="title" class="margin">Do You Know Pac-Man</h3>
		<img src="../images/miniproj/title.png" class="img-responsive img-rounded margin" style="display:inline" alt="vases" width="350" height="350">
		</div> <!-- First Container 끝 -->
		
		<!-- Second Container -->
		<div class="container-fluid bg-2 text-center">
		    <div class="row">
		        <!-- 본문 시작 -->   
		            <div id="game">
		                <script> start(); </script>
		            </div><hr>
		            <div id="clock">
		                <script>showtime();</script>
		            </div>
		            <button type="button" id="title" class="btn btn-default" onclick="showtime()">clock on</button>
		            <button type="button" id="title" class="btn btn-default" onclick="killtime()">clock off</button>
		        <!-- 본문 끝 -->
		    </div> <!-- row 끝 -->
		</div> <!-- Second Container 끝 -->
		<!-- Content 끝 -->
		
		<!-- Footer -->
		<footer class="container-fluid bg-4 text-center">
		<p>Copyright &copy; 2022 MyWeb</p> 
		</footer>    

        

	</body>
</html>