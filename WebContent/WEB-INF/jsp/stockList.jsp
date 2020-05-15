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
					<h1 class="page-name">������</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li class="active">������</li>
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
									<th colspan="8">��� ��Ȳ
										<form action="stockFrom" method="post">
											<input type="hidden" name="page" value="1">
											<ul class="list-inline dashboard-menu text-center">
												<li><select name="searchType"
													style="font-size: 15px; height: 45px">
														<option value="0">����</option>
														<option value="1">�̸�</option>
														<option value="2">������</option>
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
									<th>��ȣ</th>
									<th>�̸�</th>
									<th>����</th>
									<th>ũ��</th>
									<th>������</th>
									<th>���</th>
									<th>����</th>
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
												value="${e.gprice }" />��</td>
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
									<th colspan="8">��� ���� ��Ȳ</th>
								</tr>
							</thead>

							<tbody class="sangdong_a" style="text-align: center;">
								<tr>
									<th>��ȣ</th>
									<th>�̸�</th>
									<th>����</th>
									<th>ũ��</th>
									<th>������</th>
									<th>���</th>
									<th>�߰�</th>
									<th>����</th>
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
												value="${e.gprice }" />��</td>
										<td><input class="btn btn-default" type="button"
											id="upBtn${i.count }" name="upBtn" value="�ֹ� �߰�"
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
<!-- �ֹ� ��ư -->
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