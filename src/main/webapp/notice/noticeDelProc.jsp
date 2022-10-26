<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_noti.jsp" %>
 <!-- 본문 시작 noticeDelProc.jsp -->
	<h3 class="font2">글 삭제</h3>
<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno"));
	
	dto.setNoticeno(noticeno);
	
	int cnt = dao.delete(dto);
	if(cnt==0){
		out.print("삭제 실패했습니다");
		out.print("<p><a href='javascript:history.back()'>[돌아가기]</a></p>");
	} else{
		out.print("<script>");
		out.print("		alert('삭제 되었습니다');");
		out.print(" 	location.href='noticeList.jsp';");
		out.print("</script>");
	} // if end	
%>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>