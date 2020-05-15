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

<title>���� ����</title>

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
<!-- swiper �����̴� -->
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
					<!-- �α��� ���� -->
					<ul class="top-menu text-right list-inline">
						<li class="dropdown cart-nav dropdown-slide"><c:choose>
								<c:when test="${sessionScope.map.mid == null }">
									<a href="loginform">�α���</a>
								</c:when>
								<c:otherwise>
									${sessionScope.map.mname}�� <a href="logout">�α׾ƿ�</a>
								</c:otherwise>
							</c:choose></li>
						<!-- / �α��� ���� �� -->

						<!-- ȸ������ ���� -->
						<li class="dropdown cart-nav dropdown-slide"><c:choose>
								<c:when test="${sessionScope.map.mid == null }">
									<a href="signinform">ȸ������</a>
								</c:when>
								<c:otherwise>
									<a href="mypageinfo">����������</a>
								</c:otherwise>
							</c:choose></li>
						<!-- / ȸ������ ���� �� -->

						<!-- ��ٱ��� ���� -->
						<c:if test="${sessionScope.map.madmin == 1 || sessionScope.map.mid == null}">
							<li class="dropdown cart-nav dropdown-slide"><a href="sangpumDetail"
							class="dropdown-toggle" data-toggle="dropdown"
							data-hover="dropdown"><i class="tf-ion-android-cart"></i>
								��ٱ���</a>
							</li>
						</c:if>
						
						<!-- / ��ٱ��� -->

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
					<h2 class="menu-title">���� �޴�</h2>
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

								<!-- ������ : '0', ����� : '1' -->
								<!-- Home -->
								<li class="dropdown "><a href="main">Home</a></li>
								<!-- / Home -->

								<!-- ������ ��ǰ���� -->
								<li class="dropdown dropdown-slide"><a href="gaguAdminForm"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">��ǰ���� <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">��ǰ����</li>
										<li role="separator" class="divider"></li>
										<li><a href="gaguAdminForm">��ǰ����Ʈ</a></li>
										<li><a href="gaguAddForm">��ǰ���</a></li>
										<li><a href="stockFrom">������</a></li>										
									</ul></li>
								<!-- / ������ ��ǰ���� -->

								<!-- ������ ȸ������ -->
								<li class="dropdown dropdown-slide"><a href="memberlist"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">ȸ������ <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">ȸ������</li>
										<li role="separator" class="divider"></li>
										<li><a href="memberlist">ȸ������Ʈ</a></li>
										<li><a href="addmemberform">ȸ���������</a></li>
									</ul></li>
								<!-- / ������ ȸ������ -->

								<!-- ������ �Խñ� ���� -->
								<li class="dropdown dropdown-slide"><a href="notice_list?page=1"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">�Խñ� ���� <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">�Խñ� ����</li>
										<li role="separator" class="divider"></li>
										<li><a href="notice_list?page=1">��������</a></li>
										<li><a href="qna_list">��ǰ����</a></li>
									</ul></li>
								<!-- / ������ �Խñ� ���� -->
							</c:when>


							<c:when
								test="${sessionScope.map.madmin == '1' or sessionScope.map.mid == null}">
								<!-- ������ : '0', ����� : '1' -->
								<!-- Home -->
								<li class="dropdown "><a href="main">Home</a></li>
								<!-- / Home -->

								<!-- ħ�� -->
								<li class="dropdown dropdown-slide"><a href="gaguShop?ginum=1"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">ħ�� <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">ħ��</li>
										<li role="separator" class="divider"></li>
										<li><a href="gaguShop?ginum=1">���</a></li>
										<li><a href="gaguShop?ginum=3">ħ��</a></li>
										<li><a href="gaguShop?ginum=4">��������Ʈ</a></li>
									</ul></li>
								<!-- / ħ�� -->


								<!-- �Ž� -->
								<li class="dropdown dropdown-slide"><a href="gaguShop?ginum=5"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">�Ž� <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">�Ž�</li>
										<li role="separator" class="divider"></li>
										<li><a href="gaguShop?ginum=5">����</a></li>
										<li><a href="gaguShop?ginum=7">��Ŭ���̳�</a></li>
										<li><a href="gaguShop?ginum=6">�Ž���</a></li>
									</ul></li>
								<!-- / �Ž� -->


								<!-- �ֹ� -->
								<li class="dropdown dropdown-slide"><a href="gaguShop?ginum=2"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">�ֹ� <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">�ֹ�</li>
										<li role="separator" class="divider"></li>
										<li><a href="gaguShop?ginum=2">��Ź</a></li>
									</ul></li>
								<!-- / �ֹ� -->

								<!-- Ű��/���ǽ� -->
								<li class="dropdown "><a href="gaguShop?ginum=9">Ű��/���ǽ�</a></li>
								<!-- / Ű��/���ǽ� -->

								<!-- �Ұ��� -->
								<li class="dropdown dropdown-slide"><a href="gaguShop?ginum=10"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">�Ұ��� <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">�Ұ���</li>
										<li role="separator" class="divider"></li>
										<li><a href="gaguShop?ginum=10">��ǰ</a></li>
										<li><a href="gaguShop?ginum=11">������</a></li>
									</ul></li>
								<!-- / �Ұ��� -->

								<!-- Ŀ�´�Ƽ -->
								<li class="dropdown dropdown-slide"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown" data-delay="350" role="button"
									aria-haspopup="true" aria-expanded="false">Ŀ�´�Ƽ <span
										class="tf-ion-ios-arrow-down"></span></a>
									<ul class="dropdown-menu">
										<li class="dropdown-header">Ŀ�´�Ƽ</li>
										<li role="separator" class="divider"></li>
										<li><a href="notice_list?page=1">��������</a></li>
										<li><a href="qna_list?page=1">���ǻ���</a></li>
										<c:if test="${sessionScope.map.mid != null }">
											<li><a href="attend">�⼮üũ</a></li>
										</c:if>
										
									</ul></li>
								<!-- / Ŀ�´�Ƽ -->

								<!-- �˻� -->
								<li class="dropdown search dropdown-slide"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown"><i class="tf-ion-ios-search-strong"></i>
										�˻�</a>
									<ul class="dropdown-menu search-dropdown">
										<li>
											<form action="searchform" method="post">
												<input type="hidden" name="page" value="1">
												<select class="form-control" name="searchType" id="searchSelect">
													<option value="0">��ü</option>
													<option value="1">ħ��</option>
													<option value="2">�Ž�</option>
													<option value="3">�ֹ�</option>
													<option value="4">Ű��/���ǽ�</option>
													<option value="5">�Ұ���</option>		
												</select>
												<input type="search" class="form-control" placeholder="���ϴ� ��ǰ �˻�" value="${searchValue}" name="searchValue"id="searchValue">
												<input type="submit" value="�˻�" class="form-control">
												<div id="searchview"
													style="width: 200px; border: 1px solid gray; border-top: 0px; margin-top: -1px; display: none; font-family: NanumGothic; font-size: 10px">
												</div>
											</form>
	              							<div class="hash">
												<c:forEach items="${sessionScope.slist}" var="e"
													varStatus="i" begin="0" step="1">
													<a href="searchform?searchValue=${e.slvalue}">${i.count} ��
														${e.slvalue}</a>
												</c:forEach>
											</div>
										</li>
									</ul></li>
								<!-- / �˻� -->
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
<!-- ���� �ϴ� ���� -->
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
	//�ֱ� �� ��ǰ
	$(document).ready(function() {
		let tag = "";
		tag += "<table class='table info'><thead><tr><th>�ֱ� �� ��ǰ</th></tr></thead>";
		tag += "<tbody class ='sangdong_a'>";
		//��Ű�� �޾ƿ���
		var str = document.cookie;
		//��Ű�� ���ڿ��̶� �ڿ� ';'�� �ڸ�
		cookiearray = str.split(";");
		for (var i = 0; i < cookiearray.length; i++) {
			//Ű�� �̸�
			var name = cookiearray[i].split('=')[0];
			//Ű�� value��
			var value = cookiearray[i].split('=')[1];
			//��Ű �̸��� key�� ���� ���
			if (name == 'key') {
				//value�� ������ '#'���� �ڸ�
				var tmp1 = value.split('#');
				//�ε����� �ִ� ���� for�� 
				for ( var i in tmp1) {
					//'/'���� ���� ����
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
		// �˻��� �Ʒ��� �����ֱ�
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
					 				// �޾ƿ� �˻��  �迭�� ����
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
