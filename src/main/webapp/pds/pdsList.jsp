<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_pds.jsp" %>
 <!-- 본문 시작 pdsList.jsp -->
	<h3 class="font2"> 포토 갤러리 </h3>
	<div class="alert alert-warning" style="font-size: 15px; margin: auto; padding: 6px; width: 80%;">
	  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	  <strong>사진이 너무 작아요?</strong> 제목을 누르면 사진을 확대해서 볼 수 있어요!
	</div>
	<div class="col-lg-2 hidden-ms"></div>
	<div class="col-lg-8">
	<table class="table table-striped context">
<%
//한 페이지당 출력할 행의 개수
	int recordPerPage = 10;	

	ArrayList<PdsDTO> list=dao.list3(col, word, nowPage, recordPerPage);
	if(list==null){
		out.print("<tr>");
		out.print("	<td class='font2' colspan='3'>게시글이 없습니다</td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print(" <td class='font2' colspan='3'><a style='color:#14C38E;' href='javascript:history.back();'>뒤로 가기</a></td>");
		out.print("</tr>");
	} else {
		String today = Utility.getDate();
%>
		<thead>
			<tr>
				<th class="col-xs-3" style="text-align: center;">제목</th>
				<th class="col-xs-3" style="text-align: center;">사진</th>
				<th class="col-xs-2" style="text-align: center;">조회수</th>
				<th class="col-xs-2" style="text-align: center;">작성자</th>
				<th class="col-xs-2" style="text-align: center;">작성일</th>
			</tr>
		</thead>
		<tbody>
<%
		for(int i=0; i<list.size(); i++){
			dto=list.get(i);
%>	
			<tr>
				<td><a href="pdsRead.jsp?pdsno=<%=dto.getPdsno()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"><%=dto.getSubject()%></a>
<%
				// new 이미지 띄우기
				String regdt = dto.getRegdate().substring(0,10);
				if(regdt.equals(today)){
					out.print("<img src='../images/new.gif'>");
				}
				// 조회수가 10 이상이면 hot 이미지 출력
				if(dto.getReadcnt()>=10){
					out.print("<img src='../images/hot.gif'>");
				} // if endc
%>
				</td><td><img src="../storage/<%=dto.getFilename()%>" width="50px;"></td>
				<td><%=dto.getReadcnt()%></td>
				<td><%=dto.getWname()%></td>
				<td><%=dto.getRegdate().substring(0,10)%></td>
			</tr>
<%
		} // for end
		
		// 글 갯수
		int totalRecord = dao.count2(col, word);
		out.println("<tr>");
		out.println("	<td colspan='4' style='text-align:right;'>");
		out.println("		글 갯수 : <strong>" + totalRecord + "</strong>");
		out.println("	<td>");
		out.println("</tr>");
		
		// 페이지 리스트
		out.println("<tr>");
		out.println("	<td colspan='5' style='text-align: center; height: 20px;'>");
		String paging = new Paging().paging4(totalRecord, nowPage, recordPerPage, col, word, "pdsList.jsp");
		out.print(paging);
		out.println("	</td>");
		out.println("</tr>");
%>
		<!-- 검색 시작 -->
		<tr>
			<td colspan="4" style="text-align: center; height: 50px;">
				<form action="pdsList.jsp" onsubmit="return searchCheck()">
					<select name="col">
						<option value="wname_subject">작성자+제목
						<option value="wname">작성자
						<option value="subject">제목
					</select>
					<input type="text" name="word" id="word">
					<input type="submit" value="검색" class="btn btn-primary">
				</form>
			</td>
<%
	} // if end
%>	
			<td>
				<p style="text-align: right;"><a class="btn btn-default font2" href="pdsForm.jsp">사진 올리기</a></p>
			</td>
		</tr>
		<!-- 검색끝 -->
	</tbody>	
	</table>
	</div>
	<div class="col-lg-2 hidden-ms"></div>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>