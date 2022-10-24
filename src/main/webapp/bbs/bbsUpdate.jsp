<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_bbs.jsp" %>
 <!-- 본문 시작 bbsUpdateForm.jsp -->
	<h3 class="font2"> 게시글 수정 </h3>
	<div class="container">
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	dto = dao.read(bbsno);
	if(dto==null){
		out.print("자료 없음!!");
		out.print("<a href='javascript:history.back()'>돌아가기</a>");
		
	} else{
%>	
		<form name="bbsfrm" id="bbsfrm" method="post" action="bbsUpdateProc.jsp" onsubmit="return updateCheck()">
			<input type="hidden" name="bbsno" value="<%=dto.getBbsno()%>">
			<input type="hidden" name="col" value="<%=col%>">
			<input type="hidden" name="word" value="<%=word%>">
		<table class="table table-responsive">
		<tr>
		   <th class="font2">작성자</th>
		   <td><input type="text" name="wname" id="wname" class="form-control font2" value="<%=dto.getWname()%>" maxlength="20" required></td>
		</tr>
		<tr>
		   <th class="font2">제목</th>
		   <td><input type="text" name="subject" id="subject" class="form-control font2" value="<%=dto.getSubject()%>" maxlength="100" required></td>
		</tr>
		<tr>
		   <th class="font2">내용</th>
		   <td><textarea rows="5"  class="form-control font2" name="content" id="content" required><%=dto.getContent()%></textarea></td>
		</tr>
		<tr>
		   <th class="font2">비밀번호</th>
		   <td><input type="password" name="passwd" id="passwd" class="form-control font2" maxlength="10" required></td>
		</tr>
		<tr>
		    <td colspan="2" align="center">
		       <input type="submit" value="수정" class="btn btn-default btn-block hg">
		       <input type="reset"  value="취소" class="btn btn-default btn-block hg">
		    </td>
		</table>	
		</form>
		
	<p style="text-align: right;"><a class="btn btn-default hg" href="bbsList.jsp">목록</a></p>
<%
	} // if end
%>
	</div>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>