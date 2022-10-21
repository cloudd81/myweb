<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_mem.jsp" %>
 <!-- 본문 시작 memberDrawProc.jsp -->
	<h3 class="font2">회원 탈퇴</h3>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd").trim();
	
	dto.setId(id);
	dto.setPasswd(passwd);
	
	int cnt = dao.draw(dto);
	if(cnt==0){
		out.print("비밀번호가 일치하지 않습니다");
		out.print("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else{
		out.print("<script>");
		out.print("		alert('삭제 되었습니다');");
		out.print(" 	location.href='../index.jsp';");
		out.print("</script>");
		
		Cookie[] cookies = request.getCookies() ;
		if(cookies != null){
			for(int i=0; i < cookies.length; i++){
				// 쿠키의 유효시간을 0으로 설정하여 만료시킨다
				cookies[i].setMaxAge(0) ;
				// 응답 헤더에 추가한다
				response.addCookie(cookies[i]) ;
			} // for end
		} // if end
		
	} // if end	
%>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>