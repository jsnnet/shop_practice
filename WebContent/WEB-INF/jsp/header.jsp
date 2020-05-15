<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>

<!DOCTYPE html>
<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="description" content="Aviato E-Commerce Template">

<meta name="author" content="Themefisher.com">

<title>유리 가구</title>

<!-- Mobile Specific Meta-->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.png" />

<!-- Themefisher Icon font -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/themefisher-font/style.css">
<!-- bootstrap.min css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css">

<!-- animate.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/animate-css/animate.css">

<%-- <!-- Revolution Slider -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/plugins/revolution-slider/revolution/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/plugins/revolution-slider/revolution/fonts/font-awesome/css/font-awesome.css"> --%>

<%-- <!-- REVOLUTION STYLE SHEETS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/plugins/revolution-slider/revolution/css/settings.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/plugins/revolution-slider/revolution/css/layers.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/plugins/revolution-slider/revolution/css/navigation.css"> --%>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/timegrid.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/daygrid.css">


<style>
*{margin:0; padding:0;}
.star{
  display:inline-block;
  width: 15px; height: 30px;
  cursor: pointer;
}
.star_left{
  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat 0 0; 
  background-size: 30px; 
  margin-right: -2px;
}
.star_right{
  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat -15px 0; 
  background-size: 30px; 
  margin-left: -2px;
}
.star.on, .star_print.on{
  background-image: url(http://gahyun.wooga.kr/main/img/testImg/star_on.png);
}
.star_print{
	display:inline-block;
  	width: 15px; height: 30px;
}

</style>

<!-- Main Stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<style>
.button-style{
	width: 200px;
	height: auto;
}

</style>
<!-- swiper 슬라이더 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/swiper.min.css">
  <style>
    html, body {
      position: relative;
      height: 70%;
    }
    body {
      /* background: #eee; */
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
    }
    .swiper-container {
      width: 70%;
      height: 100%;
      margin-left: auto;
      margin-right: auto;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;  
    }    
  </style>	

</head>

<body id="body">
	
	<!-- Start Top Header Bar -->

	<section class="top-header">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-xs-12 col-sm-4">
					<div class="contact-number">
						<i class="tf-ion-ios-telephone"></i> <span>010-1234-1234</span>
					</div>
				</div>
				<div class="col-md-4 col-xs-12 col-sm-4">
					<!-- Site Logo -->
					<div class="logo text-center">
						<a href="main"> <!-- replace logo here --> <img
							src="${pageContext.request.contextPath}/resources/images/logo_yuri.png"
							alt="website main logo" style="width: 200px; height: auto;" />
						</a>
					</div>
				</div>
				<div class="col-md-4 col-xs-12 col-sm-4">
					<!-- 로그인 영역 -->
					<ul class="top-menu text-right list-inline">
						<li class="dropdown cart-nav dropdown-slide"><c:choose>
								<c:when test="${sessionScope.map.mid == null }">
									<a href="loginform">로그인</a>
								</c:when>
								<c:otherwise>
									${sessionScope.map.mname}님 <a href="logout">로그아웃</a>
								</c:otherwise>
							</c:choose></li>
						<!-- / 로그인 영역 끝 -->

						<!-- 회원가입 영역 -->
						<li class="dropdown cart-nav dropdown-slide"><c:choose>
								<c:when test="${sessionScope.map.mid == null }">
									<a href="signinform">회원가입</a>
								</c:when>
								<c:otherwise>
									<a href="mypageinfo">마이페이지</a>
								</c:otherwise>
							</c:choose></li>
						<!-- / 회원가입 영역 끝 -->

						<!-- 장바구니 영역 -->
						<c:if test="${sessionScope.map.madmin == 1 || sessionScope.map.mid == null}">
							<li class="dropdown cart-nav dropdown-slide"><a href="sangpumDetail"
							class="dropdown-toggle" data-toggle="dropdown"
							data-hover="dropdown"><i class="tf-ion-android-cart"></i>
								장바구니</a>
							</li>
						</c:if>
						
						<!-- / 장바구니 -->

					</ul>
					<!-- / .nav .navbar-nav .navbar-right -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Top Header Bar -->

	<!-- Main Menu Section -->
	<section class="menu">
		<nav class="navbar navigation">
			<div class="container">

				<div class="navbar-header">
					<h2 class="menu-title">메인 메뉴</h2>
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<!-- / .navbar-header -->
				<!-- Navbar Links -->
				<div id="navbar" class="navbar-collapse collapse text-center">
					<ul class="nav navbar-nav">

						<c:choose>
							<c:when test="${sessionScope.map.madmin == '0'}">

								<!-- 관리자 : '0', 사용자 : '1' -->
								<!-- Home -->
								<li class="dropdown "><a href="main">Home</a></li>
								<!-- / Home -->

								<!-- 관리자 상품관리 -->
								<li class="dropdown dropdown-slide"><a href="gaguAdminForm"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">상품관리 <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">상품관리</li>
										<li role="separator" class="divider"></li>
										<li><a href="gaguAdminForm">상품리스트</a></li>
										<li><a href="gaguAddForm">상품등록</a></li>
										<li><a href="stockFrom">재고관리</a></li>										
									</ul></li>
								<!-- / 관리자 상품관리 -->

								<!-- 관리자 회원관리 -->
								<li class="dropdown dropdown-slide"><a href="memberlist"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">회원관리 <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">회원관리</li>
										<li role="separator" class="divider"></li>
										<li><a href="memberlist">회원리스트</a></li>
										<li><a href="addmemberform">회원정보등록</a></li>
									</ul></li>
								<!-- / 관리자 회원관리 -->

								<!-- 관리자 게시글 관리 -->
								<li class="dropdown dropdown-slide"><a href="notice_list?page=1"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">게시글 관리 <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">게시글 관리</li>
										<li role="separator" class="divider"></li>
										<li><a href="notice_list?page=1">공지사항</a></li>
										<li><a href="qna_list">상품문의</a></li>
									</ul></li>
								<!-- / 관리자 게시글 관리 -->
							</c:when>


							<c:when
								test="${sessionScope.map.madmin == '1' or sessionScope.map.mid == null}">
								<!-- 관리자 : '0', 사용자 : '1' -->
								<!-- Home -->
								<li class="dropdown "><a href="main">Home</a></li>
								<!-- / Home -->

								<!-- 침실 -->
								<li class="dropdown dropdown-slide"><a href="gaguShop?ginum=1"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">침실 <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">침실</li>
										<li role="separator" class="divider"></li>
										<li><a href="gaguShop?ginum=1">장롱</a></li>
										<li><a href="gaguShop?ginum=3">침대</a></li>
										<li><a href="gaguShop?ginum=4">스프링매트</a></li>
									</ul></li>
								<!-- / 침실 -->


								<!-- 거실 -->
								<li class="dropdown dropdown-slide"><a href="gaguShop?ginum=5"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">거실 <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">거실</li>
										<li role="separator" class="divider"></li>
										<li><a href="gaguShop?ginum=5">소파</a></li>
										<li><a href="gaguShop?ginum=7">리클라이너</a></li>
										<li><a href="gaguShop?ginum=6">거실장</a></li>
									</ul></li>
								<!-- / 거실 -->


								<!-- 주방 -->
								<li class="dropdown dropdown-slide"><a href="gaguShop?ginum=2"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">주방 <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">주방</li>
										<li role="separator" class="divider"></li>
										<li><a href="gaguShop?ginum=2">식탁</a></li>
									</ul></li>
								<!-- / 주방 -->

								<!-- 키즈/오피스 -->
								<li class="dropdown "><a href="gaguShop?ginum=9">키즈/오피스</a></li>
								<!-- / 키즈/오피스 -->

								<!-- 소가구 -->
								<li class="dropdown dropdown-slide"><a href="gaguShop?ginum=10"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">소가구 <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">소가구</li>
										<li role="separator" class="divider"></li>
										<li><a href="gaguShop?ginum=10">소품</a></li>
										<li><a href="gaguShop?ginum=11">서랍장</a></li>
									</ul></li>
								<!-- / 소가구 -->

								<!-- 커뮤니티 -->
								<li class="dropdown dropdown-slide"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">커뮤니티 <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">커뮤니티</li>
										<li role="separator" class="divider"></li>
										<li><a href="notice_list?page=1">공지사항</a></li>
										<li><a href="qna_list?page=1">문의사항</a></li>
										<c:if test="${sessionScope.map.mid != null }">
											<li><a href="attend">출석체크</a></li>
										</c:if>
										
									</ul></li>
								<!-- / 커뮤니티 -->

								<!-- 검색 -->
								<li class="dropdown search dropdown-slide"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown"><i class="tf-ion-ios-search-strong"></i>
										검색</a>
									<ul class="dropdown-menu search-dropdown">
										<li>
											<form action="searchform" method="post">
												<input type="hidden" name="page" value="1">
												<select class="form-control" name="searchType" id="searchSelect">
													<option value="0">전체</option>
													<option value="1">침실</option>
													<option value="2">거실</option>
													<option value="3">주방</option>
													<option value="4">키즈/오피스</option>
													<option value="5">소가구</option>		
												</select>
												<input type="search" class="form-control" placeholder="원하는 상품 검색" value="${searchValue}" name="searchValue"id="searchValue">
												<input type="submit" value="검색" class="form-control">
												<div id="searchview"
													style="width: 200px; border: 1px solid gray; border-top: 0px; margin-top: -1px; display: none; font-family: NanumGothic; font-size: 10px">
												</div>
											</form>
	              							<div class="hash">
												<c:forEach items="${sessionScope.slist}" var="e"
													varStatus="i" begin="0" step="1">
													<a href="searchform?searchValue=${e.slvalue}">${i.count} 위
														${e.slvalue}</a>
												</c:forEach>
											</div>
										</li>
									</ul></li>
								<!-- / 검색 -->
							</c:when>
						</c:choose>
					</ul>
					<!-- / .nav .navbar-nav -->
				</div>
				<!--/.navbar-collapse -->
			</div>
			<!-- / .container -->
		</nav>
	</section>
<!-- slider -->
<!-- 왼쪽 하단 고정 -->
<div class="
latelyview" style="
position: fixed;
right: 20px;
bottom:20px;
">

</div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	var jsonObj = new Array();
	
	function searchSelect(index) {
		$('#searchValue').val(jsonObj[index]);
		$('#searchview').css('display', 'none');
	}
	//최근 본 상품
	$(document).ready(function() {
		let tag = "";
		tag += "<table class='table info'><thead><tr><th>최근 본 상품</th></tr></thead>";
		tag += "<tbody class ='sangdong_a'>";
		//쿠키값 받아오기
		var str = document.cookie;
		//쿠키가 문자열이라서 뒤에 ';'을 자름
		cookiearray = str.split(";");
		for (var i = 0; i < cookiearray.length; i++) {
			//키값 이름
			var name = cookiearray[i].split('=')[0];
			//키값 value값
			var value = cookiearray[i].split('=')[1];
			//쿠키 이름이 key가 있을 경우
			if (name == 'key') {
				//value의 값으로 '#'으로 자름
				var tmp1 = value.split('#');
				//인덱스에 있는 향상된 for문 
				for ( var i in tmp1) {
					//'/'으로 값을 나눔
					var tmp2 = tmp1[i].split('/');
					if (tmp2 != "") {
						tag += "<tr><td><a href='gaguShopDetail?gnum="
								+ tmp2[0]
								+ "'><img src='resources/images/shop/products/"+tmp2[1]+"'  style='width: 150px; height: 150px;'";
						tag += "alt='product-img' /></a></td></tr>";
					}
				}
				tag += "</tbody></table>";
				$('.latelyview').html(tag);
			}
		}
		// 검색어 아래에 보여주기
		var lastKey = '';
		$('#searchValue').keydown(function() {
				setTimeout(function() {
					var key = $('#searchValue').val();
					if (key == '' || key == ' ') {
						lastKey = '';
						$('#searchview').css('display', 'none');
					} else if (key != lastKey) {
						lastKey = key;
						$.ajax({
					 		url : "searchValueEx?searchValue="+$('#searchValue').val(),
				 			dataType : "json",
				 			cache : false,
					 		success : function(data) {
					 			var htmltxt = "<table width='200' border='0' cellspacing='0'>";
					 			$.each(data, function(index, value) {
					 				// 받아온 검색어를  배열에 넣음
					 				jsonObj[index] = value;
					 				htmltxt += "<tr><td style='cursor:pointer;' onmouseover='this.style.background=\"silver\"'";
					 				htmltxt += "onmouseout='this.style.background=\"white\"' onclick='searchSelect("
			 						+ index + ")'>" + value;
					 				htmltxt += "</td></tr>";
					 			});
					 			htmltxt += "</table>";
					 			$('#searchview').html(htmltxt);
					 			$('#searchview').css('display', 'block');
				 			}	
						});
					}
			}, 1000);
		});
	});
</script>
