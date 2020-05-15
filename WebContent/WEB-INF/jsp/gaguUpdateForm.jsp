<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>
<section class="single-product">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<ol class="breadcrumb">
					<li><a href="#">관리자</a></li>
					<li><a href="#">상품관리</a></li>
					<li class="active">상품수정</li>
				</ol>
			</div>
			<div class="col-md-6">
				<ol class="product-pagination text-right">

				</ol>
			</div>
		</div>
		<div class="row mt-20">
			<div class="col-md-5">
				<div class="single-product-slider">
					<div id='carousel-custom' class='carousel slide'
						data-ride='carousel'>
						<div class='carousel-outer'>
							<!-- me art lab slider -->
							<div class='carousel-inner '>
								<div class='item active'>
									<img src='resources/images/shop/products/${vo.gpicture}' alt=''
										data-zoom-image="resources/images/shop/products/${vo.gpicture}" />
								</div>
								<div class='item'>
									<img src='images/shop/single-products/product-2.jpg' alt=''
										data-zoom-image="images/shop/single-products/product-2.jpg" />
								</div>

								<div class='item'>
									<img src='images/shop/single-products/product-3.jpg' alt=''
										data-zoom-image="images/shop/single-products/product-3.jpg" />
								</div>
								<div class='item'>
									<img src='images/shop/single-products/product-4.jpg' alt=''
										data-zoom-image="images/shop/single-products/product-4.jpg" />
								</div>
								<div class='item'>
									<img src='images/shop/single-products/product-5.jpg' alt=''
										data-zoom-image="images/shop/single-products/product-5.jpg" />
								</div>
								<div class='item'>
									<img src='images/shop/single-products/product-6.jpg' alt=''
										data-zoom-image="images/shop/single-products/product-6.jpg" />
								</div>

							</div>

							<!-- sag sol -->
							<a class='left carousel-control' href='#carousel-custom'
								data-slide='prev'> <i class="tf-ion-ios-arrow-left"></i>
							</a> <a class='right carousel-control' href='#carousel-custom'
								data-slide='next'> <i class="tf-ion-ios-arrow-right"></i>
							</a>
						</div>

						<!-- thumb -->
						<ol class='carousel-indicators mCustomScrollbar meartlab'>
							<li data-target='#carousel-custom' data-slide-to='0'
								class='active'><img
								src='resources/images/shop/products/${vo.gpicture}' alt='' /></li>
							<li data-target='#carousel-custom' data-slide-to='1'><img
								src='images/shop/single-products/product-2.jpg' alt='' /></li>
							<li data-target='#carousel-custom' data-slide-to='2'><img
								src='images/shop/single-products/product-3.jpg' alt='' /></li>
							<li data-target='#carousel-custom' data-slide-to='3'><img
								src='images/shop/single-products/product-4.jpg' alt='' /></li>
							<li data-target='#carousel-custom' data-slide-to='4'><img
								src='images/shop/single-products/product-5.jpg' alt='' /></li>
							<li data-target='#carousel-custom' data-slide-to='5'><img
								src='images/shop/single-products/product-6.jpg' alt='' /></li>
							<li data-target='#carousel-custom' data-slide-to='6'><img
								src='images/shop/single-products/product-7.jpg' alt='' /></li>
						</ol>
					</div>
				</div>
			</div>
			<form id="updateform" action="gaguUpdate" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="gnum" value="${vo.gnum}">
				<div class="col-md-7">
					<div class="single-product-details">
						<h2>
							<input type="text" class="form-control" name="gname"
								value="${vo.gname}" id="gname" required="required">
						</h2>
						<p class="product-price">
							<input type="number" class="form-control" name="gprice"
								value="${vo.gprice}" id="gprice" required="required">
						</p>

						<p class="product-description mt-20">
							<textarea rows="6" cols="90" name="ginfo" id="ginfo"
								required="required">${vo.ginfo}</textarea>
						</p>
						<div class="product-quantity">
							<span>제조사: </span>
							<div class="product-quantity-slider">
								<input type="text" class="form-control" name="gcompany"
									value="${vo.gcompany}" id="gcompany" required="required">
							</div>
						</div>
						<br>
						<div class="color-swatches">
							<span>색상: </span>
							<ul>
								<li><input type="text" class="form-control" name="gcolor"
									value="${vo.gcolor}" id="gcolor" required="required"></li>
							</ul>
						</div>
						<br>
						<div class="product-price color-swatches">
							<span>사이즈: </span> <input type="text" class="form-control"
								name="gsize" value="${vo.gsize}" id="gsize" required="required">
						</div>
						<div class="product-quantity">
							<span>재고수량: </span>
							<div class="product-quantity-slider">
								<input type="number" class="form-control" name="gstock"
									value="${vo.gstock}" id="gstock" required="required">
							</div>
						</div>
						<div class="product-category">
							<span>종류: </span>
							<ul>
								<li><select class="form-control" name="ginum" id="ginum"
									required="required">
										<option value="" selected="selected">가구 종류</option>
										<c:forEach items="${list}" var="e">
											<option value="${e.ginum}">${e.giname}</option>
										</c:forEach>
								</select></li>
							</ul>
						</div>
						<br>
						<div class="color-swatches">
							<span>섬네일 이미지: </span>
							<div class="product-quantity-slider">
								<input type="file" class="form-control" name="multipartFile"
									id="gpicture" required="required">
							</div>
						</div>
						<div class="color-swatches">
							<span>상세 이미지: </span>
							<div class="product-quantity-slider">
								<input type="file" class="form-control" name="multipartFile2"
									id="gdetail" required="required">
							</div>
						</div>
						<br> <input type="submit" class="btn btn-main text-center"
							value="수정완료"> &nbsp;
						<button onclick="javascript:history.back()"
							class="btn btn-main text-center">뒤로가기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<%@include file="footer.jsp"%>