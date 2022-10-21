<%@page import="java.lang.annotation.AnnotationTypeMismatchException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
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
<br>
<div class=container>
	<table class="table table-condensed text-center">
	<tr><td colspan="3" style="text-align: center; font-weight: bold;">이름/이메일 확인 결과</td></tr>
<%
		String mname = request.getParameter("mname").trim();
		String email = request.getParameter("email").trim();
		
		dto.setMname(mname);
		dto.setEmail(email);
		/* int cnt = dao.findID2(mname, email); */
		boolean result = dao.findID(dto);
		out.println("<tr><td>이름 : <strong>" + mname + "</strong><br></td></tr>");
		out.println("<tr><td>이메일 : <strong>" + email + "</strong></td></tr>");
		/* if(cnt!=0) */
		if(result==true){
			out.println("<tr><td><p style='color:red;'>가입하신 정보가 있습니다<br>이메일로 임시비밀번호가 발송되었습니다</p></td>");
%>	
		<td><button class="btn btn-default" onclick="window.close()">창닫기</button></td></tr>
<%
		} else {
			out.println("<tr><td><p style='color:red;'>가입하신 정보가 없습니다</p></td></tr>");
%>
		<td><button class="btn btn-default" onclick="history.back()">돌아가기</button></td></tr>
<%
		} // if end
%>
	</table>
</div>
</body>
</html>