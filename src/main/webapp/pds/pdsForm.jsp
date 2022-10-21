<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header_pds.jsp" %>
 <!-- 본문 시작 pdsForm.jsp -->
	<h3>사진 올리기</h3>
	<a href="pdsList.jsp">목록</a>
	<form method="post" action="pdsIns.jsp" enctype="multipart/form-data" onsubmit="return pdsCheck()"><!-- myscript.js -->
	<table class="table">
		<tr>
		    <th>이름</th>
		    <td style="text-align: left"><input type="text" name="wname" id="wname" size="20" maxlength="100" required autofocus></td>
		</tr>
		<tr>
		    <th>제목</th>
		    <td style="text-align: left">
		    	<textarea rows="5" cols="30" name="subject" id="subject"></textarea>
		    </td>
		</tr>
		<tr>
		    <th>비밀번호</th>
		    <td style="text-align: left"><input type="password" name="passwd" id="passwd" required></td>
		</tr>
		<tr>
		    <th>첨부파일</th>
		    <td style="text-align: left"><input type="file" name="filename" id="filename"></td>
		</tr>
		<tr>
		    <td colspan="2">
		    	  <input type="submit" value="사진 올리기" class="btn btn-success">
		    	  <input type="reset"  value="취소"      class="btn btn-danger">
		    </td>
		</tr>
	</table>
	</form>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>