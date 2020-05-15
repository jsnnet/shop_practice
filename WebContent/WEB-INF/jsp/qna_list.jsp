<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<style>
	table,th{text-align: center;}
</style>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">���ǻ���</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li class="active">���ǻ���</li>
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
      
        <form action="qna_list" method="post">
        <input type="hidden" name="page" value="1">
        <ul class="list-inline dashboard-menu text-center">
          <li>
          	<select name="searchType" style="font-size: 15px; height: 45px">
          		<option value="0">����</option>
            	<option value="1">��ȯ/��ǰ</option>
            	<option value="2">���</option>
            	<option value="3">��ǰ</option>
            	<option value="4">��Ÿ</option>
            	<option value="5">�ۼ���</option>
            </select>
          </li>
          <li><input type="text" style="width:500px; height: 45px; font-size: 15px" name="searchValue"/> </li>
          <li><input type="submit" name="search" value="search" class="btn btn-main text-center"/> </li>
          <c:choose>
          	<%--�α����� �� ���� �� --%>
          	<c:when test="${sessionScope.map.mid == null }">
          		<li></li>
          	</c:when>
          	<%--�������϶� --%>
          	<c:when test="${sessionScope.map.madmin == 0}">
          	
          	</c:when>
          	<%--ȸ���϶� �ۼ����� --%>
          	<c:otherwise>
          		<li><input type="button" class="btn btn-main text-center" value="Write" onclick="location='qnaform'">
          	</c:otherwise>
          </c:choose>
        </ul>
        </form>
        
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
              <tbody>
                <c:forEach var="e" items="${list}">
                 <tr>
               	  <td id="tnum">${e.qnum}</td>
                  <td><a href="qna_detailForm?num=${e.qnum}" id="title" onclick="return titleclick('${e.qpwd}');">${e.qtitle}</a></td>
                  <td>${e.qcatagory}</td>
                  <td>${e.mid}</td>
                  <td>${e.qdate}</td>
                  <td>
	              	<div class="btn-group" role="group">
	                  	<c:choose>
	                  		<%-- �α����� ���� �ʾ��� �� --%>
	                  		<c:when test="${sessionScope.map.mid == null}">
	                  		</c:when>
	                  		<%-- ȸ���� �� --%>
	                  		<c:when test="${sessionScope.map.madmin == 1}">
		                  		<button type="button" class="btn btn-default"
		                  				onclick="upformCheck(${e.qnum},'${e.qpwd}');">
			                    	<i class="tf-pencil2" aria-hidden="true"></i>
			                    </button>
								<button type="button" class="btn btn-default"
										onclick="deleteCheck(${e.qnum},'${e.qpwd}');">
			                      	<i class="tf-ion-close" aria-hidden="true"></i>
			                    </button>
	                  		</c:when>
	                  		<%-- �������� �� --%>
	                  		<c:otherwise>
			                    <button type="button" id="btn" class="btn btn-default"
			                    		onclick="deleteCheck(${e.qnum});">
			                      	<i class="tf-ion-close" aria-hidden="true"></i>
			                    </button>
	                  		</c:otherwise>
	                    </c:choose>
	              	</div>
                  </td>
                 </tr>
                </c:forEach>
                <tr>
                	<td colspan="6">
                	 <%@include file="qna_page.jsp" %>
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
<%@include file="footer.jsp"%>
<script>

	//�󼼺���� ��й�ȣ üũ �Լ�
	function titleclick(pwd) {
		if(${sessionScope.map.mid == null}){
			alert("�α����� �� �� �̿��� �ּ���");
			return false;
		}else if(${sessionScope.map.madmin==0}){
			return true;
		} else{
			var password= prompt("��й�ȣ�� �Է��ϼ���.","");
			if(password == pwd){
				location='qna_upform?num='+num;
			}else{
				alert("��й�ȣ ���� ����");
				return false;
			}
		}
	}
	
	
	//������
	function upformCheck(num,pwd){
		//alert(pwd);
		var password= prompt("��й�ȣ�� �Է��ϼ���.","");
		if(password == pwd){
			location='qna_upform?num='+num;
		}else{
			alert("��й�ȣ ���� ����");
		}
	}
	
	//������
	function deleteCheck(num,pwd){
		//alert(pwd);
		if(${sessionScope.map.madmin==0}){
			if(confirm('�����Ͻðڽ��ϱ�?')){
				location='qna_delete?num='+num;
			}
		}else{
			var password= prompt("��й�ȣ�� �Է��ϼ���.","");
			if(password == pwd){
				location='qna_delete?num='+num;
			}else{
				alert("��й�ȣ ���� ����");
			}
		}
	}
	
</script>