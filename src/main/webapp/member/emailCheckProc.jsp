<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>emailCheckProc.jsp</title>
</head>
<body>
	<div style="text-align: center;">
		<h3>* 이메일 중복확인 결과 *</h3>
<%
		String email = request.getParameter("email").trim();
		int cnt = dao.duplecateEmail(email);
		out.println("E-mail : <strong>" + email + "</strong>");
		if(cnt==0){
			out.println("<p>사용이 가능한 이메일입니다</p>");
%>
			<!-- 사용 가능한 id를 부모창에 전달하기 -->
			<button class="btn btn-default" onclick="javascript:apply('<%=email%>')">사용하기</button>
			<script>
			function apply(email) {
				//alert(id)
				opener.document.memfrm.email.value=email;
				window.close();
			} // apply() end
			</script>
<%
		} else {
			out.println("<p style='color:red;'>사용할 수 없는 아이디입니다</p>");
		} // if end

%>
		<hr>
		<button class="btn btn-default" onclick="history.back()">돌아가기</button>
		<button class="btn btn-default" onclick="window.close()">창닫기</button>
	</div>
</body>
</html>