<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp"%>

<section class="signin-page account">
	<div class="container">
		<div class="row">
			<div class="col-md-9 col-md-offset-2">
				<div class="block text-center">

					<h2 class="text-center">상품 후기 수정</h2>

					<form class="text-left clearfix" id="up" onsubmit="return updateCheck();" action="updatereview?rnum=${vo.rnum }&gnum=${vo.gnum}" method="post">
						<table>
							<tr>
								<td><a>제목</a> <br> <input type="text" name="rtitle"
									value="${vo.rtitle }">&nbsp;&nbsp;&nbsp;</td>
								<td><a>작성자</a><br> <input type="text" name="mid"
									value="${sessionScope.map.mid }" readonly="readonly">&nbsp;&nbsp;&nbsp;</td>
								<td><a>별점</a><br> 
								<div class="star-box" id="star-box">
									<a class="star star_left" href="#1"></a> 
									<a class="star star_right" href="#2"></a> 
									<a class="star star_left" href="#3"></a> 
									<a class="star star_right" href="#4"></a> 
									<a class="star star_left" href="#5"></a> 
									<a class="star star_right" href="#6"></a> 
									<a class="star star_left" href="#7"></a> 
									<a class="star star_right" href="#8"></a> 
									<a class="star star_left" href="#9"></a> 
									<a class="star star_right" href="#0"></a>
									<input type="hidden" value="" name="rgrade" id="rg">
								</div>
								<script>
									var rgrade = "<c:out value="${vo.rgrade}"/>";
									var rnum = "<c:out value="${vo.rnum}"/>";
									var j = 0;
									for (var i = 0.5; i <= rgrade; i += 0.5) {
										$('#star-box'+rnum+' span').eq(j).addClass("on");
										j++;
									}
														
									$("#star-box a").on('click', function() {
										var idx = $(this).index();
																
										$(".star").removeClass("on");
																
										for (var i = 0; i <= idx; i++) {
											$(".star").eq(i).addClass("on");
										}
																
										if ($(this).attr("href") === "#1") {
											rgrade = 0.5 * 1;
										} else if ($(this).attr("href") === "#2") {
											rgrade = 1 * 1;
										} else if ($(this).attr("href") === "#3") {
											rgrade = 1.5 * 1;
										} else if ($(this).attr("href") === "#4") {
											rgrade = 2 * 1;
										} else if ($(this).attr("href") === "#5") {
											rgrade = 2.5 * 1;
										} else if ($(this).attr("href") === "#6") {
											rgrade = 3 * 1;
										} else if ($(this).attr("href") === "#7") {
											rgrade = 3.5 * 1;
										} else if ($(this).attr("href") === "#8") {
											rgrade = 4 * 1;
										} else if ($(this).attr("href") === "#9") {
											rgrade = 4.5 * 1;
										} else if ($(this).attr("href") === "#0") {
											rgrade = 5 * 1;
										} else {
										}
										$("#rg").attr("value", rgrade)
									});
								</script>
							</tr>
							<tr>
								<td><a>내용</a></td>
							</tr>
						</table>
						<textarea rows="4" cols="100" name="rcontent" >${vo.rcontent }</textarea>
						<button type="submit" class="btn btn-main text-right" name="update">수정</button>
					</form>

				</div>
			</div>
		</div>
	</div>
</section>
<script>
function updateCheck(){
	if(up.mid.value == ""){
		up.mid.focus();
		alert("비회원은 리뷰 작성이 불가합니다!");
		return false;
	}else if(up.rtitle.value == ""){
		up.rtitle.focus();
		alert("제목을 입력해주세요!");
		return false;
	}else if(up.rgrade.value == ""){
		up.rgrade.focus();
		alert("점수를 매겨주세요!");
		return false;
	}else if(up.rcontent.value == ""){
		up.rcontent.focus();
		alert("내용을 입력해주세요!");
		return false;
	}else{
		return true;
	}
}
</script>
<%@include file="footer.jsp"%>