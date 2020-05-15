<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">�˻� : "${searchValue}"</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li class="active">${searchValue}</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="products section">
	<div class="container">
		<div class="row">
				<div class="row">
					<div id="searchTarget">
						<c:if test="${empty list}">
							<div class="col-md-4">
								<h3>�˻� ����� �����ϴ�.</h3>
							</div>
						</c:if>
						<c:if test="${not empty list}">
							<!-- ���� ����Ʈ �ϳ� ���� -->
							<c:forEach items="${list}" var="e">
								<div class="col-md-4">
									<div class="product-item">
										<div class="product-thumb">
											<img class="img-responsive"
												src="resources/images/shop/products/${e.gpicture}"
												alt="product-img" />
											<div class="preview-meta">
												<ul>
													<li><a href="gaguShopDetail?gnum=${e.gnum}"><i
															class="tf-ion-ios-search"></i></a>
													</li>
												</ul>
											</div>
										</div>
										<div class="product-content">
											<h4>
												<a href="gaguShopDetail?gnum=${e.gnum}">${e.gname}</a>
											</h4>
											<p class="product-price">${e.gprice}</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
					<!-- ���� ����Ʈ �ϳ� �� -->
					
				</div>
				<c:if test="${not empty list}">
					<div style="text-align: center;">
						<%@include file="searchform_page.jsp"%>
					</div>
				</c:if>
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
			// �ش� üũ�ڽ��� Value ��������
			var value = $(this).text();
			$(this).text($.fn.priceBuilder(value) + ' ��');
		});
	});
</script>

<%@include file="footer.jsp"%>