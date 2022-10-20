<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_mem.jsp" %>
 <!-- 본문 시작 memberWithdraw.jsp -->
	<h3 class="font2">회원탈퇴</h3>
	<p><a href="../index.jsp">탈퇴 취소</a></p>
<%
	String id = request.getParameter("id").trim();
%>
	<div class="container">
		<form method="post" action="memberDrawProc.jsp" onsubmit="return pwCheck2()">
			<input type="hidden" name="id" id="id" value="<%=id%>">
			<table class="table table-default">
			<tr>
				<th>비밀번호를 입력해주세요</th>
				<td><input type="password" name="passwd" id="passwd" maxlength="10" required></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="삭제" class="btn btn-danger">
				</td>
			</tr>
			</table>
		</form>	
	</div>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>