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
<section class="signin-page account">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="block text-center">

					<h2 class="text-center">ȸ�� ���� ����</h2>

					<form class="text-left clearfix" action="updatemember" method="post">
						<input type="hidden" value="${vo.mnum}" name="mnum">
						<div class="form-group">
							<input type="text" class="form-control" name="mid" id="mid"
								value="${vo.mid }">
							<div class="text-right">
								&nbsp;<input type="button" id="idChkBtn" value="�ߺ�Ȯ��">
							</div>
							<p id="target"></p>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="mpwd" id="mpwd"
								value="${vo.mpwd }">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="mname" id="mname"
								value="${vo.mname }">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="mtel" id="mtel"
								value="${vo.mtel }">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="mpost" id="mpost"
								value="${vo.mpost }">
							<div class="text-right">
								<input type="button" id="postBtn" value="�����ȣ ã��">
							</div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="maddr1" id="maddr1"
								value="${vo.maddr1 }">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="maddr2" id="maddr2"
								value="${vo.maddr2 }">
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="memail"
								id="memail" value="${vo.memail }">
						</div>
						<div class="form-group">
							<select id="select" name="madmin" style="font-size: 15px; height: 45px">
								<option value="1">ȸ��</option>
								<option value="0">������</option>
							</select>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-main text-center">����</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</section>

<script>
 	$(function(){
 		$("#select > option[value='${vo.madmin}']").attr("selected","selected");
 	})
</script>
<%@include file="footer.jsp"%>