<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content" style="text-align: center;">
					<h1 class="page-name">게시물 수정</h1>
					<ol class="breadcrumb">
						<li><a href="notice_list?page=1">Home</a></li>
						<li class="active">update</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="page-wrapper">
	<div class="contact-section">
		<div class="container">
			<div class="row">
				<!-- Contact Form -->
				<div style="margin: auto; width: 500px">
				
					<form method="post" action="notice_update" role="form" style="text-align: center;">
						<input type="hidden" value="${vo.nnum}" name="nnum">
						
						<div class="form-group">
							<p style="margin-left: -90% ">제목</p>
							<input type="text" value="${vo.ntitle }" class="form-control" name="ntitle" required="required">
						</div>

						<div class="form-group">
							<p style="margin-left: -90% ">내용 </p>
							<textarea rows="10" class="form-control" name="ncontent">${vo.ncontent}</textarea>
						</div>
						
						<div id="cf-submit">
							<input type="submit" class="btn btn-main text-center" value="Submit">
							<input type="button" class="btn btn-main text-center" value="List" onclick="location='notice_list?page=1'">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="footer.jsp"%>

</script>