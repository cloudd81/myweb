<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header_noti.jsp" %>
 <!-- 본문 시작 -->
	<h3 class="font2">글 삭제</h3>
<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno").trim());
%>
	<div class="container">
		<form method="post" action="noticeDelProc.jsp">
			<input type="hidden" name="noticeno" id="noticeno" value="<%=noticeno%>">
			<table class="table">
			<tr>
				<td colspan="2">
					삭제 버튼을 누르면 게시글이 삭제되고 복구할 수 없습니다.<br>계속 할까요?
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="삭제" class="btn btn-danger">
					<a href="noticeList.jsp" class="btn btn-default">목록으로 돌아가기</a>
				</td>
			</tr>
			</table>
		</form>	
	</div>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>