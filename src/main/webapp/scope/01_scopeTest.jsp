<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>01_scopeTest.jsp</title>
</head>
<body>
	<h3>내장객체 및 내부변수</h3>
<%
/*
	● [JSP 내장객체]
	 - JSP 페이지가 서블릿에서 변환될 때(.class) JSP 컨테이너(Tomcat 웹서버)에서 자동적으로 제공
	 - JSP 페이지 내에서 제공하는 특수한 레퍼런스(참조) 타입의 변수
	 - 객체 생성 없이 바로 사용할 수 있는 JSP 객체
	 
	1) out 			: 출력 객체
	2) pageContext 	: JSP 페이지 자체의 Context 제공
	3) request 		: 요청에 관한 정보
	4) response 	: 응답에 관한 정보
	5) sesstion 	: 요청에 관한 Context 제공
	6) application 	: 서블릿 및 외부 환경 정보 Context 제공

	///////////////////////////////////////////////////////////////////////////
	
	● [Scope의 종류]
	 - myweb 프로젝트에서 페이지들간의 값을 공유하기 위해 사용
	 1) pageContext 	: 현재 페이지에서만 유효하며 기본값이다.
 	 2) request 		: 부모 페이지와 자식 페이지에서만 유효하다.
 	 3) sesstion 		: myweb 프로젝트의 모든 페이지에서 유효하다(사용자 개별 접근, 시간).
 	 4) application 	: myweb 프로젝트의 모든 페이지에서 유효하다(모든 사용자 접근, 서버 정보).

	///////////////////////////////////////////////////////////////////////////

	● [내부변수 선언 형식] - 별도의 자료형이 없다.
	1) pageContext.setAttribute("변수명", 값);
 	2) request.setAttribute("변수명", 값);
 	3) session.setAttribute("변수명", 값);
 	4) application.setAttribute("변수명", 값);
 	
	● [내부변수값 가져오기] - 별도의 자료형이 없다.
	1) pageContext.getAttribute("변수명", 값);
 	2) request.getAttribute("변수명", 값);
 	3) session.getAttribute("변수명", 값);
 	4) application.getAttribute("변수명", 값);
 	

*/
	// 각 내부변수에 값 올리기
	pageContext.setAttribute("kor", 100);
 	request.setAttribute("eng", 200);
 	session.setAttribute("mat", 300);
 	application.setAttribute("uname", "ITWILL");
	
 	// 내부 변수 값 가져오기
 	out.print(pageContext.getAttribute("kor"));
	out.print("<hr>");
	out.print(pageContext.getAttribute("eng"));
	out.print("<hr>");
	out.print(pageContext.getAttribute("mat"));
	out.print("<hr>");
	out.print(pageContext.getAttribute("uname"));
	out.print("<hr>");
	
	Object obj = pageContext.getAttribute("kor");
	int kor = (int)obj;
	int eng = (int)request.getAttribute("eng");
	int mat = (int)session.getAttribute("mat");
	String uname = (String)application.getAttribute("uname");
	
	out.print("1) pageContext 영역 : " + kor + "<hr>");
	out.print("2) request 영역 : " + eng + "<hr>");
	out.print("3) session 영역 : " + mat + "<hr>");
	out.print("4) application 영역 : " + uname + "<hr>");
	
	// 내부변수 삭제
	pageContext.removeAttribute("kor");
	request.removeAttribute("eng");
	session.removeAttribute("mat");
	application.removeAttribute("uname");
	
	// null값 반환
	out.print("1) pageContext 영역 : " + pageContext.getAttribute("kor") + "<hr>");
	out.print("2) request 영역 : " + request.getAttribute("eng") + "<hr>");
	out.print("3) session 영역 : " + session.getAttribute("mat") + "<hr>");
	out.print("4) application 영역 : " + application.getAttribute("uname") + "<hr>");
	
%>
</body>
</html>