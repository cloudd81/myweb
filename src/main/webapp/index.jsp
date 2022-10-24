<%@page import="java.time.Clock"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./member/auth.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>index.jsp</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="./css/reset.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/quiple/hbios-sys@latest/hbios-sys.css">
  <script src="./js/myscript.js"></script>
  
  <!-- 사용자 정의 스타일과 자바스크립트 -->
  <!-- 주의사항 : CSS와 JS는 각 웹브라우저에서 쿠키삭제하고 확인할 것 -->
  <!-- layout.css import -->
  <link rel="stylesheet" href="./css/layout.css">
  <script src="./js/clock.js"></script>
  <script src="./js/scroll.js"></script>
</head>
<body>
 
<!-- 메인 카테고리 시작 -->
<nav id="indexbg" class="navbar navbar-default">
<div id="topbg" class="container-fluid text-center" style="background-image: url('./images/miniproj/topbg.png');">
  	<a href="<%=request.getContextPath()%>/index.jsp">
  		<img class="img-responsive" alt="ozlogo" src="./images/miniproj/logo.png" width="200px;" style="display:inline;">
  	</a>
</div>
<div class="container-fluid">
    <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
    <ul class="nav navbar-nav navbar-right">
        <li><a class="font2" href="./bbs/bbsList.jsp">게시판</a></li>
        <li><a class="font2" href="./notice/noticeList.jsp">공지사항</a></li>
        <li><a class="font2" href="./pds/pdsList.jsp">포토갤러리</a></li>
        <li><a class="font2" href="./mail/mailForm.jsp">메일보내기</a></li>
<%
	if(s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest")){ 
	// 아이디 저장 쿠키 확인 ---------------------------------------------------
	Cookie[] cookies = request.getCookies(); // 사용자 pc에 저장된 모든 쿠키값 가져오기
	String c_id = "";
	if(cookies!=null){ // 쿠키가 존재하는지?
		for(int i=0; i<cookies.length; i++){
			Cookie cookie = cookies[i]; // 쿠키 하나씩 가져오기
			if(cookie.getName().equals("c_id")==true){
				c_id = cookie.getValue();	
			} // if end
		} // for end
	} // if end
	
	// ------------------------------------------------------------------	 
%>
        <li>
        	<a class="font2" href="./member/loginForm.jsp">
        		<span class="glyphicon glyphicon-log-in"></span>
        		로그인
        	</a>
        </li>
<%
 	} else {
	 // 로그인에 성공했다면
%>	
        <li>
        	<a class="font2" href="./member/loginForm.jsp">
        		<span class="glyphicon glyphicon-user"></span>
        		<%=s_id%>님
        	</a>
        </li>
<%
 } // if end
%>
    </ul>
    </div>
</div>
</nav> <!-- 메인 카테고리 끝 -->

<!-- 본문 시작 -->
<div id="about" class="container-fluid">
  <div class="row">
  	<div class="col-sm-2"></div>
    <div class="col-sm-6">
      <h2 class="font1">옛날 옛적에</h2><br>
      <h4>캔자스의 대초원 한 가운데서 농부인 헨리 아저씨와 엠 아줌마와 함께 살던 도로시는 어느 날 불어온 큰 회오리바람에 휘말리게 되었습니다.<br>도로시의 집은 회오리와 함께 날아가게 되었고 도로시는 지하실에 숨어 있다가 그만 잠들어버렸조.<br>그러다 쿵 소리와 함께 잠에서 깨어나는데 누군가 말을 걸어오네요!</h4><br>
      <p class="font1">먼치킨의 나라에 온 것을 환영하네, 고귀한 마법사여!<br>동쪽의 사악한 마녀를 죽이고 우리를 속박에서 풀어줘서 고맙다네!</p>
      <br>
    </div>
    <div class="col-sm-2">
      <img alt="storm_in_house" src="./images/miniproj/house.jpg" style="padding-top: 10px;">
    </div>
    <div class="col-sm-2"></div>
  </div>
