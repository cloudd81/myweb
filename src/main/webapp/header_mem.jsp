<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/auth.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>index.jsp</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="../css/reset.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/quiple/hbios-sys@latest/hbios-sys.css">
  <script src="../js/myscript.js"></script>
  
  <!-- 사용자 정의 스타일과 자바스크립트 -->
  <!-- 주의사항 : CSS와 JS는 각 웹브라우저에서 쿠키삭제하고 확인할 것 -->
  <!-- layout.css import -->
  <link rel="stylesheet" href="../css/layout.css">
</head>
<body>
 
<!-- 메인 카테고리 시작 -->
<nav id="indexbg" class="navbar navbar-default">
<div class="container-fluid">
    <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
   	<div>
	  	<a href="<%=request.getContextPath()%>/index.jsp">
	  		<img class="img-responsive" alt="ozlogo" src="../images/miniproj/logo.png" width="140px;" style="padding-left:20px; display:inline;">
	  	</a>
	</div>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
    <ul class="nav navbar-nav navbar-right">
        <li><a class="font2" href="../bbs/bbsList.jsp">게시판</a></li>
        <li><a class="font2" href="../notice/noticeList.jsp">공지사항</a></li>
        <li><a class="font2" href="../pds/pdsList.jsp">포토갤러리</a></li>
        <li><a class="font2" href="../mail/mailForm.jsp">메일보내기</a></li>
<%
	if(s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest")){ 
	// 아이디 저장 쿠키 확인 ---------------------------------------------------
	Cookie[] cookies = request.getCookies(); // 사용자 pc에 저장된 모든 쿠키값 가져오기
	String c_id = "";
	if(cookies!=null){ // 쿠키가 존재하는지?
		for(int i=0; i<cookies.length; i++){
			Cookie cookie = cookies[i]; // 쿠키 하나씩 가져오기
			if(cookie.getName().equals("c_id")==true){
				c_id = cookie.getValue();	
			} // if end
		} // for end
	} // if end
	
	// ------------------------------------------------------------------	 
%>
        <li>
        	<a class="font2" href="../member/loginForm.jsp">
        		<span class="glyphicon glyphicon-log-in"></span>
        		로그인
        	</a>
        </li>
<%
 	} else {
	 // 로그인에 성공했다면
%>	
        <li>
        	<a class="font2" href="../member/loginForm.jsp">
        		<span class="glyphicon glyphicon-log-in"></span>
        		<%=s_id%>님
        	</a>
        </li>
<%
 } // if end
%>
    </ul>
    </div>
</div>
</nav> <!-- 메인 카테고리 끝 -->

<!-- Contents 시작 -->
<div class="container-fluid text-center"> 
  <div class="row">
    <div class="col-xs-12">

