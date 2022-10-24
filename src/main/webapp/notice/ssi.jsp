<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ssi.jsp 공통페이지(Server Side Include) --%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.notice.*" %>
<%@ page import="net.utility.*" %>

<jsp:useBean id="dao" class="net.notice.NoticeDAO" scope="page"/>
<jsp:useBean id="dto" class="net.notice.NoticeDTO" scope="page"/>

<%request.setCharacterEncoding("UTF-8");%>

<%
	// 검색 ------------------------------------------------------------
	String word = request.getParameter("word");	// 검색어
	String col = request.getParameter("col");	// 검색어
	word = Utility.checkNull(word);
	col = Utility.checkNull(col);
	
	// 현재 페이지 --------------------------------------------------------
	int nowPage=1;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	} // if end

%>