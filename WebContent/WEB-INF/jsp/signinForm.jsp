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
          <h2 class="text-center">ȸ������</h2>
          <form class="text-left clearfix" id="join" action="memberjoin" method="post">
            <div class="form-group">
            	<span class ="ps_box">
            	<input type="text" class="form-control" name="mid" id="mid" maxlength="20" placeholder="���̵�">
            	</span>
             	<span class="error_box" id="idMsg" style="display:none" role="alert"></span>
            </div>
            <div class="form-group">
            	<span class ="ps_box">
            	<input type="password" class="form-control" name="mpwd" id="mpwd" maxlength="20" placeholder="�н�����">
            	</span>
            	<span class="error_box" id="pwdMsg" style="display:none" role="alert"></span>
            </div>
            <div class="form-group">
            	<span class ="ps_box">
            	<input type="text" class="form-control" name="mname" id="mname" maxlength="15" placeholder="�̸�">
            	</span>
            	<span class="error_box" id="nameMsg" style="display:none" role="alert"></span>
            </div>
            <div class="form-group">
            	<span class="ps_box">
            	<input type="text" class="form-control" name="mtel" id="mtel" maxlength="20" placeholder="��ȭ��ȣ">
            	</span>
            	<span class="error_box" id="telMsg" style="display:none" role="alert"></span>
            </div>
            <div class="form-group">
            	<span class="ps_box">
            	<input type="text" class="form-control" name="mpost" id="mpost" placeholder="�����ȣ">
            	</span>
            	<span class="error_box" id="postMsg" style="display:none" role="alert"></span>
            </div>
            <div class="form-group">
            	<span class="ps_box">
            	<input type="text" class="form-control" name="maddr1" id="maddr1" maxlength="150" placeholder="�ּ�">
            	</span>
            	<span class="error_box" id="addrMsg1" style="display:none" role="alert"></span>
            </div>
            	<div class="form-group">
            	<span class="ps_box">
              	<input type="text" class="form-control" name="maddr2" id="maddr2" maxlength="100" placeholder="���ּ�">
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
            	<button type="button" id="btnJoin" class="btn btn-main text-center">ȸ������</button>
            </div>
            
          </form>
          <p class="mt-20">�̹� ȸ���̽ö�� ?<a href="loginform"> �α���</a></p>
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
			 $("#join").submit();	// form ����
			 alert("ȸ�������� ���������� ó�� �Ǿ����ϴ�.");
		}else{
			submitOpen();
			return false;
		}
	}
	
	// input���� ���� ���� Ȯ��
	function checkInput(){
		if(checkID() & checkPwd() & checkName()	& checkTel() & checkAddr() & checkEmail()){
			return true;
		}else{
			return false;
		}
	}
	
	// ���̵� ��ȿ�� üũ  
	function checkID(){
		if(idFlag) return true;
		var id = $('#mid').val();
		var oMsg = $('#idMsg');
		var oInput = $('#mid');
				
		if(id == ""){
			showErrorMsg(oMsg,"�ʼ� �����Դϴ�.");
			setFocusToInputObject(oInput);
			return false;
		}
		var isId = /^[a-z0-9][a-z0-9_\-]{3,20}$/;
		if(!isId.test(id)){
			showErrorMsg(oMsg,"4~20���� ���� �ҹ���, ���ڿ� Ư����ȣ(_),(-)�� ��� �����մϴ�.");
			setFocusToInputObject(oInput);
			return false;
		}
		idFlag = false;
		$.ajax({
			url:"idcheck?mid="+ id,
			success : function(data){
				if(data == 0){
					showSuccessMsg(oMsg, "���� ���̵�׿�!");
					idFlag = true;
				}else{
					showErrorMsg(oMsg, "�̹� ������� ���̵� �Դϴ�.");
					setFocusToInputObject(oInput);
				}
			}
		});
		return true;
	}
	
	// ��й�ȣ ��ȿ�� üũ
	function checkPwd(){
		if(pwdFlag) return true;
		var pwd = $('#mpwd').val();
		var oMsg = $('#pwdMsg');
		var oInput = $('#mpwd');
		
		if(pwd == ""){
			showErrorMsg(oMsg,"�ʼ� �����Դϴ�.");
			setFocusToInputObject(oInput);
			return false;
		}
		var isPwd = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
		if(!isPwd.test(pwd)){
			showErrorMsg(oMsg, "8~20�� ���� �� �ҹ���, ����, Ư�����ڸ� ����ϼ���.");
			setFocusToInputObject(oInput);
			return false;
		} 
		pwdFlag = true;
		hideMsg(oMsg);
		return true;
	}
	
	// �̸� ��ȿ�� üũ
	function checkName(){
		var name = $('#mname').val();
		var oMsg = $('#nameMsg');
		var oInput = $('#mname');
		
		if(name == ""){
			showErrorMsg(oMsg,"�ʼ� �����Դϴ�.");
			setFocusToInputObject(oInput);
			return false;
		}
		var isName = /[^��-��A-Z-a-z0-9]/gi;
		if(name != "" && isName.test(name)){
			showErrorMsg(oMsg,"�ѱ۰� ���� �� �ҹ��ڸ� ����ϼ���. (Ư����ȣ, ���� ��� �Ұ�)");
			setFocusToInputObject(oInput);
			return false;
		}
		hideMsg(oMsg);
		return true;
	}
	
	// ��ȭ��ȣ ��ȿ�� üũ
	function checkTel(){
		var tel = $('#mtel').val();
		var oMsg = $('#telMsg');
		var oInput = $('#mtel');
		
		if(tel == ""){
			showErrorMsg(oMsg,"�ʼ� �����Դϴ�.");
			setFocusToInputObject(oInput);
			return false;
		}
		// ��ȭ��ȣ, �޴��� ����ǥ����
		var isTel =  /^0[0-9]{1,2}-?([0-9]{3,4})-?([0-9]{4})$/;
		if(!isTel.test(tel)){
			showErrorMsg(oMsg, "��ȭ��ȣ�� ����, - �� ������ ���ڸ� �Է��ϼ���");
			setFocusToInputObject(oInput);
			return false;
		}
		hideMsg(oMsg);
		return true;
	}
	

	// �����ȣ , �ּ�	
	$(function(){
		$('#mpost').click(function(){
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
	
	// �ּ� , ���ּ�
 	function checkAddr(){
		var addr2 = $("#maddr2").val();
		var oMsgAddr2 = $("#addrMsg2");
		var oInputAdrr2 = $("#maddr2");

		if(addr2 == ""){
			showErrorMsg(oMsgAddr2, "���ּҸ� �Է����ּ���.");
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
			showErrorMsg(oMsg,"�̸����� �Է����ּ���.");
			setFocusToInputObject(oInput);
			return false;
		}
		var isEmail = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
		if(!isEmail.test(email)){
			showErrorMsg(oMsg, "�̸��� �ּҸ� �ٽ� Ȯ�����ּ���.");
			setFocusToInputObject(oInput);
			return false;
		}
		hideMsg(oMsg);
		return true;
	}

	
	// ��Ŀ��
 	function defaultScript(){	
		$(".ps_box").click(function(){
			$(this).children("input").focus();
			$(this).addClass("focus");
		}).focusout(function(){
			var welInputText = $(".ps_box");		
			welInputText.removeClass("focus");
		});
	}
	
 	// ȸ������ ��ư ��밡�� ����
    function submitClose() {
        submitFlag = true;
        $("#btnJoin").attr("disabled",true);	
    }
 	// ȸ������ ��ư ��밡�� ����
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
    // �����޽��� ���
	function showErrorMsg(obj, msg){
		obj.attr("class", "error_box");
		obj.html(msg);
		obj.show().css("color","red");
	}
    // �ùٸ��� �Է½� ���
	function showSuccessMsg(obj, msg){
		obj.attr("class","error_box");
		obj.html(msg);
		obj.show().css("color","green");
	}
    // ����� ���ߴ±��
	function hideMsg(obj){
		obj.hide();
	}
</script>
<%@include file="footer.jsp"%>