<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content" style="text-align: center;">
					<h1 class="page-name">�Խù� ����</h1>
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
							<p style="margin-left: -90% ">����</p>
							<input type="text" value="${vo.qtitle }" class="form-control" name="qtitle" required="required">
						</div>

						<div class="form-group">
							<p style="margin-left: -90% ">�з� </p>
							<select id="select" name="qcatagory" style="font-size: 15px; width: 100%" class="form-control">
		            			<option value="��ȯ/��ǰ">��ȯ/��ǰ</option>
		            			<option value="���">���</option>
		            			<option value="��ǰ">��ǰ</option>
		            			<option value="��Ÿ">��Ÿ</option>
            				</select>
						</div>

						<div class="form-group">
							<p style="margin-left: -90% ">���� </p>
							<textarea rows="6" class="form-control" name="qcontent">${vo.qcontent}</textarea>
						</div>
						
						<div class="form-group">
							<p style="margin-left: -90% ">��й�ȣ</p>
							<input type="text" value="${vo.qpwd }" class="form-control" name="qpwd"
								required="required" pattern="[a-z0-9]+"
	            				oninvalid="this.setCustomValidity('���ڳ� ����ҹ��ڷθ� �Է����ּ���.')"
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