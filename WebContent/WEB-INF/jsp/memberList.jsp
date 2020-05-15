<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<style>
table, th {
	text-align: center;
	white-space: nowrap;
}
</style>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">회원 조회</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li class="active">회원 리스트</li>
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

				<form action="memberlist" method="post">
					<ul class="list-inline dashboard-menu text-center">
						<li><select name="searchType"
							style="font-size: 15px; height: 45px">
								<option value="0">선택</option>
								<option value="1">아이디</option>
								<option value="2">이름</option>
								<option value="3">이메일</option>
								<option value="4">권한</option>
						</select></li>
						<li><input type="text"
							style="width: 500px; height: 45px; font-size: 15px"
							name="searchValue" /></li>
						<li><input type="submit" name="search" value="검색"
							class="btn btn-main text-center" /></li>
					</ul>
				</form>

				<div class="dashboard-wrapper user-dashboard">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>회원번호</th>
									<th>아이디</th>
									<th>비밀번호</th>
									<th>이름</th>
									<th>주소</th>
									<th>우편번호</th>
									<th>전화번호</th>
									<th>이메일</th>
									<th class="col-md-2 col-sm-3">등록일시</th>
									<th>권한</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="e" items="${list}">
									<tr>
										<td>${e.mnum}</td>
										<td><a>${e.mid}</a></td>
										<td>${e.mpwd}</td>
										<td>${e.mname}</td>
										<td>${e.maddr1}${e.maddr2}</td>
										<td>${e.mpost}</td>
										<td>${e.mtel}</td>
										<td>${e.memail}</td>
										<td>${e.medate}</td>
										<td><c:choose>
												<c:when test="${e.madmin == '0'}">
                  		관리자
                  	</c:when>
												<c:otherwise>
                  		사용자
                  	</c:otherwise>
											</c:choose></td>
										<td>
											<div class="btn-group" role="group">
												<button type="button" class="btn btn-default"
													onclick="location='updatememberform?mnum=${e.mnum}'">
													<i class="tf-pencil2" aria-hidden="true"></i>
												</button>
												<button type="button" class="btn btn-default"
													onclick="location='deletemember?mnum=${e.mnum}'">
													<i class="tf-ion-close" aria-hidden="true"></i>
												</button>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div style="text-align: center">
					<%@include file="memberList_page.jsp"%>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="footer.jsp"%>