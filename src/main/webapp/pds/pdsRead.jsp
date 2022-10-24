<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_pds.jsp" %>
 <!-- 본문 시작 pdsRead.jsp -->
<h3>포토 갤러리 상세보기</h3>
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
			<td><img src="../storage/<%=dto.getFilename()%>" style="width: 80%;"></td>
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
		<tr>
			<td colspan="2" align="center">
				<a class="btn btn-default" href="pdsList.jsp">돌아가기</a>
				<a class="btn btn-default" href="pdsUpdate.jsp?pdsno=<%=pdsno%>&col=<%=col%>&word=<%=word%>">수정</a>
				<a class="btn btn-default" href="pdsDel.jsp?pdsno=<%=pdsno%>">삭제</a>
			</td>
		</tr>
		
		
		</table>
		</div>
	</div>

 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>