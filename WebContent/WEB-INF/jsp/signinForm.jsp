<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<%@include file="header.jsp"%>

<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
          <a class="logo" href="main">
            <img src="images/logo.png" alt="">
          </a>
          <h2 class="text-center">회원가입</h2>
          <form class="text-left clearfix" id="join" action="memberjoin" method="post">
            <div class="form-group">
            	<span class ="ps_box">
            	<input type="text" class="form-control" name="mid" id="mid" maxlength="20" placeholder="아이디">
            	</span>
             	<span class="error_box" id="idMsg" style="display:none" role="alert"></span>
            </div>
            <div class="form-group">
            	<span class ="ps_box">
            	<input type="password" class="form-control" name="mpwd" id="mpwd" maxlength="20" placeholder="패스워드">
            	</span>
            	<span class="error_box" id="pwdMsg" style="display:none" role="alert"></span>
            </div>
            <div class="form-group">
            	<span class ="ps_box">
            	<input type="text" class="form-control" name="mname" id="mname" maxlength="15" placeholder="이름">
            	</span>
            	<span class="error_box" id="nameMsg" style="display:none" role="alert"></span>
            </div>
            <div class="form-group">
            	<span class="ps_box">
            	<input type="text" class="form-control" name="mtel" id="mtel" maxlength="20" placeholder="전화번호">
            	</span>
            	<span class="error_box" id="telMsg" style="display:none" role="alert"></span>
            </div>
            <div class="form-group">
            	<span class="ps_box">
            	<input type="text" class="form-control" name="mpost" id="mpost" placeholder="우편번호">
            	</span>
            	<span class="error_box" id="postMsg" style="display:none" role="alert"></span>
            </div>
            <div class="form-group">
            	<span class="ps_box">
            	<input type="text" class="form-control" name="maddr1" id="maddr1" maxlength="150" placeholder="주소">
            	</span>
            	<span class="error_box" id="addrMsg1" style="display:none" role="alert"></span>
            </div>
            	<div class="form-group">
            	<span class="ps_box">
              	<input type="text" class="form-control" name="maddr2" id="maddr2" maxlength="100" placeholder="상세주소">
              	</span>
              	<span class="error_box" id="addrMsg2" style="display:none" role="alert"></span>
            </div>
            <div class="form-group">
            	<span class="ps_box">
            	<input type="text" class="form-control" name="memail" id="memail" maxlength="30" placeholder="Email">
            	</span>
            	<span class="error_box" id="emailMsg" style="display:none" role="alert"></span>
            </div>

            <div class="text-center">
            	<button type="button" id="btnJoin" class="btn btn-main text-center">회원가입</button>
            </div>
            
          </form>
          <p class="mt-20">이미 회원이시라면 ?<a href="loginform"> 로그인</a></p>
        </div>
      </div>
    </div>
  </div>
