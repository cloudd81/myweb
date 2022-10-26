<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_noti.jsp" %>
 <!-- 본문 시작 noticeUpdateProc.jsp -->
<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno"));
	String subject = request.getParameter("subject").trim();
	String content = request.getParameter("content").trim();
	
	dto.setNoticeno(noticeno);
	dto.setSubject(subject);
	dto.setContent(content);
	
	int cnt = dao.updateproc(dto);
	
	if(cnt==0){
		out.println("<p>게시글 수정에 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else{
		out.print("<script>");
		out.print("		alert('게시글이 수정되었습니다');");
		out.print(" 	location.href='noticeList.jsp?col=" + col + "&word=" + word + "';");
		out.print("</script>");
	} // if end	
	
%>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>