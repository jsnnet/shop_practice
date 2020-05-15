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
			<h2 class="text-center">공지사항 작성</h2>
			<hr>
			<form class="text-left clearfix" action="notice_write" method="post">
				<div class="form-group">
					<p style="font-size: 15px">제목 : <input type="text" class="form-control" name="ntitle" required="required"></p>
            	</div>
            	<div class="form-group">
					<p style="font-size: 15px">내용 :<textarea rows="5" cols="59" name="ncontent"></textarea></p>
            	</div>
            	<div class="text-center">
             		<button type="submit" class="btn btn-main text-center">Write</button>
             		<button type="button" class="btn btn-main text-center" onclick="location='notice_list?page=1'">List</button>
            	</div>
			</form>
			
        </div>
      </div>
    </div>
  </div>
</section>
<%@include file="footer.jsp"%>
