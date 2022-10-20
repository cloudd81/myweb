<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_bbs.jsp" %>
 <!-- 본문 시작 -->
	<h3 class="font2"> 게시판 </h3>
	<div class="col-lg-2 hidden-ms"></div>
	<div class="col-lg-8">
	<table class="table table-condensed context">
	<tr>
		<th class="col-xs-6" style="text-align: center;">제목</th>
		<th class="col-xs-3" style="text-align: center;">이름</th>
		<th class="col-xs-1" style="text-align: center;">작성일</th>
		<th class="col-xs-2" style="text-align: center;">조회수</th>
	</tr>
	
<%
	// 한 페이지당 출력할 행의 개수
	int recordPerPage = 10;	

	ArrayList<BbsDTO> list=dao.list3(col, word, nowPage, recordPerPage);
	if(list==null){
		out.print("<tr>");
		out.print("	<td class='font2' colspan='5'>글없음!!</td>");
		out.print("</tr>");
	} else {
		
		// 오늘 날짜를 문자열 "2022-10-22"로 만들기
		String today = Utility.getDate();
		
		for(int idx=0; idx<list.size(); idx++){
			dto=list.get(idx);
						
%>
			<tr>
				<td class="col-xs-6 font3" style="padding-left: 20px;">
<%
			//답변 이미지 출력
			for(int n=1; n<=dto.getIndent(); n++){
				out.println("<img src='../images/reply.gif'>");
			}
%>
				<a href="bbsRead.jsp?bbsno=<%=dto.getBbsno()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"><%=dto.getSubject()%></a>
<%			


				// 오늘 작성한 글 제목 뒤에 new 이미지 출력
				// 작성일(regdt)에서 년월일만 자르기
				String regdt = dto.getRegdt().substring(0,10);
				if(regdt.equals(today)){
					out.print("<img src='../images/new.gif'>");
				}
				
				// 조회수가 10 이상이면 hot 이미지 출력
				if(dto.getReadcnt()>=10){
					out.print("<img src='../images/hot.gif'>");
				} // if end

%>			
				</td>
				<td class="col-xs-3"><%=dto.getWname()%></td>
				<td class="col-xs-2"><%=dto.getRegdt().substring(0,10)%></td>
				<td class="col-xs-2"><%=dto.getReadcnt()%></td>
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
		out.println("	<td colspan='4' style='text-align: center; height: 20px;'>");
		String paging = new Paging().paging4(totalRecord, nowPage, recordPerPage, col, word, "bbsList.jsp");
		out.print(paging);
		out.println("	</td>");
		out.println("</tr>");
%>
		<!-- 검색 시작 -->
		<tr>
			<td colspan="4" style="text-align: center; height: 50px;">
				<form action="bbsList.jsp" onsubmit="return searchCheck()">
					<select name="col">
						<option value="subject_content">제목+내용
						<option value="subject">제목
						<option value="content">내용
						<option value="wname">작성자
					</select>
					<input type="text" name="word" id="word">
					<input type="submit" value="검색" class="btn btn-primary">
				</form>
			</td>		
		</tr>
		<!-- 검색끝 -->
<%		
	} // if end
%>
			
	</table>
	<p style="text-align: right;"><a class="btn btn-default font2" href="bbsForm.jsp">글쓰기</a></p>
	</div>
	<div class="col-lg-2 hidden-ms"></div>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>