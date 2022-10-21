<%@page import="java.security.AlgorithmParameterGeneratorSpi"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_pds.jsp" %>
 <!-- 본문 시작 pdsIns.jsp -->
	<h3>사진 올리기 결과</h3>
<%
	try {
		// 1) 첨부된 파일 저장하기
		String saveDirectory = application.getRealPath("/storage");
		int maxPostSize = 1024*1024*100;
		String encoding = "UTF-8";
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());

		// 2) 저장된 파일의 파일명, 파일 크기 가져오기
		String fileName = "";	// 파일명
		long fileSize = 0;		// 파일 크기
		File file = null;		// 실제 파일 담기
		String item = "";		// name="filename"

		Enumeration files = mr.getFileNames(); // mr에서 <input type=file> 전부 수거
		while(files.hasMoreElements()){
			item = (String)files.nextElement(); // filename
			fileName = mr.getFilesystemName(item); // mr객체에서 item이 가지고 있는 실제 파일명 가져오기
			if(fileName!=null){ // 실제 파일명을 가져왔다면
				file = mr.getFile(item); // mr에서 실제 파일 가져오기
				if(file.exists()){ // 실제 파일이 존재한다면
					fileSize = file.length(); // 파일 크기 가져오기
				} // if end
			} // if end
		} // while end

		// 3) tb_pds테이블 저장하기
		String wname = mr.getParameter("wname").trim();
		String subject = mr.getParameter("subject").trim();
		String passwd = mr.getParameter("passwd").trim();

		dto.setWname(wname);
		dto.setSubject(subject);
		dto.setPasswd(passwd);
		dto.setFilename(fileName);
		dto.setFilesize(fileSize);
		
		int cnt = dao.create(dto);
		if(cnt==0){
			out.println("<p>사진 추가 실패했습니다</p>");
			out.println("<p><a href='javascript:history.back()'>다시 시도</a></p>");
		} else {
			out.println("<script>");
			out.println("	alert('사진이 추가되었습니다')");
			out.println("	location.href='pdsList.jsp';");
			out.println("</script>");
		}
		
	} catch(Exception e) {
		out.print(e);
		out.print("<p>파일 업로드 실패</p>");
		out.print("<a href='javascript:history.back()'>다시 시도</a>");
	} finally {
		
	} // end
	
%>	
	
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>