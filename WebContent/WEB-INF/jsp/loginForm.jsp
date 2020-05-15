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
          <h2 class="text-center">로그인</h2>
          <form class="text-left clearfix" action="success" method="post" id="loginform">
            <div class="form-group">

              <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디">
              <span class="error_box" id="midMsg" style="display:none" role="alert"></span>

            </div>
            <div class="form-group">

              <input type="password" class="form-control" name="mpwd" id="mpwd" placeholder="패스워드">
              <span class="error_box" id="mpwdMsg" style="display:none" role="alert"></span>

            </div>
            <span id="result"></span>

            <div class="text-center">
              <button type="button" id="Login" class="btn btn-main text-center" >로그인</button>
            </div>
          </form>
          <p class="mt-20">처음오셨나요 ?<a href="signinform"> 회원가입</a></p>
        </div>
      </div>
    </div>
  </div>
</section>
<script>
$(function(){
	
	$('#mid').blur(function(){
		checkID();
		hideMsg($("#result"));
	});
	$('#mpwd').blur(function(){
		checkPwd();
		hideMsg($("#result"));
	});
	
	$("#Login").click(function(){
		var mid = $("#mid").val();
		var mpwd = $("#mpwd").val();
		var result = $("#result");
		
		// var data = "mid=" + mid +"&mpwd=" + mpwd;
		var data = {"mid" : mid, "mpwd" : mpwd};
		$.ajax({
			type : "POST",
			data : data,
			url : "loginProcess",
			success : function(data){
				if(data == 0){
					if(checkID() & checkPwd()){
						showErrorMsg(result, "아이디 또는 비밀번호가 일치하지 않습니다.");
						$('#mid').focus();
					}
				} else {
					$('#loginform').submit();
				}
			}
		});
	});
});

function checkID(){
	if($("#mid").val() == ""){
		showErrorMsg($("#midMsg"),"아이디를 입력해주세요!");
		return false;
	}
	hideMsg($('#midMsg'));
	return true;
}

function checkPwd(){
	if($("#mpwd").val() == ""){
		showErrorMsg($("#mpwdMsg"),"비밀번호를 입력해주세요!");
		return false;
	}
	hideMsg($('#mpwdMsg'));	
	return true;
}

function showErrorMsg(obj, msg){
	obj.attr("class", "error_box");
	obj.html(msg);
	obj.show().css("color","red");
}
function hideMsg(obj){
	obj.hide();
}
</script>
<%@include file="footer.jsp"%>