<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_mem.jsp" %>
 <!-- 본문 시작 memberDrawProc.jsp -->
	<h3 class="font2">회원 탈퇴</h3>
<%	
	dto.setId((String)session.getAttribute("s_id"));
	dto.setPasswd(request.getParameter("passwd").trim());
	
	int cnt = dao.draw(dto);
	if(cnt==0){
		out.print("비밀번호가 일치하지 않습니다");
		out.print("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else{
		session.removeAttribute("s_id");
		session.removeAttribute("s_passwd");
		session.removeAttribute("s_mlevel");
		
		String message = "";
		message += "회원 탈퇴 되었습니다, 이용해주셔서 감사합니다.\\n";
		message += "재가입을 원할 경우 이메일로 문의하시기 바랍니다.";
		out.print("<script>");
		out.print("		alert('" + message + "');");
		out.print(" 	location.href='loginForm.jsp';");
		out.print("</script>");		
	} // if end	
%>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>