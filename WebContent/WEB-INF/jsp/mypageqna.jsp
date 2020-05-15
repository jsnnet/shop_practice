<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<style>
	th{text-align: center;}
</style>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">���� ���ǳ���</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li><a href="mypageinfo">����������</a></li>
						<li class="active">���� ���ǳ���</li>
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
                  <th>��ȣ</th>
                  <th>����</th>
                  <th>�з�</th>
                  <th>�ۼ���</th>
                  <th class="col-md-2 col-sm-3">�ۼ���¥</th>
            
                  <th></th>

        
          
                </tr>
              </thead>
              <tbody class="text-center">
              <c:forEach var="e" items="${list}">
              <tr>
              <td>${e.mynum}</td>
              <td><a href="qna_detailForm?num=${e.qnum}">${e.qtitle}</a></td>
              <td>${e.qcatagory}</td>
              <td>${e.mid}</td>
              <td>${e.qdate}</td>
            
              </tr>
              </c:forEach>
              <tr>
              <td colspan="6"><ul class="list-inline dashboard-menu text-center">
        	  <li><a href="qnaform" style="dashboard-menu">Write</a></li>
       		  </ul>
       		  </td>
              </tr>
              </tbody>
      
              
              
              
              
   
              </table>
              </div>
              </div>
              </div>
              </div>
              </div>
</section>