<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp" %>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">마이페이지</h1>
				</div>
			</div>
		</div>
	</div>
</section>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />



	<div class="container" align="center">

		<h2>${sessionScope.map.mid}님의 정보</h2>
		
	<table class="userTable">
		<tr>
			<td><br></td>
		</tr>
		<tr>
			<td><a class="btn btn-main button-style text-center" href="${contextPath}/purchaseHistory?mnum=${sessionScope.map.mnum}" >구매 내역  조회</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><a class="btn btn-main button-style text-center" href="mylogpage?page=1">로그인 기록</a></td>
		</tr>
		<tr> <td> <br> </td> </tr>
		
		<tr>
			<td><a class="btn btn-main button-style text-center" href="${contextPath}/myreviewlist?mid=${sessionScope.map.mid}">내가 쓴 리뷰</a></td>
			<td><a class="btn btn-main button-style text-center" href="${contextPath}/myqnapage?mid=${sessionScope.map.mid}" >문의 내역</a></td>
		</tr>
		<tr> <td> <br> </td> </tr>
		<tr>
			
			<c:if test="${sessionScope.map.madmin ==  1}">
				<td><a class="btn btn-main button-style text-center" href="${contextPath}/mypageform" >개인 정보 변경/회원탈퇴</a></td>
				<td><a class="btn btn-main button-style text-center" href="${contextPath}/attend?mnum=${sessionScope.map.mnum}">출석체크</a></td>
			</c:if>
			
		</tr>
	</table>
	<br>
	</div>

<%@include file="footer.jsp" %>	