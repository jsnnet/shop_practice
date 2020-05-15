<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<style>
	th{text-align: center;}
</style>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">주문 내역 조회</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li><a href="mypageinfo">마이페이지</a></li>
						<li class="active"><a href="purchaseHistory?mnum=${sessionScope.map.mnum}">주문 내역 조회</a></li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>

<div class="page-wrapper">
  <div class="cart shopping">
    <div class="container">
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="block">
            <div class="product-list">
                <table class="table" >
                  <thead>
                    <tr>
                      <th>주문 번호</th>
                      <th style="width: auto;">제품정보</th>
                      <th style="width: 100px;">주문 일자</th>
                      <th>총 금액</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="ovo" items="${list}">
                    <tr>
                      <td style="text-align: center;" rowspan="1">
                      	<a>${ovo.onum}</a><br>
                      	<a><input type="button" value="주문상세보기" class="btn btn-default"
                      	onclick="location='purchaseDetail?onum=${ovo.onum}'"></a>
                      </td>
                      <td>
                        <div class="product-info">
                        <table class="table">
                        	<c:forEach var="e" items="${ovo.gorderDetail}" begin="0" end="1">
							<tr>
								<td rowspan="3" width="100px;">
									<a href="gaguShopDetail?gnum=${e.gagu.gnum}">
										<img src="resources/images/shop/products/${e.gagu.gpicture}"
		                        		style="width: 110px;">
	                        		</a>
                        		</td>
                        		<td style="width:80px;">상품명 :</td>
                        		<td>
                        			${e.gagu.gname}
                        		</td>
							</tr>
							<tr>
								<td style="width:90px;">상품 가격 :</td>
								<td class="gprice">
									${e.gagu.gprice}
								</td>
							</tr>
							<tr>
								<td style="width:90px;">상품 개수:</td>
								<td>${e.odamount}개</td>
							</tr>
                        	</c:forEach>
                        </table>
                        </div>
                      </td>
                      <td>${ovo.odate}</td>
                      <td style="text-align: center;" class="ototal">${ovo.ototal}</td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
                <a href="mypageinfo" class="btn btn-main pull-right">되돌아가기</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="footer.jsp"%>
<script>
	$(function(){
		$.fn.priceBuilder = function(price) {
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		$(".ototal").each(function(idx) {
			// 해당 체크박스의 Value 가져오기
			var value = $(this).text();
			$(this).text($.fn.priceBuilder(value) + ' 원');
		});
		
		$(".gprice").each(function(idx) {
			// 해당 체크박스의 Value 가져오기
			var value = $(this).text();
			$(this).text($.fn.priceBuilder(value) + ' 원');
		});
	});
</script>