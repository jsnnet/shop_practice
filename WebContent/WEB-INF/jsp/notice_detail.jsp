<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12" >
				<div class="content">
					<h1 class="page-name">�� ����</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li><a href="notice_list?page=1">��������</a></li>
						<li class="active">�� ����</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>

<div class="page-wrapper">
	<div class="purchase-confirmation shopping">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="block ">
						<div class="purchase-confirmation-details">
							<table class="table" style="width: 100%">
								<thead>
									<tr>
										<th style="width: 150px"><strong>�Խù� ��ȣ:</strong></th>
										<th>${vo.nnum}</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td><strong>���� : </strong></td>
										<td>${vo.ntitle}</td>
									</tr>
									<tr>
										<td><strong>������Ʈ ��¥:</strong></td>
										<td>${vo.ndate}</td>
									</tr>
									<tr>
										<td><strong>���� :</strong></td>
										<td>${vo.ncontent}</td>
									</tr>
									<tr>
										<td style="text-align: right;" colspan="2">
										<c:choose>
											<%--ȸ���϶� --%>
											<c:when test="${sessionScope.map.madmin == 1}">
											</c:when>
											<%--�α��� �������� --%>
											<c:when test="${sessionScope.map.madmin == null}">
											</c:when>
											<%--������ �϶� --%>
											<c:otherwise>
												<button type="button" class="btn btn-default"
													onclick="location='notice_upform?num=${vo.nnum}'">
													<i class="tf-pencil2" aria-hidden="true"></i>
												</button>
												<button type="button" class="btn btn-default"
													onclick="return deleteCheck();">
													<i class="tf-ion-close" aria-hidden="true"></i>
												</button>
											</c:otherwise>
										</c:choose>
										&nbsp;
										<input type="button" class="btn btn-main text-center" 
											onclick="location='notice_list?page=1'" value="list">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="footer.jsp"%>
<script>
	function deleteCheck(){
		//alert(pwd);
		if(confirm('�����Ͻðڽ��ϱ�?')){
			location='notice_delete?num=${vo.nnum}';
		}		
	}
</script>