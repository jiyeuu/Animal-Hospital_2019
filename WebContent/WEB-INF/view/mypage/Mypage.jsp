<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id1 = (String)request.getAttribute("user_id");
	String email = (String)request.getAttribute("email");
	String user_id = (String)session.getAttribute("SS_USER_ID");
	String user_Author = (String)session.getAttribute("user_Author");
%>    

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
		<title>마이페이지</title>
		
		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--CSS
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
</head>
<body>
 <!-- #header -->
	<%if(user_id!=null){ %>
		<%if(user_Author.equals("1")) {%>
			<%@include file="/WEB-INF/view/frame/topbar-admin.jsp" %>
		<%} else { %>
			<%@include file="/WEB-INF/view/frame/topbar-login.jsp" %>
		<%} %>
	<%} else {%>
		<%@include file="/WEB-INF/view/frame/topbar-logout.jsp" %>
	<%} %>
	
	<!-- #header -->
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
    	<form name="Regf" action="">
          <div class="input-field">
            <label for="user_id">아이디</label>
            <%=user_id1%>	
            <label for="email">Email</label> 
            <%=email%>
            <label for="password">비밀번호</label> 
            <input type="button" name="password" value="변경하기" class="button"  onClick="location.href='/mypage/ChPwForm.do'" required/>
             <input type="button" value="탈퇴하기" class="button" onclick="delUser()" />
          </div>
  		</form>
    </div>


	<!-- start footer Area -->
	<footer class="footer-area">
		<div class="container"></div>
		<div class="copyright-text">
			<div class="container">
				<div class="row footer-bottom d-flex justify-content-between">
					<p class="col-lg-8 col-sm-6 footer-text m-0 text-white">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<!-- <script>document.write(new Date().getFullYear());
                                </script> -->
						1920110002 | by 강지연 <a href="https://colorlib.com" target="_blank"></a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>

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
			<script>
			function delUser() {

		         if (confirm("회원 탈퇴 하시겠습니까?") == true) {
		            document.location.href = "/mypage/DeleteUser.do?user_id=<%=user_id %>";
		         } else {
		            return false;
		         }
		      }
			</script>
 
</body>
</html>