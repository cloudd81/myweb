<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_mem.jsp" %>
<%-- logout.jsp --%>
<%
	session.removeAttribute("s_id");
	session.removeAttribute("s_passwd");
	session.removeAttribute("s_mlevel");
	// 페이지 이동	
	response.sendRedirect("loginForm.jsp");
%>

<%@ include file="../footer.jsp" %>