<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_bbs.jsp" %>
 <!-- 본문 시작 bbsList.jsp -->
	<h3 class="font2">게시판 상세보기</h3>
	<div class="container">
		<div class="table-responsive">
		<table class="table context">
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno").trim());
	dto = dao.read(bbsno);
	if(dto==null){
		out.println("글이 없습니다");
	} else {
		dao.incrementCnt(bbsno); // 조회수 증가
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
			<th class="font2">조회수</th>			
			<td class="font2"><%=dto.getReadcnt()%></td>
		</tr>
		<tr>
			<th class="font2">작성일</th>	
			<td class="font2"><%=dto.getRegdt()%></td>
		</tr>
		<tr>
			<th class="font2">ip 주소</th>			
			<td class="font2"><%=dto.getIp()%></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a class="btn btn-default" href="bbsList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>">돌아가기</a>
				<a class="btn btn-default" href="bbsReply.jsp?bbsno=<%=dto.getBbsno()%>">답변 쓰기</a>
				<a class="btn btn-default" href="bbsUpdate.jsp?bbsno=<%=dto.getBbsno()%>&col=<%=col%>&word=<%=word%>">수정</a>
<%				if(s_mlevel.equals("A1")){%>
				<a class="btn btn-default" href="bbsDel.jsp?bbsno=<%=dto.getBbsno()%>">삭제</a>
<%				}// if end
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