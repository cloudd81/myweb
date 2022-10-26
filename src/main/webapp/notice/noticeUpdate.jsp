<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_noti.jsp" %>
 <!-- 본문 시작 noticeUpdate.jsp -->
	<h3 class="font2"> 게시글 수정 </h3>
	<div class="container">
<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno"));
	dto = dao.read(noticeno);
	if(dto==null){
		out.print("자료 없음!!");
		out.print("<a href='javascript:history.back()'>돌아가기</a>");
		
	} else{
%>	
		<form name="noticefrm" id="noticefrm" method="post" action="noticeUpdateProc.jsp" onsubmit="return noticeCheck()">
			<input type="hidden" name="noticeno" value="<%=dto.getNoticeno()%>">
			<input type="hidden" name="col" value="<%=col%>">
			<input type="hidden" name="word" value="<%=word%>">
		<tr>
		   <th class="font2">작성자</th>
		   <td><input type="text" name="wname" id="wname" class="form-control font2" value="<%=s_id%>" maxlength="20" readonly></td>
		</tr>
		<tr>
		   <th class="font2">제목</th>
		   <td><input type="text" name="subject" id="subject" class="form-control font2" maxlength="100" value="<%=dto.getSubject()%>" required></td>
		</tr>
		<tr>
		   <th class="font2">내용</th>
		   <td><textarea rows="5"  class="form-control font2" name="content" id="content" value="<%=dto.getContent()%>" required></textarea></td>
		</tr>
		<tr>
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