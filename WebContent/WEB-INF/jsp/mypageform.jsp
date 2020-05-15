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
					<h1 class="page-name">내 정보 수정/탈퇴</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li><a href="mypageinfo">마이페이지</a></li>
						<li class="active">내 정보 수정/탈퇴</li>
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
          <h2 class="text-center">회원수정</h2>
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
              	<input type="button" id="postBtn" value="우편번호 찾기">
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
              <button type="submit" class="btn btn-main button-style text-center">수정</button> 
              <a href="memberDelete?mid=${list.mid }" id="btn2" class="btn btn-main button-style text-center" style="color: white;">회원탈퇴</a>
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
		if(confirm ("회원탈퇴 하시겠습니까?")){
			alert('삭제되었습니다.');
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
				if(data.userSelectedType === 'R'){
				//법정동명이 있을 경우 추가한다.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
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



<%@include file="footer.jsp"%>