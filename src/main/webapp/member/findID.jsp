<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>index.jsp</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="../css/reset.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 <!-- 본문 시작 findID.jsp -->
<form name="findfrm" id="findfrm" action="findIDProc.jsp" onsubmit="return textCheck()"><!-- myscript.js -->
<br>
<div class="container">
<div class="col-lg-2"></div>
<div class="col-lg-8">
	<table class="table table-condensed">
	<tr><td colspan="3" style="text-align: center; font-weight: bold;">아이디/비밀번호 찾기</td></tr>
	<tr><td colspan="3" style="color:red; font-weight: bold; text-align: center;">가입할 당시 입력한 이름과 이메일을 입력해주세요</td></tr>
	<tr>
	    <th style="text-align: center; padding-top: 10px;">이름</th>
	    <td style="text-align: left"><input type="text" name="mname" id="mname" size="15" maxlength="20" required></td>
   		<td rowspan="2" style="margin: auto;">
			   <button type="submit" class="btn btn-default btn-lg" style="height: 50px; margin-left: 50px; margin-top: 10px;">
			   		<span class="glyphicon glyphicon-search"></span> 확인
			   </button>
	    </td>
	</tr>
	<tr>
	    <th style="text-align: center; padding-top: 10px;">이메일</th>
	    <td style="text-align: left">
	      <input type="email" name="email" id="email" size="30" required>
	    </td>
	</tr>
	</table>
</div> <!-- col-lg-8 end -->
<div class="col-lg-2"></div>
</div> <!-- container end -->
</form>
	<script>
        function textCheck() {
			let email = document.getElementById("email").value;
			email = email.trim();
			let exptext = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(exptext.test(email)==false){
				alert("이메일 형식이 올바르지 않습니다");
				return false;
			} // if end
			
			let mname = document.getElementById("mname").value;
			mname = mname.trim();
			if(mname.length<2){
				alert("이름은 2글자 이상 입력해주세요");
				document.getElementById("mname").focus();
				return false;
			} // if end
			return true;
		} // blankCheck() end        
    </script>
</body>
 <!-- 본문 끝 -->