<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>
<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
         	<a class="logo" href="main">
            	<img src="images/logo.png" alt="">
          	</a>
			<h2 class="text-center">상품문의</h2>
			<hr>
			<form class="text-left clearfix" action="qna_write" method="post">
			<input type="hidden" value="${sessionScope.map.mnum}" name="mnum">
				<div class="form-group">
					<p style="font-size: 15px">제목 : <input type="text" class="form-control" name="qtitle" required="required"></p>
            	</div>
            	<div class="form-group">
            		<p style="font-size: 15px">분류 :
            		<select name="qcatagory" style="font-size: 15px; width: 200px">
            			<option>교환/반품</option>
            			<option>배송</option>
            			<option>상품</option>
            			<option>기타</option>
            		</select>
            		</p>
            	</div>
            	<div class="form-group">
					<p style="font-size: 15px">내용 :<textarea rows="5" cols="59" name="qcontent"></textarea></p>
            	</div>
            	<div class="form-group">
            		<p style="font-size: 15px">비밀번호 :
            			<input type="password" class="form-control" name="qpwd" id="pwd"
            				required="required" pattern="[a-z0-9]+"
            				oninvalid="this.setCustomValidity('숫자나 영어소문자로만 입력해주세요.')"
            				oninput="this.setCustomValidity('')"></p>
            	</div>
            	<div class="text-center">
             		<button type="submit" class="btn btn-main text-center">Write</button>
             		<button type="button" class="btn btn-main text-center" onclick="location='qna_list?page=1'">List</button>
            	</div>
			</form>
			
        </div>
      </div>
    </div>
  </div>
</section>
<%@include file="footer.jsp"%>
