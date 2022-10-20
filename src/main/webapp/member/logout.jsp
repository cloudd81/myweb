<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- logout.jsp --%>
<%
	// 세션 변수 제거 -> null값
	session.removeAttribute("s_id");
	session.removeAttribute("s_passwd");
	session.removeAttribute("s_mlevel");
	
	// 페이지 이동
	response.sendRedirect("../index.jsp");
	
%>