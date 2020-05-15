<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="header.jsp"%>
<style>
#target {
	color: red;
	background-color: yellow;
	width: 50%;
	font-size: 18px; /* ����Ӽ� */
	display: none;
}
</style>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">ȸ������</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li class="active">ȸ�� ���� ���</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="signin-page account">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="block text-center">

					<h2 class="text-center">ȸ�� ���</h2>

					<form class="text-left clearfix" action="addmember" method="post">
						<div class="form-group">
							<input type="text" class="form-control" name="mid" id="mid"
								placeholder="���̵�">
							<div class="text-right">
								&nbsp;<input type="button" id="idChkBtn" value="�ߺ�Ȯ��">
							</div>
							<p id="target"></p>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="mpwd" id="mpwd"
								placeholder="�н�����">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="mname" id="mname"
								placeholder="�̸�">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="mtel" id="mtel"
								placeholder="��ȭ��ȣ">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="mpost" id="mpost"
								placeholder="�����ȣ">
							<div class="text-right">
								<input type="button" id="postBtn" value="�����ȣ ã��">
							</div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="maddr1" id="maddr1"
								placeholder="�ּ�">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="maddr2" id="maddr2"
								placeholder="���ּ�">
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="memail"
								id="memail" placeholder="Email">
						</div>
						<div class="form-group">
							<select name="madmin" style="font-size: 15px; height: 45px">
								<option value="1">ȸ��</option>
								<option value="0">������</option>
							</select>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-main text-center">���</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</section>


<%@include file="footer.jsp"%>