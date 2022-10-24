<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header_pds.jsp" %>
 <!-- 본문 시작 pdsDel.jsp -->
 <!-- 글번호(pdsno)와 비밀번호(passwd)가 일치하면 행삭체 및 첨부파일 삭제하기 -->
<%
	int pdsno = Integer.parseInt(request.getParameter("pdsno"));
%>
<h3>사진 삭제</h3>
<div class="col-lg-2 hidden-ms"></div>
<div class="col-lg-8 container-fluid">
	<form method="post" action="pdsDelProc.jsp" onsubmit="return pwCheck3()"><!-- myscript.js -->
	<p style="text-align: right;"><a class="btn btn-default" href="pdsList.jsp">돌아가기</a></p>
	<input type="hidden" name="pdsno" id="pdsno" value="<%=pdsno%>">
		<table class="table table-striped">
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd" id="passwd" required></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="삭제" class="btn btn-default">
				</td>
			</tr>
		</table>	
	</form>
</div>
<div class="col-lg-2 hidden-ms"></div>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>