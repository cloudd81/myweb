<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_mem.jsp" %>
 <!-- 본문 시작 memberProc.jsp -->
	<h3>* 회원가입 결과 페이지 *</h3>
<%
	String id = request.getParameter("id").trim();
	String passwd = request.getParameter("passwd").trim();
	String mname = request.getParameter("mname").trim();
	String email = request.getParameter("email").trim();
	String tel = request.getParameter("tel").trim();
	String zipcode = request.getParameter("zipcode").trim();
	String address1 = request.getParameter("address1").trim();
	String address2 = request.getParameter("address2").trim();
	String job = request.getParameter("job").trim();
	String hope = request.getParameter("hope").trim();

	dto.setId(id);
	dto.setPasswd(passwd);
	dto.setMname(mname);
	dto.setEmail(email);
	dto.setTel(tel);
	dto.setZipcode(zipcode);
	dto.setAddress1(address1);
	dto.setAddress2(address2);
	dto.setJob(job);
	dto.setHope(hope);
	
	int cnt = dao.join(dto);
	
	if(cnt==0){
		out.println("<p>도로시의 친구가 되지 못했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	} else{
		out.print("<script>");
		out.print("		alert('도로시의 친구가 되셨습니다');");
		out.print(" 	location.href='../index.jsp';");
		out.print("</script>");
	} // if end	

%>
	
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>