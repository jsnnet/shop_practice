<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<style>
td, th {
	text-align: center;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">재고관리</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li class="active">재고관리</li>
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
						<table class="table info">
							<thead>
								<tr>
									<th colspan="8">재고 현황
										<form action="stockFrom" method="post">
											<input type="hidden" name="page" value="1">
											<ul class="list-inline dashboard-menu text-center">
												<li><select name="searchType"
													style="font-size: 15px; height: 45px">
														<option value="0">선택</option>
														<option value="1">이름</option>
														<option value="2">제조사</option>
												</select></li>
												<li><input type="text"
													style="width: 500px; height: 45px; font-size: 15px"
													name="searchValue" /></li>
												<li><input type="submit" name="search" value="search"
													class="btn btn-main text-center" /></li>
											</ul>
										</form>
									</th>
								</tr>
							</thead>

							<tbody class="sangdong_a" style="text-align: center;">
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>색상</th>
									<th>크기</th>
									<th>제조사</th>
									<th>재고</th>
									<th>가격</th>
								</tr>
								<c:forEach var="e" items="${gvo }">
									<tr class="">
										<td>${e.gnum }</td>
										<td>${e.gname }</td>
										<td>${e.gcolor }</td>
										<td>${e.gsize }</td>
										<td>${e.gcompany }</td>
										<td>${e.gstock }</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${e.gprice }" />원</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="7"><%@include file="stock_page.jsp"%>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="table check">
							<thead>
								<tr>
									<th colspan="8">재고 부족 현황</th>
								</tr>
							</thead>

							<tbody class="sangdong_a" style="text-align: center;">
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>색상</th>
									<th>크기</th>
									<th>제조사</th>
									<th>재고</th>
									<th>추가</th>
									<th>가격</th>
									<th></th>
								</tr>
								<c:forEach var="e" items="${stvo }" varStatus="i">
									<tr class="stock_up">
										<td>${e.gnum }</td>
										<td>${e.gname }</td>
										<td>${e.gcolor }</td>
										<td>${e.gsize }</td>
										<td>${e.gcompany }</td>
										<td>${e.gstock }</td>
										<td class="stock_up${i.count }"><input type="number"
											id="stockUp${i.count }" name="stockUp${i.count }" value="1"
											min="0"></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${e.gprice }" />원</td>
										<td><input class="btn btn-default" type="button"
											id="upBtn${i.count }" name="upBtn" value="주문 추가"
											data-gnum="${e.gnum }"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 주문 버튼 -->
<script>
<c:forEach var="e" items="${stvo }" varStatus="i">
$('#upBtn'+${i.count}).click(function () {
         var stock = $('#stockUp'+${i.count}).val();
         var gnum = $(this).attr("data-gnum");
         $.ajax({
             url : "stockUp",
             type : "post",
             data : {"stock" : stock,"gnum" : gnum}
         })
         location.reload();
 })
 </c:forEach>
</script>
<%@ include file="footer.jsp"%>