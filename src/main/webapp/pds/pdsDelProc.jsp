<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_pds.jsp" %>
 <!-- 본문 시작 pdsDelProc.jsp -->
<h3>사진 삭제 결과</h3>
<%
	int pdsno = Integer.parseInt(request.getParameter("pdsno"));
	String passwd = request.getParameter("passwd").trim();
	String saveDir = application.getRealPath("/storage"); // 첨부된 파일을 삭제하기 위해 파일 저장 실제 경로
	
	int cnt = dao.delete(pdsno, passwd, saveDir);
	if(cnt==0){
		out.print("비밀번호가 일치하지 않습니다");
		out.print("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else{
		out.print("<script>");
		out.print("		alert('글과 사진이 삭제 되었습니다');");
		out.print(" 	location.href='pdsList.jsp';");
		out.print("</script>");
	} // if end	
	
%>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>