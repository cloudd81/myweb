<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_bbs.jsp" %>
 <!-- 본문 시작 bbsReply.jsp -->
	<span class="font2"> 답변 쓰기 </span>

	<form name="bbsfrm" id="bbsfrm" method="post" action="bbsReplyProc.jsp" onsubmit="return bbsCheck()">
		<!-- 부모글번호 -->
		<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>">
			<table class="table table-responsive">
		<tr>
		   <th class="font2">작성자</th>
		   <td><input type="text" name="wname" id="wname" class="form-control font2" value="<%=s_id%>" maxlength="20" readonly></td>
		</tr>
		<tr>
		   <th class="font2">제목</th>
		   <td><input type="text" name="subject" id="subject" class="form-control font2" maxlength="100" required></td>
		</tr>
		<tr>
		   <th class="font2">내용</th>
		   <td><textarea rows="5"  class="form-control font2" name="content" id="content" required></textarea></td>
		</tr>
		<tr>
		   <th class="font2">비밀번호</th>
		   <td><input type="password" name="passwd" id="passwd" class="form-control font2" maxlength="10" required></td>
		</tr>
		<tr>
		    <td colspan="2" align="center">
		       <input type="submit" value="답글 쓰기" class="btn btn-default btn-block hg">
		       <input type="reset"  value="취소" class="btn btn-default btn-block hg">
		    </td>
		</table>	
		</form>
		
	<p style="text-align: right;"><a class="btn btn-default font2" href="bbsList.jsp">목록</a></p>

		
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>