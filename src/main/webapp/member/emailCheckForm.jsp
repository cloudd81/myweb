<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>emailCheckForm.jsp</title>
</head>
<body>
	<div style="text-align: center;">
		<h3>* 이메일 중복확인 *</h3>
		<form action="emailCheckProc.jsp" onsubmit="return textCheck()">
			E-mail : <input type="text" name="email" id="email" maxlength="50" autofocus>
			<input type="submit" value="중복확인">
		</form>
	</div>
	<script>
        function textCheck() {
			let email = document.getElementById("email").value;
			email = email.trim();
			let exptext = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(exptext.test(email)==false){
				alert("이메일 형식이 올바르지 않습니다");
				return false;
			} // if end
			return true;
		} // blankCheck() end        
    </script>
</body>
</html>