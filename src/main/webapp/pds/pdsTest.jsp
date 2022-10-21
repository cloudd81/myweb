<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
	  .ck-editor__editable { height: 400px; }
	</style>
<head>
	<meta charset="UTF-8">
	<title>pdsTest.jsp</title>
</head>
<body>
	<h3>파일 첨부 테스트</h3>
	<form method="post" action="pdsTestProc.jsp" enctype="multipart/form-data">
<!-- 						파일 첨부시 반드시 필요, 스트링값과 파일데이터를 함께 전송하겠다는 의미 -->
<!-- 		이름: <input type="text" name="uname"> <br> -->
<!-- 		제목: <input type="text" name="subject"> <br> -->
<!-- 		내용: <textarea rows="5" cols="20" name="content"></textarea> <br> -->
<!-- 		첨부: <input type="file" name="filenm"><br> -->
<!-- 		<input type="submit" value="전송"> -->
<!-- 	</form> -->

<!-- CKEditor 사용하기 -->
		<textarea name="text" id="editor"></textarea>
		<input type="submit" value="전송">
	</form>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
    <script>
        ClassicEditor.create( document.querySelector( '#editor' ),{
      	  language: "ko"
        } );
     </script>
</body>
</html>