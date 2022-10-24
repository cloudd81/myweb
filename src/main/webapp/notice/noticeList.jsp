<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_noti.jsp" %>
 <!-- 본문 시작 noticeList.jsp -->
	<h3 class="font2"> 공지사항 </h3>
	<div class="col-lg-2 hidden-ms"></div>
	<div class="col-lg-8">
	<table class="table table-condensed context">
	<tr>
		<th class="col-xs-5" style="text-align: center;">제목</th>
		<th class="col-xs-4" style="text-align: center;">이름</th>
		<th class="col-xs-3" style="text-align: center;">작성일</th>
	</tr>
	
<%
	// 한 페이지당 출력할 행의 개수
	int recordPerPage = 10;	

	ArrayList<NoticeDTO> list=dao.list(col, word, nowPage, recordPerPage);
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
					<a href="noticeRead.jsp?noticeno=<%=dto.getNoticeno()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"><%=dto.getSubject()%></a>
<%			
				// 오늘 작성한 글 제목 뒤에 new 이미지 출력
				// 작성일(regdt)에서 년월일만 자르기
				String regdt = dto.getRegdt().substring(0,10);
				if(regdt.equals(today)){
					out.print("<img src='../images/new.gif'>");
				}

%>			
				</td>
				<td class="col-xs-3"><%=dto.getContent()%></td>
				<td class="col-xs-2"><%=dto.getRegdt().substring(0,10)%></td>
			</tr>
<%
		} // for end
		
		// 글 갯수
		int totalRecord = dao.count(col, word);
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
<%
	if(s_mlevel.equals("A1")){
%>
		<p style="text-align: right;"><a class="btn btn-default font2" href="noticeForm.jsp">글쓰기</a></p>
<%
	} // if end
%>
	</div>
	<div class="col-lg-2 hidden-ms"></div>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>