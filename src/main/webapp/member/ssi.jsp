<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ssi.jsp 공통페이지(Server Side Include) --%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%@ page import="net.member.*" %>
<%@ page import="net.utility.*" %>

<jsp:useBean id="dao" class="net.member.MemberDAO" scope="page"/>
<jsp:useBean id="dto" class="net.member.MemberDTO" scope="page"/>

<%request.setCharacterEncoding("UTF-8");%>
