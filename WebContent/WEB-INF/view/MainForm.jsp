<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user_id = (String)session.getAttribute("SS_USER_ID");
	String user_Author = (String)session.getAttribute("user_Author");
%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<title>홈</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="css/linearicons.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/main.css">

<style>

      	html { 
background: url(/img/images4.jpg) no-repeat center center fixed; 
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: 300px;
background-color: #000000;
}
</style>
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

		
			<div >
			
			
			</div>

		
	<!-- End banner Area -->




	<!-- End testomial Area -->
	<!-- start footer Area -->
	<!-- <footer class="footer-area">
		<div class="container">
			 <div class="row pt-120 pb-80">
				 <div class="col-lg-4 col-md-6">
				
				</div> 
			</div> 
		</div>
		<div class="copyright-text">
			<div class="container">
				<div class="row footer-bottom d-flex justify-content-between">
					<p class="col-lg-8 col-sm-6 footer-text m-0 text-white">
						Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
						Copyright &copy;
						<script>document.write(new Date().getFullYear());
                                </script>
						1920110002 | by 강지연 <a href="https://colorlib.com" target="_blank"></a>
						Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
					</p>

				</div>
			</div>
		</div>
	</footer> -->
	<!-- End footer Area -->

	<script src="/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="/js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
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
