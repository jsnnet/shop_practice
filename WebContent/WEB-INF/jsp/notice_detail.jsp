<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12" >
				<div class="content">
					<h1 class="page-name">상세 공지</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li><a href="notice_list?page=1">공지사항</a></li>
						<li class="active">상세 공지</li>
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
										<th style="width: 150px"><strong>게시물 번호:</strong></th>
										<th>${vo.nnum}</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td><strong>제목 : </strong></td>
										<td>${vo.ntitle}</td>
									</tr>
									<tr>
										<td><strong>업데이트 날짜:</strong></td>
										<td>${vo.ndate}</td>
									</tr>
									<tr>
										<td><strong>내용 :</strong></td>
										<td>${vo.ncontent}</td>
									</tr>
									<tr>
										<td style="text-align: right;" colspan="2">
										<c:choose>
											<%--회원일때 --%>
											<c:when test="${sessionScope.map.madmin == 1}">
											</c:when>
											<%--로그인 안했을때 --%>
											<c:when test="${sessionScope.map.madmin == null}">
											</c:when>
											<%--관리자 일때 --%>
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
		if(confirm('삭제하시겠습니까?')){
			location='notice_delete?num=${vo.nnum}';
		}		
	}
</script>