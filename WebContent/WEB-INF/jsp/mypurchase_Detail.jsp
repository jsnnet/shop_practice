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
					<h1 class="page-name">�ֹ� �󼼺���</h1>
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
							<p style="font-size: 20px; font-weight: bold;">�ֹ���ȣ : ${ovo.onum}��  &nbsp;|&nbsp; �ֹ����� : ${ovo.odate}</p>
							<br>
							<thead>
								<tr>
									<th class="width">���� ����Ʈ</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>��ǰ�̸�</td>
									<td style="width:330px;">��ǰ ����</td>
									<td>����</td>
									<td>����</td>
									<td>�� ����</td>
								</tr>
								
									<c:forEach var="e" items="${ovo.gorderDetail}">
										<tr>
											<td><a href="gaguShopDetail?gnum=${e.gagu.gnum}">${e.gagu.gname}</a></td>
											<td>${e.gagu.ginfo} | ���� : ${e.gagu.gcolor}</td>
											<td>${e.odamount}��</td>
											<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${e.gagu.gprice}" />��</td>
											<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${e.odprice}" />��</td>
										</tr>
									</c:forEach>
							</tbody>
							</c:forEach>
						</table>
						<table class="table">
							<tbody>
								<tr>
									<th class="width">����</th>
									<c:forEach var="e" items="${list}">
									<td>
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${e.ototal}" />��
									</td>
									</c:forEach>
								</tr>
							</tbody>
						</table>
						<hr>
						<table class="table info">
							<thead>
								<tr>
									<th>ȸ�� ����</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="width">�̸�</td>
									<td>${sessionScope.map.mname}</td>
								</tr>
								<tr>
									<td class="width">�޴��� ��ȣ</td>
									<td>${sessionScope.map.mtel}</td>
								</tr>
								<tr>
									<td class="width">�̸���</td>
									<td>${sessionScope.map.memail}</td>
								</tr>
								<tr>
									<td class="width">�ּ�</td>
									<td>
										<p>${sessionScope.map.maddr1}</p>
										<p>�� �ּ� : ${sessionScope.map.maddr2}</p>
										<p>�����ȣ : ${sessionScope.map.mpost}</p>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="table">
							<c:forEach var="e" items="${list}">
							<thead>
								<tr>
									<th>�޴� ��� ����</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="width">�̸�</td>
									<td>${e.oname}</td>
								</tr>
								<tr>
									<td class="width">��ȭ��ȣ</td>
									<td>${e.otel}</td>
								</tr>
								<tr>
									<td class="width">��� �ּ�</td>
									<td><p>�����ȣ : ${e.opost}</p>
										<p>�ּ� : ${e.oaddr1}</p>
										<p>���ּ� : ${e.oaddr2 }</p></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2" style="text-align: right;">
										<input type="button" value="���ư���" class="btn btn-main text-center"
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