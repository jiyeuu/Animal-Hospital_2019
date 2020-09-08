<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user_id = (String) session.getAttribute("SS_USER_ID");
	String user_Author = (String) session.getAttribute("user_Author");
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
<title>동물병원 찾기</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--CSS============================================= -->
<link rel="stylesheet" href="/css/linearicons.css">
<link rel="stylesheet" href="/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/magnific-popup.css">
<link rel="stylesheet" href="/css/nice-select.css">
<link rel="stylesheet" href="/css/animate.min.css">
<link rel="stylesheet" href="/css/owl.carousel.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/style.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<!-- #header -->
	<%
		if (user_id != null) {
	%>
	<%
		if (user_Author.equals("1")) {
	%>
	<%@include file="/WEB-INF/view/frame/topbar-admin.jsp"%>
	<%
		} else {
	%>
	<%@include file="/WEB-INF/view/frame/topbar-login.jsp"%>
	<%
		}
	%>
	<%
		} else {
	%>
	<%@include file="/WEB-INF/view/frame/topbar-logout.jsp"%>
	<%
		}
	%>
	<!-- #header -->
	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="container">
			<div class="overlay overlay-bg"></div>
			<div
				class="row fullscreen d-flex align-items-center justify-content-start">
				<div class="banner-content col-lg-8">
					<h3 class="text-uppercase">
						<br>

					</h3>


				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start callto-top Area -->
	<section class="callto-top-area section-gap">
		<div class="container">
			<div class="row justify-content-between callto-top-wrap pt-40 pb-40">
				<div class="col-lg-12 callto-top">

						<select name="sido1" id="sido1" style="float: left;"></select>
						<select name="gugun1" id="gugun1" style="float: left;"></select>
						<input type="button" onclick="findLoc()" value="검색하기">
					
					<div id="map" style="width: 100%; height: 600px;"></div>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7c2e004c3ba14106ee968537c64eb82&libraries=services,clusterer"></script>

					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(33.450701,
									126.570667), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						navigator.geolocation.getCurrentPosition(function(pos) {
							latitude = pos.coords.latitude;
							longitude = pos.coords.longitude;
							console.log(latitude);
							console.log(longitude);
							var moveLatLon = new kakao.maps.LatLng(latitude,
									longitude);
							map.setCenter(moveLatLon);
						});

						function findLoc() {
							var text1 = $("#sido1 option:selected").text();
							var text2 = $("#gugun1 option:selected").text();
							var loc = text1 + " " + text2;

							var geocoder = new kakao.maps.services.Geocoder();

							// 주소로 좌표를 검색합니다
							geocoder.addressSearch(loc,function(result, status) {
								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y,
											result[0].x);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
						}

						$('document')
								.ready(
										function() {
											var area0 = [ "시/도 선택", "서울특별시",
													"경기도" ];
											var area1 = [ "강남구", "강동구", "강북구",
													"강서구", "관악구", "광진구", "구로구",
													"금천구", "노원구", "도봉구",
													"동대문구", "동작구", "마포구",
													"서대문구", "서초구", "성동구",
													"성북구", "송파구", "양천구",
													"영등포구", "용산구", "은평구",
													"종로구", "중구", "중랑구" ];
											var area2 = [ "고양시", "과천시", "광명시",
													"광주시", "구리시", "군포시", "김포시",
													"남양주시", "동두천시", "부천시",
													"성남시", "수원시", "시흥시", "안산시",
													"안성시", "안양시", "양주시", "오산시",
													"용인시", "의왕시", "의정부시",
													"이천시", "파주시", "평택시", "포천시",
													"하남시", "화성시", "가평군", "양평군",
													"여주군", "연천군" ];

											//시/도 선택 박스 초기화
											$("select[name^=sido]")
													.each(function() {
														$selsido = $(this);
														$.each(eval(area0),
														function() {
															$selsido.append("<option value='"+this+"'>"
																				+ this + "</option>");
														});
														$selsido.next().append("<option value=''>구/군 선택</option>");
													});
											// 시/도 선택시 구/군 설정
											$("select[name^=sido]")
													.change(
															function() {
																var area = "area"
																		+ $(
																				"option",
																				$(this))
																				.index(
																						$(
																								"option:selected",
																								$(this))); // 선택지역의 구군 Array
																var $gugun = $(
																		this)
																		.next(); // 선택영역 군구 객체
																$("option",
																		$gugun)
																		.remove(); // 구군 초기화
																if (area == "area0")
																	$gugun
																			.append("<option value=''>구/군 선택</option>");
																else {
																	$
																			.each(
																					eval(area),
																					function() {
																						$gugun
																								.append("<option value='"+this+"'>"
																										+ this
																										+ "</option>");
																					});
																}
															});

										});

						$(document)
								.ready(
										function() {
											function makeClickListener(map,
													marker, infowindow) {
												return function() {
													infowindow
															.open(map, marker);
												};
											}

											function makeOutListener(infowindow) {
												return function() {
													infowindow.close();
												};
											}

											$
													.ajax({
														url : "${root}/js/map_db.json", // test.jsp 에서 받아옴
														dataType : "json", // 데이터타입을 json 으로 받아옴
														success : function(data) {

															// 데이터를 가져오기 위해 jQuery를 사용합니다	
															// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다		
															// 데이터에서 좌표 값을 가지고 마커를 표시합니다		
															// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다		
															$
																	.each(
																			data.positions,
																			function(
																					i,
																					position) {
																				// return new kakao.maps.Marker({
																				//	map: map,
																				//	position : new kakao.maps.LatLng(position.LAT, position.LNG),
																				//	content: '<div style="padding:5px;">'+position.HOSP_NAME+'</div>',
																				//	clickable:true
																				//  });

																				// 마커를 생성합니다
																				var marker = new kakao.maps.Marker(
																						{
																							map : map, // 마커를 표시할 지도
																							position : new kakao.maps.LatLng(
																									position.LAT,
																									position.LNG),
																							clickable : true

																						});

																				// 마커에 표시할 인포윈도우를 생성합니다 
																				var infowindow = new kakao.maps.InfoWindow(
																						{
																							content : '<div style="padding:5px;">'
																									+ position.HOSP_NAME
																									+ '</div>'
																									+ '<div style="padding:5px;">'
																									+ position.TELNO
																									+ '</div>'
																									+ '<div style="padding:5px; ">'
																									+ position.ADDR
																									+ '</div>', // 인포윈도우에 표시할 내용
																							removable : true
																						});

																				// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
																				// 이벤트 리스너로는 클로저를 만들어 등록합니다 
																				// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
																				// kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
																				// kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
																				kakao.maps.event
																						.addListener(
																								marker,
																								'click',
																								makeClickListener(
																										map,
																										marker,
																										infowindow));
																			})
														},
														error : function(e) {
															console
																	.log(e.responseText);
														}

													});
										});

						function setMapType(maptype) {
							var roadmapControl = document
									.getElementById('btnRoadmap');
							var skyviewControl = document
									.getElementById('btnSkyview');
							if (maptype === 'roadmap') {
								map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);
								roadmapControl.className = 'selected_btn';
								skyviewControl.className = 'btn';
							} else {
								map.setMapTypeId(daum.maps.MapTypeId.HYBRID);
								skyviewControl.className = 'selected_btn';
								roadmapControl.className = 'btn';
							}
						}

						// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다		
						function zoomIn() {
							map.setLevel(map.getLevel() - 1);
						}

						// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다		
						function zoomOut() {
							map.setLevel(map.getLevel() + 1);
						}
					</script>
				</div>
			</div>
		</div>
	</section>
	<!-- End callto-top Area -->


	<!-- start footer Area -->
	<footer class="footer-area">
		<div class="container">
			<!-- <div class="row pt-120 pb-80"></div> -->
		</div>
		<div class="copyright-text">
			<div class="container">
				<div class="row footer-bottom d-flex justify-content-between">
					<p class="col-lg-8 col-sm-6 footer-text m-0 text-white">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;<!-- <script>document.write(new Date().getFullYear());
                                </script> --> 1920110002 |  by 강지연 <a href="https://colorlib.com" target="_blank"></a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
			
				</div>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->

	<script src="/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="/js/vendor/bootstrap.min.js"></script>
	<!--  <script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>-->
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
