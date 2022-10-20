<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header_mem.jsp" %>
 <!-- 본문 시작 loginForm.jsp -->
 
 <%if(s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest")){ 
	// 아이디 저장 쿠키 확인 ---------------------------------------------------
	Cookie[] cookies = request.getCookies(); // 사용자 pc에 저장된 모든 쿠키값 가져오기
	String c_id = "";
	if(cookies!=null){ // 쿠키가 존재하는지?
		for(int i=0; i<cookies.length; i++){
			Cookie cookie = cookies[i]; // 쿠키 하나씩 가져오기
			if(cookie.getName().equals("c_id")==true){
				c_id = cookie.getValue();	
			} // if end
		} // for end
	} // if end
	
	// ------------------------------------------------------------------
 
 %>
	<h3 class="font2"> 로그인 </h3>
	<form name="loginfrm" id="loginfrm" action="loginProc.jsp" onsubmit="return loginCheck()"><!-- myscript.js -->
	<table class="table">
		<tr>
		    <td>
			   <input class="font3" type="text" name="id" id="id" value="<%=c_id%>" placeholder="아이디" maxlength="10" required>
		    </td>
		    <td rowspan="2" style="margin: auto; padding-top: 25px;">
			   <button type="submit" class="btn btn-default btn-lg">
			   		<span class="glyphicon glyphicon-log-in"></span> 로그인
			   </button>
		    </td>
		</tr>
		<tr>
		   <td>
		      <input class="font3" type="password" name="passwd" id="passwd" placeholder="비밀번호" maxlength="10" required>
		   </td>
		</tr>
		<tr>
		   <td colspan="2" class="font2">
		      <label><input type="checkbox" name="c_id" value="SAVE" <%if(!c_id.isEmpty()){out.print("checked");}%>> 아이디 저장</label>			  
			  &nbsp;&nbsp;&nbsp;
			  <a href="agreement.jsp"><button class="btn btn-default">회원가입</button></a>
			  &nbsp;&nbsp;&nbsp;
			  <input type="button" class="btn btn-default" value="아이디/비밀번호 찾기" onclick="findCheck()">
		   </td>
		</tr>		  
	</table>	
	</form>
<%
 } else {
	 // 로그인에 성공했다면
	 out.println("<strong>" + s_id + "</strong> 님<br>");
%>
	 <button type='button' class='btn btn-default' onclick="location.href='logout.jsp'">로그아웃</button>
	 <button type='button' class='btn btn-default' onclick="location.href='memberModify.jsp'">회원정보수정</button>
	 <button type='button' class='btn btn-default' onclick="location.href='memberWithdraw.jsp?id=<%=s_id%>'">회원탈퇴</button>
<%
 } // if end

%>
	
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>