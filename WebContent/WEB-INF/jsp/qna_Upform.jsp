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
						<li><a href="qna_list">Home</a></li>
						<li class="active">contact</li>
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
				
					<form method="post" action="qna_update" role="form" style="text-align: center;">
					
						<input type="hidden" value="${vo.qnum}" name="qnum">
						
						<div class="form-group">
							<p style="margin-left: -90% ">제목</p>
							<input type="text" value="${vo.qtitle }" class="form-control" name="qtitle" required="required">
						</div>

						<div class="form-group">
							<p style="margin-left: -90% ">분류 </p>
							<select id="select" name="qcatagory" style="font-size: 15px; width: 100%" class="form-control">
		            			<option value="교환/반품">교환/반품</option>
		            			<option value="배송">배송</option>
		            			<option value="상품">상품</option>
		            			<option value="기타">기타</option>
            				</select>
						</div>

						<div class="form-group">
							<p style="margin-left: -90% ">내용 </p>
							<textarea rows="6" class="form-control" name="qcontent">${vo.qcontent}</textarea>
						</div>
						
						<div class="form-group">
							<p style="margin-left: -90% ">비밀번호</p>
							<input type="text" value="${vo.qpwd }" class="form-control" name="qpwd"
								required="required" pattern="[a-z0-9]+"
	            				oninvalid="this.setCustomValidity('숫자나 영어소문자로만 입력해주세요.')"
	            				oninput="this.setCustomValidity('')">
						</div>
						
						<div id="cf-submit">
							<input type="submit" class="btn btn-main text-center" value="Submit">
							<input type="button" class="btn btn-main text-center" value="List" onclick="location='qna_list?page=1'">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="footer.jsp"%>
<script>
 	$(function(){
 		$("#select > option[value='${vo.qcatagory}']").attr("selected","selected");
 	})
</script>