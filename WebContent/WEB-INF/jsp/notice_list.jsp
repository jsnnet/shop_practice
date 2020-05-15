<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">공지사항</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li class="active">공지사항</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>

<div class="page-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="post">
					<form action="notice_list" method="post" style="margin: auto;">
						<input type="hidden" name="page" value="1">
						<ul class="list-inline dashboard-menu"
							style="margin: auto; text-align: center;">
							<li><select name="searchType"
								style="font-size: 15px; height: 45px">
									<option value="0">전체</option>
									<option value="1">번호</option>
									<option value="2">제목</option>
							</select></li>
							<li><input type="text"
								style="width: 500px; height: 45px; font-size: 15px"
								name="searchValue" /></li>
							<li><input type="submit" name="search" value="search"
								class="btn btn-main text-center" /></li>
							<c:choose>
								<%--관리자일때 --%>
								<c:when test="${sessionScope.map.madmin == 0}">
									<li><input type="button" onclick="location='noticeForm'"
										value="write" class="btn btn-main text-center"></li>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</ul>
					</form>
					<hr>
					<table style="margin: auto;">
						<c:forEach var="e" items="${list}">
							<tr>
								<td>
									<h2 class="post-title">
										<a href="notice_detail?num=${e.nnum}">No.${e.nnum} |
											${e.ntitle}</a>
									</h2>
								</td>
							</tr>
							<tr>
								<td>
									<div class="post-meta">
										<ul>
											<li><i class="tf-ion-ios-calendar"></i>${e.ndate}</li>
											<li><i class="tf-ion-android-person"></i> POSTED BY
												ADMIN</li>
										</ul>
									</div>
								</td>
								<td>
									<div class="post-content">
										<a href="notice_detail?num=${e.nnum}" class="btn btn-main">Continue
											Reading</a>
									</div>
								</td>
							</tr>
						</c:forEach>
						<hr>
						<tr>
							<td colspan="2" style="text-align: center;"><%@include
									file="notice_page.jsp"%></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="footer.jsp"%>