</section>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	var idFlag = false;
	var pwdFlag = false;
	var submitFlag = false;
	
	$(function(){
		defaultScript();
		
		$('#mid').blur(function(){
			idFlag = false;
			checkID();
		});
		$('#mpwd').blur(function(){
			pwdFlag = false;
			checkPwd();
		});
		$('#mname').blur(function(){
			checkName();
		});
		$('#mtel').blur(function(){
			checkTel();
		});
		$('#mpost').blur(function(){
			checkPost();
		});
		$('#maddr2').blur(function(){
			checkAddr();
		});
		$('#memail').blur(function(){
			checkEmail();
		})

		$('#btnJoin').click(function(){
			submitClose();
			if(idFlag && pwdFlag){
				mainSubmit();
			}else{
				setTimeout(function(){
					mainSubmit();
				},300);
			}
		});
	});
	
	function mainSubmit(){
		if(!checkInput()){
			submitOpen();
			return false;
		}
		if(idFlag && pwdFlag){
			 $("#join").submit();	// form 전송
			 alert("회원가입이 정상적으로 처리 되었습니다.");
		}else{
			submitOpen();
			return false;
		}
	}
	
	// input으로 들어온 값들 확인
	function checkInput(){
		if(checkID() & checkPwd() & checkName()	& checkTel() & checkAddr() & checkEmail()){
			return true;
		}else{
			return false;
		}
	}
	
	// 아이디 유효성 체크  
	function checkID(){
		if(idFlag) return true;
		var id = $('#mid').val();
		var oMsg = $('#idMsg');
		var oInput = $('#mid');
				
		if(id == ""){
			showErrorMsg(oMsg,"필수 정보입니다.");
			setFocusToInputObject(oInput);
			return false;
		}
		var isId = /^[a-z0-9][a-z0-9_\-]{3,20}$/;
		if(!isId.test(id)){
			showErrorMsg(oMsg,"4~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
			setFocusToInputObject(oInput);
			return false;
		}
		idFlag = false;
		$.ajax({
			url:"idcheck?mid="+ id,
			success : function(data){
				if(data == 0){
					showSuccessMsg(oMsg, "멋진 아이디네요!");
					idFlag = true;
				}else{
					showErrorMsg(oMsg, "이미 사용중인 아이디 입니다.");
					setFocusToInputObject(oInput);
				}
			}
		});
		return true;
	}
	
	// 비밀번호 유효성 체크
	function checkPwd(){
		if(pwdFlag) return true;
		var pwd = $('#mpwd').val();
		var oMsg = $('#pwdMsg');
		var oInput = $('#mpwd');
		
		if(pwd == ""){
			showErrorMsg(oMsg,"필수 정보입니다.");
			setFocusToInputObject(oInput);
			return false;
		}
		var isPwd = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
		if(!isPwd.test(pwd)){
			showErrorMsg(oMsg, "8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			setFocusToInputObject(oInput);
			return false;
		} 
		pwdFlag = true;
		hideMsg(oMsg);
		return true;
	}
	
	// 이름 유효성 체크
	function checkName(){
		var name = $('#mname').val();
		var oMsg = $('#nameMsg');
		var oInput = $('#mname');
		
		if(name == ""){
			showErrorMsg(oMsg,"필수 정보입니다.");
			setFocusToInputObject(oInput);
			return false;
		}
		var isName = /[^가-힝A-Z-a-z0-9]/gi;
		if(name != "" && isName.test(name)){
			showErrorMsg(oMsg,"한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
			setFocusToInputObject(oInput);
			return false;
		}
		hideMsg(oMsg);
		return true;
	}
	
	// 전화번호 유효성 체크
	function checkTel(){
		var tel = $('#mtel').val();
		var oMsg = $('#telMsg');
		var oInput = $('#mtel');
		
		if(tel == ""){
			showErrorMsg(oMsg,"필수 정보입니다.");
			setFocusToInputObject(oInput);
			return false;
		}
		// 전화번호, 휴대폰 정규표현식
		var isTel =  /^0[0-9]{1,2}-?([0-9]{3,4})-?([0-9]{4})$/;
		if(!isTel.test(tel)){
			showErrorMsg(oMsg, "전화번호를 숫자, - 를 포함한 숫자만 입력하세요");
			setFocusToInputObject(oInput);
			return false;
		}
		hideMsg(oMsg);
		return true;
	}
	

	// 우편번호 , 주소	
	$(function(){
		$('#mpost').click(function(){
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
	
	// 주소 , 상세주소
 	function checkAddr(){
		var addr2 = $("#maddr2").val();
		var oMsgAddr2 = $("#addrMsg2");
		var oInputAdrr2 = $("#maddr2");

		if(addr2 == ""){
			showErrorMsg(oMsgAddr2, "상세주소를 입력해주세요.");
			setFocusToInputObject(oInputAdrr2);
			return false;
		}
		hideMsg(oMsgAddr2);
		return true;
	}
	
	// email
	function checkEmail(){
		var email = $("#memail").val();
		var oMsg = $("#emailMsg");
		var oInput = $("#memail");
		
		if(email == ""){
			showErrorMsg(oMsg,"이메일을 입력해주세요.");
			setFocusToInputObject(oInput);
			return false;
		}
		var isEmail = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
		if(!isEmail.test(email)){
			showErrorMsg(oMsg, "이메일 주소를 다시 확인해주세요.");
			setFocusToInputObject(oInput);
			return false;
		}
		hideMsg(oMsg);
		return true;
	}

	
	// 포커스
 	function defaultScript(){	
		$(".ps_box").click(function(){
			$(this).children("input").focus();
			$(this).addClass("focus");
		}).focusout(function(){
			var welInputText = $(".ps_box");		
			welInputText.removeClass("focus");
		});
	}
	
 	// 회원가입 버튼 사용가능 설정
    function submitClose() {
        submitFlag = true;
        $("#btnJoin").attr("disabled",true);	
    }
 	// 회원가입 버튼 사용가능 해제
    function submitOpen() {
        $("#btnJoin").attr("disabled",false);	
    }
	
 	// 
    function setFocusToInputObject(obj) {		
        if(submitFlag) {
            submitFlag = false;
            obj.focus();
        }
    }
    // 에러메시지 출력
	function showErrorMsg(obj, msg){
		obj.attr("class", "error_box");
		obj.html(msg);
		obj.show().css("color","red");
	}
    // 올바르게 입력시 출력
	function showSuccessMsg(obj, msg){
		obj.attr("class","error_box");
		obj.html(msg);
		obj.show().css("color","green");
	}
    // 출력을 감추는기능
	function hideMsg(obj){
		obj.hide();
	}
</script>
<%@include file="footer.jsp"%>