<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ssi.jsp" %>
<%@ include file="../header_bbs.jsp" %>
 <!-- 본문 시작 -->
		<h3>* 성적 입력 결과 페이지 *</h3>
<%
	request.setCharacterEncoding("UTF-8");
	String wname = request.getParameter("wname").trim();
	String subject = request.getParameter("subject").trim();
	String content = request.getParameter("content").trim();
	String passwd = request.getParameter("passwd").trim();
	String ip = request.getRemoteAddr();
	
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setIp(ip);
	
	int cnt = dao.create(dto);
	
	if(cnt==0){
		out.println("<p>게시판 업로드에 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else{
		out.print("<script>");
		out.print("		alert('게시판에 업로드되었습니다');");
		out.print(" 	location.href='bbsList.jsp';");
		out.print("</script>");
	} // if end	
	
%>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>