<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_bbs.jsp" %>
<!-- 본문 시작 bbsUpdateProc.jsp -->
<h3>* 수정 결과 페이지 *</h3>
<!-- 수정 요청한 정보를 가져와서 DB에 가서 행 수정하기 -->
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String wname = request.getParameter("wname").trim();
	String subject = request.getParameter("subject").trim();
	String content = request.getParameter("content").trim();
	String passwd = request.getParameter("passwd").trim();
	String ip = request.getRemoteAddr();
	
	dto.setBbsno(bbsno);
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setIp(ip);
	
	int cnt = dao.updateproc(dto);
	
	if(cnt==0){
		out.println("<p>게시글 수정에 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else{
		out.print("<script>");
		out.print("		alert('게시글이 수정되었습니다');");
		out.print(" 	location.href='bbsList.jsp?col=" + col + "&word=" + word + "';");
		out.print("</script>");
	} // if end	
	
%>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>