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
			<h2 class="text-center">��ǰ����</h2>
			<hr>
			<form class="text-left clearfix" action="qna_write" method="post">
			<input type="hidden" value="${sessionScope.map.mnum}" name="mnum">
				<div class="form-group">
					<p style="font-size: 15px">���� : <input type="text" class="form-control" name="qtitle" required="required"></p>
            	</div>
            	<div class="form-group">
            		<p style="font-size: 15px">�з� :
            		<select name="qcatagory" style="font-size: 15px; width: 200px">
            			<option>��ȯ/��ǰ</option>
            			<option>���</option>
            			<option>��ǰ</option>
            			<option>��Ÿ</option>
            		</select>
            		</p>
            	</div>
            	<div class="form-group">
					<p style="font-size: 15px">���� :<textarea rows="5" cols="59" name="qcontent"></textarea></p>
            	</div>
            	<div class="form-group">
            		<p style="font-size: 15px">��й�ȣ :
            			<input type="password" class="form-control" name="qpwd" id="pwd"
            				required="required" pattern="[a-z0-9]+"
            				oninvalid="this.setCustomValidity('���ڳ� ����ҹ��ڷθ� �Է����ּ���.')"
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
