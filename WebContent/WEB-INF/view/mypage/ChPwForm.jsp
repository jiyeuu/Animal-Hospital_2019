<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
	<title>비밀번호 변경</title>
   
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="/css/font-awesome.min.css">
			<link rel="stylesheet" href="/css/bootstrap.css">
			<link rel="stylesheet" href="/css/magnific-popup.css">
			<link rel="stylesheet" href="/css/nice-select.css">							
			<link rel="stylesheet" href="/css/animate.min.css">
			<link rel="stylesheet" href="/css/owl.carousel.css">
            <link rel="stylesheet" href="/css/style.css">
            <link rel="stylesheet" href="/css/linearicons.css">
            <link rel="stylesheet" href="/css/main.css">

   
   
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>   
<script type="text/javascript">
	
//비밀번호 일치 체크
	/* $(function checkPw1() {
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("input").keyup(function() {
				var pwd1 = $("#pwd1").val();
				var pwd2 = $("#pwd2").val();
				if (pwd1 != "" || pwd2 != "") {
					if (pwd1 == pwd2) {
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#submitbtn").removeAttr("disabled");
					} else {
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submitbtn").attr("disabled", "disabled");
					}
				}
			});
		}); */
		
		//비밀번호 일치 체크
		$(function checkPw1() {
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("input").keyup(function() {
				var pwd1 = $("#pwd1").val();
				var pwd2 = $("#pwd2").val();
				var CheckForm = /^[a-z0-9]{8,16}$/;
				if (!CheckForm.test(pwd1)) {
					$('#submitbtn').prop("disabled", true);
					
				if(pwd1!=""){	
					$("#alert-danger1").show();
				}
				
				} else{
				 	if (pwd1 != "" || pwd2 != "") {
						if (pwd1 == pwd2) {
							$("#alert-danger1").hide();
							$("#alert-success").show();
							$("#alert-danger").hide();
							$("#submitbtn").removeAttr("disabled");
						} else {
							$("#alert-danger1").hide();
							$("#alert-success").hide();
							$("#alert-danger").show();
							$("#submitbtn").attr("disabled", "disabled");
						}
				  	}
				}
			});
		});
	
</script>
    
</head>
<body>
	<button type="button" id="mobile-nav-toggle">
		<i class="lnr lnr-menu"></i>
	</button>
   <header id="header" id="home">
        <div class="container main-menu">
            <div class="row align-items-center justify-content-between d-flex">
              <div id="logo">
                <a href="/MainForm.do">
                 <img src="img/logo.png">
                  </a>
                </div>
              <nav id="nav-menu-container">
                <ul class="nav-menu">
                  <li class="menu-active"><a href="/MainForm.do">홈</a></li>
                 <li><a href="../user/LoginForm.do">로그아웃</a></li>
                  <li><a href="../mypage/Mypage.do">마이페이지</a></li>
                  <li><a href="../map/MapForm.do">동물병원 찾기</a></li>
                  <li class="menu-has-children"><a href="">게시판</a>
                    <ul>
                       <li><a href="../notice/noticeList.do">공지사항</a></li>
                      <li><a href="../board/boardList.do">후기</a></li>
                    </ul>
                  </li>							          
                </ul>
              </nav><!-- #nav-menu-container -->		    		
            </div>
        </div>
      </header><!-- #header -->
     <!-- start banner Area -->
    <section class="banner-area relative" id="home">	
        <div class="overlay overlay-bg"></div>
        <div class="container">				
            <div class="row d-flex align-items-center justify-content-center">
                <div class="about-content col-lg-12">
                    <h3 class="text-white">
                       				
                    </h3>	
                    <p class="text-white link-nav">
                </div>	
            </div>
        </div>
    </section>
    <!-- End banner Area -->
   
    <div class="forms">
   
        <form name="chpwdForm" id="login" action="/user/changePw.do" >
          <div class="input-field">
           <!-- <label for="password">현재 비밀번호</label>
            <input type="password" name="password" required/>  --> 
            <label for="password">새 비밀번호</label>
            <div id="alert-danger1" style="display: none;">형식 올바르지
									않습니다(영문소문자, 숫자8~16)</div>
            <input type="password" name="password" id="pwd1" required/>
            <label for="password">새 비밀번호 확인</label>
            <input type="password" name="password" id="pwd2" oninput="checkPw1();" required/>
            <div id="alert-success" style="display: none;">비밀번호 사용가능</div>
			<div id="alert-danger" style="display: none;">비밀번호 불가능(비밀번호가 일치하지 않습니다)</div>
            
			<input type="hidden" id="submitinput" value="0">
            <input type="submit" value="변경하기" class="button" id="submitbtn"/>
          </div>
  
        </form>
    </div>

		<script type="text/javascript">
					function submitTest(){
						var subinput = $("#submitinput").val();
						if(subinput=='0'){
							alert("아이디 중복 체크를 해주세요.");
							return false;
						}
						return true;
						
					}
					</script>
    <!-- start footer Area -->		
			<footer class="footer-area">
				<div class="container">
					<!-- <div class="row pt-120 pb-80">	
								
					</div> -->
				</div>
				<div class="copyright-text">
					<div class="container">
						<div class="row footer-bottom d-flex justify-content-between">
							<p class="col-lg-8 col-sm-6 footer-text m-0 text-white">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<!-- <script>document.write(new Date().getFullYear());
                                </script> --> 1920110002 |  by 강지연 <a href="https://colorlib.com" target="_blank"></a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
							
						</div>						
					</div>
				</div>
			</footer>
			<!-- End footer Area -->	

			<script src="/js/vendor/jquery-2.2.4.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
			<script src="/js/vendor/bootstrap.min.js"></script>			
			<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
  			<script src="/js/easing.min.js"></script>			
			<script src="/js/hoverIntent.js"></script>
			<script src="/js/superfish.min.js"></script>	
			<script src="/js/jquery.ajaxchimp.min.js"></script>
			<script src="/js/jquery.magnific-popup.min.js"></script>	
			<script src="/js/owl.carousel.min.js"></script>						
			<script src="/js/jquery.nice-select.min.js"></script>							
			<script src="/js/mail-script.js"></script>	
			<script src="/js/main.js"></script>	
 
</body>
</html>