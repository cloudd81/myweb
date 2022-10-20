<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_bbs.jsp" %>
 <!-- 본문 시작 bbsDelProc.jsp -->
	<h3 class="font2">글 삭제</h3>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd = request.getParameter("passwd").trim();
	
	dto.setBbsno(bbsno);
	dto.setPasswd(passwd);
	
	int cnt = dao.delete(dto);
	if(cnt==0){
		out.print("비밀번호가 일치하지 않습니다");
		out.print("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else{
		out.print("<script>");
		out.print("		alert('삭제 되었습니다');");
		out.print(" 	location.href='bbsList.jsp';");
		out.print("</script>");
	} // if end	
%>

 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>