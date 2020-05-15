<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="header.jsp"%>
<style>
	.width{width: 200px;}
</style>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">주문 상세보기</h1>
					<ol class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li class="active">my account</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="user-dashboard page-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="dashboard-wrapper user-dashboard">
					<div class="table-responsive">
						<table class="table">
							<c:forEach var="ovo" items="${list}">
							<p style="font-size: 20px; font-weight: bold;">주문번호 : ${ovo.onum}번  &nbsp;|&nbsp; 주문일자 : ${ovo.odate}</p>
							<br>
							<thead>
								<tr>
									<th class="width">구매 리스트</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>상품이름</td>
									<td style="width:330px;">상품 정보</td>
									<td>갯수</td>
									<td>가격</td>
									<td>총 가격</td>
								</tr>
								
									<c:forEach var="e" items="${ovo.gorderDetail}">
										<tr>
											<td><a href="gaguShopDetail?gnum=${e.gagu.gnum}">${e.gagu.gname}</a></td>
											<td>${e.gagu.ginfo} | 색상 : ${e.gagu.gcolor}</td>
											<td>${e.odamount}개</td>
											<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${e.gagu.gprice}" />원</td>
											<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${e.odprice}" />원</td>
										</tr>
									</c:forEach>
							</tbody>
							</c:forEach>
						</table>
						<table class="table">
							<tbody>
								<tr>
									<th class="width">결제</th>
									<c:forEach var="e" items="${list}">
									<td>
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${e.ototal}" />원
									</td>
									</c:forEach>
								</tr>
							</tbody>
						</table>
						<hr>
						<table class="table info">
							<thead>
								<tr>
									<th>회원 정보</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="width">이름</td>
									<td>${sessionScope.map.mname}</td>
								</tr>
								<tr>
									<td class="width">휴대폰 번호</td>
									<td>${sessionScope.map.mtel}</td>
								</tr>
								<tr>
									<td class="width">이메일</td>
									<td>${sessionScope.map.memail}</td>
								</tr>
								<tr>
									<td class="width">주소</td>
									<td>
										<p>${sessionScope.map.maddr1}</p>
										<p>상세 주소 : ${sessionScope.map.maddr2}</p>
										<p>우편번호 : ${sessionScope.map.mpost}</p>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="table">
							<c:forEach var="e" items="${list}">
							<thead>
								<tr>
									<th>받는 사람 정보</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="width">이름</td>
									<td>${e.oname}</td>
								</tr>
								<tr>
									<td class="width">전화번호</td>
									<td>${e.otel}</td>
								</tr>
								<tr>
									<td class="width">배송 주소</td>
									<td><p>우편번호 : ${e.opost}</p>
										<p>주소 : ${e.oaddr1}</p>
										<p>상세주소 : ${e.oaddr2 }</p></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2" style="text-align: right;">
										<input type="button" value="돌아가기" class="btn btn-main text-center"
										onclick="location='purchaseHistory?mnum=${e.mnum}'">
									</td>
								</tr>
							</tfoot>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="footer.jsp"%>
<script>

</script>