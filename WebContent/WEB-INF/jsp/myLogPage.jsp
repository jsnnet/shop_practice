<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<style>
table, th {
	text-align: center;
}
</style>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">로그인 기록</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li><a href="mypageinfo">마이페이지</a></li>
						<li class="active"><a href="mylogpage?page=1">로그인 기록 정보</a></li>
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
              <thead>
                <tr>
                  <th class="col-md-2 col-sm-3">일시</th>
                  <th class="col-md-2 col-sm-3">상태</th>
                  <th class="col-md-2 col-sm-3">로그인 IP</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="e" items="${list}">
                 <tr>
                  <td>${e.lltime}</td>
                  <td>${e.llstatus}</td>
                  <td>${e.reip}</td>
                 </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
        <div class="text-center">
        <%@include file="logListPage.jsp" %>
        </div>
      </div>
    </div>
  </div>
</section>
<%@include file="footer.jsp"%>
