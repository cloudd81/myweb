<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_pds.jsp" %>
 <!-- 본문 시작 pdsRead.jsp -->
<h3>포토 갤러리 상세보기</h3>
<p style="text-align: right;"><a class="btn btn-default font2" href="pdsForm.jsp">사진 올리기</a></p>
	<div class="container">
		<div class="table-responsive">
		<table class="table context" id="pds_tb">
<%
	int pdsno = Integer.parseInt(request.getParameter("pdsno"));
	dto = dao.read(pdsno);
	if(dto==null){
		out.println("해당 글 없음");
	} else {
		dao.incrementCnt(pdsno); // 조회수 증가
	} // if end
%>
		<tr>
			<td>글 제목</td>			
			<td><%=dto.getSubject()%></td>
		</tr>
		<tr>
			<td>사진</td>			
			<td><img src="../storage/<%=dto.getFilename()%>"></td>
		</tr>
		<tr>
			<td>파일 크기</td>			
			<td><%=Utility.toUnitStr(dto.getFilesize())%></td>
		</tr>
		<tr>
			<td>작성자</td>	
			<td><%=dto.getWname()%></td>
		</tr>
		<tr>
			<td>작성일</td>	
			<td><%=dto.getRegdate()%></td>
		</tr>
		<tr>
			<td>조회수</td>	
			<td><%=dto.getReadcnt()%></td>
		</tr>
		</table>
		</div>
	</div>

 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>