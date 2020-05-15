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
					<h1 class="page-name">�� ���� ����/Ż��</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li><a href="mypageinfo">����������</a></li>
						<li class="active">�� ���� ����/Ż��</li>
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
          <a class="logo" href="main">
            <img src="images/logo.png" alt="">
          </a>
          <h2 class="text-center">ȸ������</h2>
          <form class="text-left clearfix" action="upmember" method="post">
          <div class="form-group">
              <input type="hidden" class="form-control" name="mnum" id="mnum" value="${list.mnum}">
            </div>
            <div class="form-group">
             <input type="text" class="form-control" name="mid" id="mid" value="${list.mid}" readonly="readonly">	
             <div class="text-right">
             </div>
            </div>
            <div class="form-group">
              <input type="password" class="form-control" name="mpwd" id="mpwd" value="${list.mpwd}">
            </div>
            <div class="form-group">
              <input type="text" class="form-control" name="mname" id="mname" value="${list.mname}">
            </div>
            <div class="form-group">
              <input type="text" class="form-control" name="mtel" id="mtel" value="${list.mtel}">
            </div>
            <div class="form-group">
              <input type="text" class="form-control" name="mpost" id="mpost" value="${list.mpost}">
              <div class="text-right">
              	<input type="button" id="postBtn" value="�����ȣ ã��">
              </div>
            </div>
            <div class="form-group">
              <input type="text" class="form-control" name="maddr1" id="maddr1" value="${list.maddr1}">
            </div>
            <div class="form-group">
              <input type="text" class="form-control" name="maddr2" id="maddr2" value="${list.maddr2}">
            </div>
            <div class="form-group">
              <input type="email" class="form-control" name="memail" id="memail" value="${list.memail}">
            </div>
			<div class="form-group">
				
			</div>
            <div class="text-center">
              <button type="submit" class="btn btn-main button-style text-center">����</button> 
              <a href="memberDelete?mid=${list.mid }" id="btn2" class="btn btn-main button-style text-center" style="color: white;">ȸ��Ż��</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(function() {
	$('#btn2').click(function(){
		if(confirm ("ȸ��Ż�� �Ͻðڽ��ϱ�?")){
			alert('�����Ǿ����ϴ�.');
			location = 'logout';
		}
	});
	
});
</script>

<script>
	$(function(){
		$('#postBtn').click(function(){
			execDaumPostcode();
		});
		function execDaumPostcode() {
				new daum.Postcode({
				oncomplete: function(data) {
				// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
	
				// �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
				// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
				var fullAddr = ''; // ���� �ּ� ����
				var extraAddr = ''; // ������ �ּ� ����
	
				// ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
				if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
					fullAddr = data.roadAddress;
	
				} else { // ����ڰ� ���� �ּҸ� �������� ���(J)
					fullAddr = data.jibunAddress;
				}
	
				// ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
				if(data.userSelectedType === 'R'){
				//���������� ���� ��� �߰��Ѵ�.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// �ǹ����� ���� ��� �߰��Ѵ�.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				}
	
				// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
				document.getElementById('mpost').value = data.zonecode; //5�ڸ� �������ȣ ���
				document.getElementById('maddr1').value = fullAddr;
	
				// Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
				document.getElementById('maddr2').focus();
				}
			}).open();
		}
	});
</script>



<%@include file="footer.jsp"%>