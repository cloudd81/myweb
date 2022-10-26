<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_noti.jsp" %>
 <!-- 본문 시작 noticeRead.jsp -->
	<h3 class="font2">공지사항 상세보기</h3>
	<div class="container">
		<div class="table-responsive">
		<table class="table context">
<%
	int noticeno = Integer.parseInt(request.getParameter("noticeno").trim());
	dto = dao.read(noticeno);
	if(dto==null){
		out.println("글이 없습니다");
	} else {
%>
		<tr>
			<th class="font2">글 제목</th>			
			<td class="font2"><%=dto.getSubject()%></td>
		</tr>
		<tr>
			<th class="font2">글 내용</th>			
			<td class="font2" style="text-align: left; padding-left: 20px">
<%
			// 특수문자로 치환하기
			// 사용자가 입력한 엔터(\n)를 <br>태그로 바꾸기
			String content = Utility.convertChar(dto.getContent());
			out.print(content);
%>
			</td>
		</tr>
		<tr>
			<th class="font2">작성일</th>	
			<td class="font2"><%=dto.getRegdt()%></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a class="btn btn-default" href="noticeList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>">돌아가기</a>
<%			if(s_mlevel.equals("A1")){%>
				<a class="btn btn-default" href="noticeUpdate.jsp?noticeno=<%=dto.getNoticeno()%>&col=<%=col%>&word=<%=word%>">수정</a>
				<a class="btn btn-default" href="noticeDel.jsp?noticeno=<%=dto.getNoticeno()%>">삭제</a>
<%			}// if end
%>
			</td>
		</tr>
<%		
	} // if end
%>		
		</table>
		</div>
	</div>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>