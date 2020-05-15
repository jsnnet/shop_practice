<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<%@include file="header.jsp"%>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">��ǰ����</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li class="active"><a href="main">��ǰ ���� ���</a></li>
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
					<a class="logo" href="main"> <img src="images/logo.png" alt="">
					</a>
					<h2 class="text-center">��ǰ ���</h2>
					<form class="text-left clearfix" action="gaguAdd" method="post"
						enctype="multipart/form-data" id="gaguform">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="���� �̸�"
								name="gname" id="gname" required="required">
						</div>
						<div class="form-group">
							<select class="form-control" name="ginum" id="ginum"
								required="required">
								<option value="">���� ����</option>
								<c:forEach items="${list}" var="e">
									<option value="${e.ginum}">${e.giname}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<textarea rows="5" cols="3" class="form-control" name="ginfo"
								id="ginfo" placeholder="��������" style="resize: none;"
								required="required"></textarea>
						</div>
						<div class="form-group">
							<select class="form-control" name="gcolor" id="gcolor"
								required="required">
								<option value="">���� ����</option>
								<option value="brown">����</option>
								<option value="white">���</option>
								<option value="dark-brown">£������</option>
								<option value="red-rose">������̻�</option>
								<option value="gray">ȸ��</option>
								<option value="black">������</option>
								<option value="navy">���̺��</option>
								<option value="light-gray">����ȸ��</option>
								<option value="light-navy">��������</option>
								<option value="ivory">���Ƹ���</option>
								<option value="dark-gray">��ο�ȸ��</option>
								<option value="dark-mint">��ο��Ʈ</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="���� ũ��"
								name="gsize" id="gsize" required="required">
						</div>

						<div class="form-group">
							<select class="form-control" name="gcompany" id="gcompany"
								required="required">
								<option value="">���� ������</option>
								<option value="Ikea">���ɾ�</option>
								<option value="Yuri">������������</option>
								<option value="Daechidong">��ġ����������</option>
								<option value="�׷���ħ��">�׷���ħ��</option>
								<option value="�ݼ�ħ��">�ݼ�ħ��</option>
								<option value="�ѻ�">�ѻ�</option>
								<option value="���Ͼ�">���Ͼ�</option>
								<option value="������">������</option>
								<option value="������Ʈ�����">������Ʈ�����</option>
								<option value="��Ʈ���Ͽ콺">��Ʈ���Ͽ콺</option>
							</select>
						</div>

						<div class="form-group">
							<input type="number" class="form-control" placeholder="���� ����"
								name="gprice" id="gprice" required="required">
						</div>
						<div class="form-group">
							<input type="number" class="form-control" placeholder="���� ���"
								name="gstock" id="gstock" required="required">
						</div>
						<div class="form-group">
							<input type="file" class="form-control" placeholder="���� ������ �̹���"
								name="multipartFile" id="gpicture" required="required">
						</div>
						<div class="form-group">
							<input type="file" class="form-control" placeholder="���� ���� �̹���"
								name="multipartFile2" id="gdetail" required="required">
						</div>
						<div class="text-center">
							<button type="submit" id="submitbtn"
								class="btn btn-main text-center">�����߰�</button>
						</div>
					</form>
					<p class="mt-20 form-group">
						<a href="main">���ư���</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="footer.jsp"%>