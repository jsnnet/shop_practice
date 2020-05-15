<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<footer class="footer section text-center">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<ul class="footer-menu">
					<li><a href="">간홍철</a></li>
					<li><a href="">박건영</a></li>
					<li><a href="">박종철</a></li>
					<li><a href="">송용화</a></li>
					<li><a href="">이수진</a></li>
					<li><a href="">이윤철</a></li>
					<li><a href="">전유리</a></li>
				</ul>
				<p class="copyright-text">한국소프트웨어인재개발원</p>
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

<!-- 회원아이디 중복 확인 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	$(function() {
		$('#postBtn').click(function() {
			execDaumPostcode();
		});
		// 회원 아이디 중복확인
		$('#idChkBtn').click(function() {
			$.ajax({
				url : "idcheck?mid=" + $('#mid').val(),
				success : function(data) { //  정상200 , 콜백함수
					if (data == 0) {
						$('#target').show().css("color", "blue").text("사용가능");
					} else {
						$('#target').show().css("color", "red").text("사용중");
					}
				}
			});
		});
		/* 우편번호 조회  */
		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
								: '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('mpost').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('maddr1').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
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