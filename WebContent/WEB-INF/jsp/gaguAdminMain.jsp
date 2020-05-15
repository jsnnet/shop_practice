<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">상품관리</h1>
					<ol class="breadcrumb">
						<li><a href="main">HOME</a></li>
						<li class="active"><a href="gaguAdminForm">상품리스트</a></li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>


<section class="products section">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="widget">
					<h4 class="widget-title">검색</h4>
					<form method="post" action="gaguAdminForm">
						<select class="form-control" name="searchType" id="searchSelect">
							<option value="1">가구이름</option>
							<option value="2">가구종류</option>
							<option value="3">가격 (~원 이하)</option>
						</select> <input type="hidden" name="page" value="1"> <input
							type="text" name="searchValue" class="form-control"
							value="${searchValue}"> <input type="submit"
							name="searchbtn" value="검색" class="form-control">
					</form>
				</div>
				<div class="widget">
					<h4 class="widget-title">Short By</h4>
					<form method="post" action="gaguAdminForm" id="sortform">
						<input type="hidden" value="${sortValue}" id="sortHidden">
						<input type="hidden" value="${searchValue}" name="searchValue">
						<input type="hidden" value="${searchType}" name="searchType">
						<select class="form-control" id="sortSelect" name="sortValue">
							<option value="1">최신(최근순)</option>
							<option value="2">가구이름(오름차순)</option>
							<option value="3">가구이름(내림차순)</option>
							<option value="4">가격(오름차순)</option>
							<option value="5">가격(내림차순)</option>
						</select>
					</form>
				</div>

			</div>

			<div class="col-md-9">
				<div class="row">
					<div id="searchTarget">
						<c:if test="${empty list}">
							<div class="col-md-4">
								<h3>검색 결과가 없습니다.</h3>
							</div>
						</c:if>
						<c:if test="${not empty list}">
							<!-- 가구 리스트 하나 시작 -->
							<c:forEach items="${list}" var="e">
								<div class="col-md-4">
									<div class="product-item">
										<div class="product-thumb">
											<img class="img-responsive"
												src="resources/images/shop/products/${e.gpicture}"
												alt="product-img" />
											<div class="preview-meta">
												<ul>
													<li><a href="gaguAdminDetail?gnum=${e.gnum}&page=1"><i
													class="tf-ion-ios-search"></i></a></li>
												</ul>
											</div>
										</div>
										<div class="product-content">
											<h4>
												<a href="gaguAdminDetail?gnum=${e.gnum}&page=1">${e.gname}</a>
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
						</c:if>
					</div>
					<!-- 가구 리스트 하나 끝 -->
					<!-- Modal -->
					<div class="modal product-modal fade" id="product-modal">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<i class="tf-ion-close"></i>
						</button>
						<div class="modal-dialog " role="document">
							<div class="modal-content">
								<div class="modal-body">
									<div class="row">
										<div class="col-md-8 col-sm-6 col-xs-12">
											<div class="modal-image">
												<img class="img-responsive"
													src="images/shop/products/modal-product.jpg"
													alt="product-img" />
											</div>
										</div>
										<div class="col-md-4 col-sm-6 col-xs-12">
											<div class="product-short-details">
												<h2 class="product-title">GM Pendant, Basalt Grey</h2>
												<p class="product-price">$200</p>
												<p class="product-short-description">Lorem ipsum dolor
													sit amet, consectetur adipisicing elit. Rem iusto nihil
													cum. Illo laborum numquam rem aut officia dicta cumque.</p>
												<a href="cart.html" class="btn btn-main">Add To Cart</a> <a
													href="product-single.html" class="btn btn-transparent">View
													Product Details</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.modal -->
				</div>
				<c:if test="${not empty list}">
					<div style="text-align: center;">
						<%@include file="gaguAdminForm_page.jsp"%>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</section>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$.fn.priceBuilder = function(price) {
			// 금액에 천단위 콤마 추가해주는 정규표현식
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		$(".product-price").each(function(idx) {
			// 금액에 천단위 콤마추가해주고 맨 뒤에 원을 붙임
			var value = $(this).text();
			$(this).text($.fn.priceBuilder(value) + ' 원');
		});

		$('#sortSelect').change(function() {
			// select 태그 값이 바뀔때마다 실행
			$('#sortform').submit();
		});

		var searchType = "<c:out value="${searchType}"/>";

		if (searchType == 1) {
			$("#searchSelect").find("option:eq(0)").prop("selected", true);
		} else if (searchType == 2) {
			$("#searchSelect").find("option:eq(1)").prop("selected", true);
		} else if (searchType == 3) {
			$("#searchSelect").find("option:eq(2)").prop("selected", true);
		}

		var sv = "<c:out value="${sortValue}"/>";

		if (sv == 1) {
			$("#sortSelect").find("option:eq(0)").prop("selected", true);
		} else if (sv == 2) {
			$("#sortSelect").find("option:eq(1)").prop("selected", true);
		} else if (sv == 3) {
			$("#sortSelect").find("option:eq(2)").prop("selected", true);
		} else if (sv == 4) {
			$("#sortSelect").find("option:eq(3)").prop("selected", true);
		} else if (sv == 5) {
			$("#sortSelect").find("option:eq(4)").prop("selected", true);
		}
	});

	// 		$('#searchbtn').click(function() {
	// 			// alert($('#searchType').val());
	// 			var value = encodeURIComponent($('#searchValue').val());
	// 			$.ajax({
	// 				url : "gaguSearch?searchValue=" + value + "&searchType=" + $('#searchType').val()
	// 						+ "&page=${param.page}",
	// 				dataType : "json",
	// 				cache : false,
	// 				success : function(data) {
	// 					let tag = "";
	// 					$.each(data, function(idx, key) {
	// 						tag += "<div class='col-md-4'>";
	// 						tag += "<div class='product-item'>";
	// 						tag += "<div class='product-thumb'>";
	// 						tag += "<img class='img-responsive' src='resources/img/" + key.gpicture 
// 						+ "' alt='product-img'/>";
	// 						tag += "<div class='preview-meta'><ul><li><span data-toggle='modal'"
// 						+ "data-target='#product-modal'> <i class='tf-ion-ios-search'></i></span></li>"
	// 						+ "<li><a href='#'><i class='tf-ion-ios-heart'></i></a></li>"
	// 						+ "<li><a href='#'><i class='tf-ion-android-cart'></i></a></li></ul></div></div>"
	// 						+ "<div class='product-content'>";
	// 						tag += "<h4><a href='gaguAdminDetail?gnum=" + key.gnum + "'>" + key.gname + "</a></h4>";
	// 						tag += "<p class='price' name='listprice'>" + key.gprice + "</p>";
	// 						tag += "</div></div></div>";
	// 					});
	// 					$('#searchTarget').html(tag);
	// 					$("p[name=listprice]").each(function(idx) {
	// 						// 해당 체크박스의 Value 가져오기
	// 						var value = $(this).text();
	// 						$(this).text($.fn.priceBuilder(value) + ' 원');
	// 					});
	// 				},
	// 				error : function(request,status,error){
	// 			        /* alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); */
	// 					alert("error:"+error);
	// 			    }
	// 			});
	// 		});
</script>
<%@include file="footer.jsp"%>