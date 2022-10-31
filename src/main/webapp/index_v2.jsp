<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="auth.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>index.jsp</title>
    <link rel="stylesheet" href="css/reset.css">
    <!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Bootstrap Icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Bootstrap 3 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="css/styles.css" rel="stylesheet" />
	<!-- layout.css import -->
	<link rel="stylesheet" href="./css/layout.css">
	<!-- 시계 js 파일 -->
	<script src="./js/clock.js"></script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">
        	<img class="img-responsive" alt="ozlogo" src="./images/miniproj/logo.png" width="150px;" style="display:inline;">
        </a>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto my-2 my-lg-0">
                <li class="nav-item"><a class="nav-link" href="./bbs/bbsList.jsp" style="font-size: 15px;">게시판</a></li>
                <li class="nav-item"><a class="nav-link" href="./notice/noticeList.jsp" style="font-size: 15px;">공지사항</a></li>
                <li class="nav-item"><a class="nav-link" href="./pds/pdsList.jsp" style="font-size: 15px;">포토갤러리</a></li>
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
		        <li class="nav-item">
		        	<a class="nav-link font2" href="./member/loginForm.jsp" style="font-size: 15px;">
		        		<i class="bi bi-box-arrow-in-right"></i> 로그인
		        	</a>
		        </li>
		<%
		 	} else {
			 // 로그인에 성공했다면
		%>	
		        <li class="nav-item">
		        	<a class="nav-link font2" href="./member/loginForm.jsp" style="font-size: 15px;">
		        		<i class="bi bi-person-circle"></i> <%=s_id%>님
		        	</a>
		        </li>
		<%
		 } // if end
		%>
                </ul>
       </div>
   </div>
</nav>
      <!-- 본문 시작 -->
<header class="masthead">
    <div class="container px-4 px-lg-5 h-100">
        <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
		<div id="about" class="container-fluid">
		  <div class="row">
		  	<div class="col-sm-2"></div>
		    <div class="col-sm-6">
		      <h2 class="text-white font1" style="font-size: 45px;">옛날 옛적에</h2><br>
		      <h4 class="text-white" style="font-size: 20px;">캔자스의 대초원 한 가운데서 농부인 헨리 아저씨와 엠 아줌마와 함께 살던 도로시는 어느 날 불어온 큰 회오리바람에 휘말리게 되었습니다.<br>도로시의 집은 회오리와 함께 날아가게 되었고 도로시는 지하실에 숨어 있다가 그만 잠들어버렸조.<br>그러다 쿵 소리와 함께 잠에서 깨어나는데 누군가 말을 걸어오네요!</h4><br>
		      <p class="text-white-75 font1" style="font-size: 15px;">먼치킨의 나라에 온 것을 환영하네, 고귀한 마법사여!<br>동쪽의 사악한 마녀를 죽이고 우리를 속박에서 풀어줘서 고맙다네!</p>
		      <br>
		    </div>
		    <div class="col-sm-2">
		      <img alt="storm_in_house" src="./images/miniproj/house.jpg" style="padding-top: 10px;">
		    </div>
		    <div class="col-sm-2"></div>
		  </div>
		</div>
	</div>
</div>
</header>


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
    <div class="row col-sm-12 slideanim">
        <!-- 본문 시작 -->
        <div class="col-sm-12">
			<span class="col-xs-6 col-sm-3">
				<img class="panel" alt="dorosi" src="./images/miniproj/dorosi.png">
			</span>
			<span class="col-xs-6 col-sm-3">
				<img class="panel" alt="tinman" src="./images/miniproj/tinman.png">
			</span>
			<span class="col-xs-6 col-sm-3">
				<img class="panel" alt="scarecrow" src="./images/miniproj/scarecrow.png">
			</span>
			<span class="col-xs-6 col-sm-3">
				<img class="panel" alt="rian" src="./images/miniproj/rian.png">
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
	<a href="#myPage" title="To Top">
	  <span class="glyphicon glyphicon-chevron-up logo"></span>
	</a>
	<div class="container-fluid">
	<p style="color: #F1F1F1;">Copyright &copy; 김경환 cloudd81</p>
	</div> 
</footer>
<!-- Footer 끝 -->

<!-- 모달 -->
<!-- Modal 1-->
<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Log Cabin</h2>
                            <!-- Icon Divider-->
                            <div class="divider-custom">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                <div class="divider-custom-line"></div>
                            </div>
                            <!-- Portfolio Modal - Image-->
                            <img class="img-fluid rounded mb-5" src="assets/img/portfolio/cabin.png" alt="..." />
                            <!-- Portfolio Modal - Text-->
                            <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                            <button class="btn btn-primary" data-bs-dismiss="modal">
                                <i class="fas fa-xmark fa-fw"></i>
                                Close Window
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Portfolio Modal 2-->
<div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" aria-labelledby="portfolioModal2" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Tasty Cake</h2>
                            <!-- Icon Divider-->
                            <div class="divider-custom">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                <div class="divider-custom-line"></div>
                            </div>
                            <!-- Portfolio Modal - Image-->
                            <img class="img-fluid rounded mb-5" src="assets/img/portfolio/cake.png" alt="..." />
                            <!-- Portfolio Modal - Text-->
                            <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                            <button class="btn btn-primary" data-bs-dismiss="modal">
                                <i class="fas fa-xmark fa-fw"></i>
                                Close Window
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Portfolio Modal 3-->
<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" aria-labelledby="portfolioModal3" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Circus Tent</h2>
                            <!-- Icon Divider-->
                            <div class="divider-custom">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                <div class="divider-custom-line"></div>
                            </div>
                            <!-- Portfolio Modal - Image-->
                            <img class="img-fluid rounded mb-5" src="assets/img/portfolio/circus.png" alt="..." />
                            <!-- Portfolio Modal - Text-->
                            <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                            <button class="btn btn-primary" data-bs-dismiss="modal">
                                <i class="fas fa-xmark fa-fw"></i>
                                Close Window
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Portfolio Modal 4-->
<div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" aria-labelledby="portfolioModal4" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
            <div class="modal-body text-center pb-5">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <!-- Portfolio Modal - Title-->
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Controller</h2>
                            <!-- Icon Divider-->
                            <div class="divider-custom">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                                <div class="divider-custom-line"></div>
                            </div>
                            <!-- Portfolio Modal - Image-->
                            <img class="img-fluid rounded mb-5" src="assets/img/portfolio/game.png" alt="..." />
                            <!-- Portfolio Modal - Text-->
                            <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                            <button class="btn btn-primary" data-bs-dismiss="modal">
                                <i class="fas fa-xmark fa-fw"></i>
                                Close Window
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
      
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
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