</div>


<div class="col-lg-1 hidden-ms"></div>
<div class="col-lg-10">
<div class="Container bgbox">
	<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-8 slideanim">
		<div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin: 50px;">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner" role="listbox">
		      <div class="item active text-center">
		        <img src="./images/miniproj/bn1.png" alt="banner1" width="600" height="350">
		        <div class="carousel-caption">
		          <h3 class="font1 textbox">마녀를 잡으러 가자고?</h3>
		          <h4 class="font1 textbox">우리 넷이서 괜찮을까?</h4>
		        </div>      
		      </div>
		
		      <div class="item">
		        <img src="./images/miniproj/bn3.png" alt="banner2" width="600" height="350">
		        <div class="carousel-caption">
		          <h3 class="font1 textbox">넷이서 간다고?</h3>
		          <h4 class="font1 textbox">에메랄드성을 넷이서? 미치지 않고서야?</h4>
		        </div>      
		      </div>
		      
		      <div class="item">
		        <img src="./images/miniproj/bn2.png" alt="banner3" width="600" height="350">
		        <div class="carousel-caption">
		          <h3 class="font1 textbox">새로운 친구가 필요해!</h3>
		          <h4 class="font1 textbox">누가 우리와 함께 해줄까?</h4>
		        </div>      
		      </div>
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		      <span class="sr-only">Next</span>
		    </a>
		</div><!-- myCarousel End -->
	</div>
	<div class="col-sm-2"></div>
	</div><!-- row end -->
</div>
<div class="col-lg-1 hidden-ms"></div>
</div><!-- First Container End -->

<!-- Content 시작 -->
<!-- 도로시와 친구들 소개 -->
<div class="container-fluid text-center">
    <div class="row slideanim">
        <!-- 본문 시작 -->
        <div class="col-sm-12">
			<span class="col-xs-6 col-sm-3">
				<img class="panel" alt="dorosi" src="./images/miniproj/dorosi.png">
				<br>
				<button class="btn btn-default margin2 font1" data-toggle="tooltip" data-placement="top" title="hey!">도로시</button>
			</span>
			<span class="col-xs-6 col-sm-3">
				<img class="panel" alt="tinman" src="./images/miniproj/tinman.png">
				<br>
				<button class="btn btn-default margin2 font1" data-toggle="tooltip" data-placement="top" title="hey!">양철 나무꾼</button>
			</span>
			<span class="col-xs-6 col-sm-3">
				<img class="panel" alt="scarecrow" src="./images/miniproj/scarecrow.png">
				<br>
				<button class="btn btn-default margin2 font1" data-toggle="tooltip" data-placement="top" title="hey!">허수아비</button>
			</span>
			<span class="col-xs-6 col-sm-3">
				<img class="panel" alt="rian" src="./images/miniproj/rian.png">
				<br>
				<button class="btn btn-default margin2 font1" data-toggle="tooltip" data-placement="top" title="hey!">겁쟁이 사자</button>
			</span>
        </div>
        <!-- 본문 끝 -->
    </div> <!-- row 끝 -->
</div> <!-- 도로시와 친구들 끝 -->

<!-- 시계 출력하기 -->
<div class="container font2 margin col-lg-12" id="clock">
	<div class="row">
	<table>
    	<tr>
    		<td>
	        	<script type="text/javascript">showtime()</script>
	        </td>
    	</tr>
	</table>
	</div> <!-- row end -->
</div> <!-- clock end -->
<br>
<!-- Content 끝 -->

<!-- Footer 시작 -->
<footer id="indexbg" class="container-fluid text-center">
	<div class="container-fluid">
	<a href="#myPage" title="To Top">
	  <span class="glyphicon glyphicon-chevron-up"></span>
	</a>
	<p style="color: #F1F1F1;">Copyright &copy; 김경환 cloudd81</p>
	</div> 
</footer>
<!-- Footer 끝 -->    

<script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
})
</script>


</body>
</html>
