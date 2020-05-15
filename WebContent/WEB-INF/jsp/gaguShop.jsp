<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="header.jsp"%>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h4>${gvo.gititle}</h4>
					<h1 class="page-name">${gvo.giname}</h1>
					<ol class="breadcrumb">
						<li><a href="main"> HOME </a></li>
						<li class="active">${gvo.gicontent }</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="products section">
	<div class="container">
		<div class="row">
			<c:forEach var="e" items="${list}">

				<div class="col-md-4">
					<div class="product-item">
						<div class="product-thumb">
							<img class="img-responsive"
								src="resources/images/shop/products/${e.gpicture}"
								alt="product-img" />
							<div class="preview-meta">
								<ul>
									<li><a href="gaguShopDetail?gnum=${e.gnum}"><i
											class="tf-ion-ios-search"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="product-content">
							<h4>
								<a href="gaguShopDetail?gnum=${e.gnum}&page=1">${e.gname}</a>
							</h4>
							<a class="star-box" id="star-box${e.gnum}">
								<span class="star_print star_left"></span> 
								<span class="star_print star_right"></span> 
								<span class="star_print star_left"></span> 
								<span class="star_print star_right"></span> 
								<span class="star_print star_left"></span> 
								<span class="star_print star_right"></span> 
								<span class="star_print star_left"></span> 
								<span class="star_print star_right"></span> 
								<span class="star_print star_left"></span> 
								<span class="star_print star_right"></span>
							</a>
							<p class="product-price">${e.gprice}</p>
											
							<script>
								var rgrade = "<c:out value="${e.rgrade}"/>";
								var gnum = "<c:out value="${e.gnum}"/>";
								var j = 0;
								for (var i = 0.5; i <= rgrade; i += 0.5) {
									$('#star-box'+gnum+' span').eq(j).addClass("on");
									j++;
								}
							</script>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div style="text-align: center;">
			<%@include file="gagushop_page.jsp" %>
		</div>
	</div>
</section>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$.fn.priceBuilder = function(price) {
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		$(".product-price").each(function(idx) {
			// 해당 체크박스의 Value 가져오기
			var value = $(this).text();
			$(this).text($.fn.priceBuilder(value) + ' 원');
		});
	});
</script>

<%@include file="footer.jsp"%>