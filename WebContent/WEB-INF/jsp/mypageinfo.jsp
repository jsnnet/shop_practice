<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp" %>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">����������</h1>
				</div>
			</div>
		</div>
	</div>
</section>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />



	<div class="container" align="center">

		<h2>${sessionScope.map.mid}���� ����</h2>
		
	<table class="userTable">
		<tr>
			<td><br></td>
		</tr>
		<tr>
			<td><a class="btn btn-main button-style text-center" href="${contextPath}/purchaseHistory?mnum=${sessionScope.map.mnum}" >���� ����  ��ȸ</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><a class="btn btn-main button-style text-center" href="mylogpage?page=1">�α��� ���</a></td>
		</tr>
		<tr> <td> <br> </td> </tr>
		
		<tr>
			<td><a class="btn btn-main button-style text-center" href="${contextPath}/myreviewlist?mid=${sessionScope.map.mid}">���� �� ����</a></td>
			<td><a class="btn btn-main button-style text-center" href="${contextPath}/myqnapage?mid=${sessionScope.map.mid}" >���� ����</a></td>
		</tr>
		<tr> <td> <br> </td> </tr>
		<tr>
			
			<c:if test="${sessionScope.map.madmin ==  1}">
				<td><a class="btn btn-main button-style text-center" href="${contextPath}/mypageform" >���� ���� ����/ȸ��Ż��</a></td>
				<td><a class="btn btn-main button-style text-center" href="${contextPath}/attend?mnum=${sessionScope.map.mnum}">�⼮üũ</a></td>
			</c:if>
			
		</tr>
	</table>
	<br>
	</div>

<%@include file="footer.jsp" %>	