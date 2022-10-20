<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ssi.jsp" %>
<%@ include file="../header_bbs.jsp" %>
 <!-- 본문 시작 bbsDel.jsp -->
	<h3 class="font2">글 삭제</h3>
	<p><a href="bbsList.jsp">글 목록</a></p>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno").trim());
%>
	<div class="container">
		<form method="post" action="bbsDelProc.jsp" onsubmit="return pwCheck()">
			<input type="hidden" name="bbsno" id="bbsno" value="<%=bbsno%>">
			<table class="table">
			<tr>
				<th class="success">비밀번호</th>
				<td><input type="password" name="passwd" id="passwd" required></td>
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