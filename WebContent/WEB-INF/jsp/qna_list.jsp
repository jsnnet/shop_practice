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
					<h1 class="page-name">문의사항</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li class="active">문의사항</li>
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
          		<option value="0">선택</option>
            	<option value="1">교환/반품</option>
            	<option value="2">배송</option>
            	<option value="3">상품</option>
            	<option value="4">기타</option>
            	<option value="5">작성자</option>
            </select>
          </li>
          <li><input type="text" style="width:500px; height: 45px; font-size: 15px" name="searchValue"/> </li>
          <li><input type="submit" name="search" value="search" class="btn btn-main text-center"/> </li>
          <c:choose>
          	<%--로그인을 안 했을 때 --%>
          	<c:when test="${sessionScope.map.mid == null }">
          		<li></li>
          	</c:when>
          	<%--관리자일때 --%>
          	<c:when test="${sessionScope.map.madmin == 0}">
          	
          	</c:when>
          	<%--회원일때 작성가능 --%>
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
                  <th>번호</th>
                  <th>제목</th>
                  <th>분류</th>
                  <th>작성자</th>
                  <th class="col-md-2 col-sm-3">작성날짜</th>
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
	                  		<%-- 로그인을 하지 않았을 때 --%>
	                  		<c:when test="${sessionScope.map.mid == null}">
	                  		</c:when>
	                  		<%-- 회원일 때 --%>
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
	                  		<%-- 관리자일 때 --%>
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

	//상세보기용 비밀번호 체크 함수
	function titleclick(pwd) {
		if(${sessionScope.map.mid == null}){
			alert("로그인을 한 뒤 이용해 주세요");
			return false;
		}else if(${sessionScope.map.madmin==0}){
			return true;
		} else{
			var password= prompt("비밀번호를 입력하세요.","");
			if(password == pwd){
				location='qna_upform?num='+num;
			}else{
				alert("비밀번호 인증 실패");
				return false;
			}
		}
	}
	
	
	//수정용
	function upformCheck(num,pwd){
		//alert(pwd);
		var password= prompt("비밀번호를 입력하세요.","");
		if(password == pwd){
			location='qna_upform?num='+num;
		}else{
			alert("비밀번호 인증 실패");
		}
	}
	
	//삭제용
	function deleteCheck(num,pwd){
		//alert(pwd);
		if(${sessionScope.map.madmin==0}){
			if(confirm('삭제하시겠습니까?')){
				location='qna_delete?num='+num;
			}
		}else{
			var password= prompt("비밀번호를 입력하세요.","");
			if(password == pwd){
				location='qna_delete?num='+num;
			}else{
				alert("비밀번호 인증 실패");
			}
		}
	}
	
</script>