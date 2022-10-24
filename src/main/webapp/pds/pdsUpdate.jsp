<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_pds.jsp" %>
 <!-- 본문 시작 pdsUpdate.jsp -->
	<h3 class="font2"> 게시글 수정 </h3>
	<div class="container">
<%
	int pdsno = Integer.parseInt(request.getParameter("pdsno"));
	dto = dao.read(pdsno);
	if(dto==null){
		out.print("자료 없음!!");
		out.print("<a href='javascript:history.back()'>돌아가기</a>");
		
	} else{
%>	
	<form method="post" action="pdsUpdateProc.jsp" enctype="multipart/form-data" onsubmit="return pdsCheck2()"><!-- myscript.js -->
			<input type="hidden" name="pdsno" value="<%=pdsno%>">
			<input type="hidden" name="col" value="<%=col%>">
			<input type="hidden" name="word" value="<%=word%>">
	<table class="table">
		<tr>
		    <th>이름</th>
		    <td style="text-align: left"><input type="text" name="wname" id="wname" size="20" value="<%=dto.getWname()%>" maxlength="100" required autofocus></td>
		</tr>
		<tr>
		    <th>제목</th>
		    <td style="text-align: left">
		    	<textarea rows="5" cols="30" name="subject" id="subject"><%=dto.getSubject()%></textarea>
		    </td>
		</tr>
		<tr>
		    <th>비밀번호</th>
		    <td style="text-align: left"><input type="password" name="passwd" id="passwd" value="<%=dto.getPasswd()%>" required></td>
		</tr>
		<tr>
		    <th>첨부파일</th>
		    <td style="text-align: left"><input type="file" name="filename" id="filename" value="<%=dto.getFilename()%>"></td>
		</tr>
		<tr>
		    <td colspan="2">
		    	  <input type="submit" value="사진 올리기" class="btn btn-success">
		    	  <input type="reset"  value="취소"      class="btn btn-danger">
		    </td>
		</tr>
	</table>
	</form>
		
	<p style="text-align: right;"><a class="btn btn-default hg" href="pdsList.jsp">목록</a></p>
<%
	} // if end
%>
	</div>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>