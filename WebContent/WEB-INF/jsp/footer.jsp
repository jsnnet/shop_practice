<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<footer class="footer section text-center">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<ul class="footer-menu">
					<li><a href="">��ȫö</a></li>
					<li><a href="">�ڰǿ�</a></li>
					<li><a href="">����ö</a></li>
					<li><a href="">�ۿ�ȭ</a></li>
					<li><a href="">�̼���</a></li>
					<li><a href="">����ö</a></li>
					<li><a href="">������</a></li>
				</ul>
				<p class="copyright-text">�ѱ�����Ʈ�������簳�߿�</p>
			</div>
		</div>
	</div>
</footer>

<script>
$(function(){
	$("#detail-tab").on('click', function() {
		$(".tabtab").eq(1).removeClass("active");
		$(".tabtab").eq(1).attr("aria-expanded", "false");
		$(".tabtab").eq(0).addClass("active");
		$(".tabtab").eq(0).attr("aria-expanded", "true");
		
		$("#details").addClass("active in");
		$("#reviews").removeClass("active in");
	});
	$("#review-tab").on('click', function() {
		$(".tabtab").eq(0).removeClass("active");
		$(".tabtab").eq(0).attr("aria-expanded", "false");
		$(".tabtab").eq(1).addClass("active");
		$(".tabtab").eq(1).attr("aria-expanded", "true");
		
		$("#reviews").addClass("active in");
		$("#details").removeClass("active in");
	});
});
</script>
<!-- 
    Essential Scripts
    =====================================-->

<!-- Main jQuery -->
<script src="<c:url value="https://code.jquery.com/jquery-git.min.js"/>"></script>

<!-- Bootstrap 3.1 -->
<script
	src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>

<%-- <!-- Bootstrap Touchpin -->
<script
	src="${pageContext.request.contextPath}/resources/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>

<!-- Instagram Feed Js -->
<script src="${pageContext.request.contextPath}/resources/plugins/instafeed-js/instafeed.min.js"></script> --%>

<%-- <!-- Video Lightbox Plugin -->
<script
	src="<c:url value="${pageContext.request.contextPath}/resources/plugins/ekko-lightbox/dist/ekko-lightbox.min.js"/>"></script>
<!-- Count Down Js -->
<script
	src="<c:url value="${pageContext.request.contextPath}/resources/plugins/count-down/jquery.countdown.min.js"/>"></script> --%>

<!-- Custom js -->
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/js/jquery-1.11.3.min.js"></script>

<!-- ȸ�����̵� �ߺ� Ȯ�� -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	$(function() {
		$('#postBtn').click(function() {
			execDaumPostcode();
		});
		// ȸ�� ���̵� �ߺ�Ȯ��
		$('#idChkBtn').click(function() {
			$.ajax({
				url : "idcheck?mid=" + $('#mid').val(),
				success : function(data) { //  ����200 , �ݹ��Լ�
					if (data == 0) {
						$('#target').show().css("color", "blue").text("��밡��");
					} else {
						$('#target').show().css("color", "red").text("�����");
					}
				}
			});
		});
		/* �����ȣ ��ȸ  */
		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
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
					if (data.userSelectedType === 'R') {
						//���������� ���� ��� �߰��Ѵ�.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// �ǹ����� ���� ��� �߰��Ѵ�.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
								: '');
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
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/daygrid.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/timegrid.js"></script>


</body>
</html>