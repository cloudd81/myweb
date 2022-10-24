<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_noti.jsp" %>
 <!-- 본문 시작 noticeIns.jsp -->
<h3>공지사항 입력 결과 페이지</h3>
<%
	String subject = request.getParameter("subject").trim();
	String content = request.getParameter("content").trim();
	
	dto.setSubject(subject);
	dto.setContent(content);
	
	int cnt = dao.create(dto);
	
	if(cnt==0){
		out.println("<p>게시판 업로드에 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else{
		out.print("<script>");
		out.print("		alert('게시판에 업로드되었습니다');");
		out.print(" 	location.href='noticeList.jsp';");
		out.print("</script>");
	} // if end	
	
%>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>