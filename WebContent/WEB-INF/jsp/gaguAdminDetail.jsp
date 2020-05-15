<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>
<section class="single-product">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<ol class="breadcrumb">
					<li><a href="main">HOME</a></li>
					<li><a href="gaguAdminForm">상품리스트</a></li>
					<li class="active">상품상세페이지</li>
				</ol>
			</div>
			<div class="col-md-6">
				<ol class="product-pagination text-right">
					<li><a href="AdminpreviewNext?gnum=${vo.gnum}&pnType=0"><i
							class="tf-ion-ios-arrow-left"></i> Preview </a></li>
					<li><a href="AdminpreviewNext?gnum=${vo.gnum}&pnType=1">Next
							<i class="tf-ion-ios-arrow-right"></i>
					</a></li>
				</ol>
			</div>
		</div>
		<div class="row mt-20">
			<div class="col-md-5">
				<div class="single-product-slider">
					<div id='carousel-custom' class='carousel slide'
						data-ride='carousel'>
						<div class='carousel-outer'>
							<!-- me art lab slider -->
							<div class='carousel-inner '>
								<div class='item active'>
									<img src='resources/images/shop/products/${vo.gpicture}' alt=''
										data-zoom-image="resources/images/shop/products/${vo.gpicture}" />
								</div>
							</div>

						</div>

						<!-- thumb -->
						<ol class='carousel-indicators mCustomScrollbar meartlab'>
							<li data-target='#carousel-custom' data-slide-to='0'
								class='active'><img
								src='resources/images/shop/products/${vo.gpicture}' alt='' /></li>
						</ol>
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<div class="single-product-details">
					<h2>${vo.gname}</h2>
					<p class="product-price">${vo.gprice}</p>

					<p class="product-description mt-20">${vo.ginfo}</p>
					
					<div class="product-category">
						<span>제조사: </span> ${vo.gcompany}
					</div>
					<br>
					<div class="color-swatches">
						<span>색상: </span>
						<ul>
							<li>${vo.gcolor}</li>
						</ul>
					</div>
					<div class="product-size">
						<span>사이즈: </span> ${vo.gsize}
					</div>
					<div class="product-quantity">
						<span>재고수량: </span>
						<div class="product-quantity-slider">${vo.gstock}</div>
					</div>
					<div class="product-category">
						<span>종류: </span> ${vo.giname}
					</div>
					<div class="product-category">
						<span>평점: </span>
						<a class="star-box" id="star-box${vo.gnum}">
							<span class="star_print star_left"></span> 
							<span class="star_print star_right"></span> 
							<span class="star_print star_left"></span> 
							<span class="star_print star_right"></span> 
							<span class="star_print star_left"></span> 
							<span class="star_print star_right"></span> 
							<span class="star_print star_left"></span> 
							<span class="star_print star_right"></span> 
							<span class="star_print star_left"></span> 
							<span class="star_print star_right"></span>
							<b>${vo.rgrade} 점</b>
							<script>
								var rgrade = "<c:out value="${vo.rgrade}"/>";
								var gnum = "<c:out value="${vo.gnum}"/>";
								var j = 0;
								for (var i = 0.5; i <= rgrade; i += 0.5) {
									$('#star-box'+gnum+' span').eq(j).addClass("on");
									j++;
								}
							</script>
					</a>
					</div>
					<a href="gaguUpdateForm?gnum=${vo.gnum}" class="btn btn-main mt-20">수정</a>
					&nbsp; <a href="#" id="deletebtn" class="btn btn-main mt-20">삭제</a>
					&nbsp; <a href="gaguAdminForm" id="listbtn"
						class="btn btn-main mt-20">리스트</a>
				</div>
			</div>
		</div>
		
		
		<div class="row">
			<div class="col-xs-12">
				<div class="tabCommon mt-20">
					<ul class="nav nav-tabs">
						<li class="tabtab "><a id="detail-tab" data-toggle="tab" href="#detail-tab"
							aria-expanded="true">Details</a></li>
							
						<li class="tabtab "><a id="review-tab" data-toggle="tab" href="#review-tab"
							aria-expanded="false">Reviews(${rcount})</a></li>
					</ul>
					<div class="tab-content patternbg">
						<div id="details" class="text-center tab-pane fade">
							<img style="width:90%" alt="" src="resources/images/detail/${vo.gdetail }">
						</div>
						<div id="reviews" class="tab-pane fade active in">
							<div class="post-comments">
								<ul class="media-list comments-list m-bot-50 clearlist">
									<li>
										<form method="post" id="add" onsubmit="return reviewCheck()" action="addreview?gnum=${vo.gnum }"
											enctype="multipart/form-data">
											<table>
												<tr>
													<td><a>제목</a> <br> <input type="text"
														name="rtitle" placeholder="제목 입력">&nbsp;&nbsp;&nbsp;</td>
													<td><a>작성자</a><br> <input type="text" name="mid"
														value="${sessionScope.map.mid }" readonly="readonly">&nbsp;&nbsp;&nbsp;</td>
													<c:choose>
														<c:when test="${sessionScope.map.madmin == '0' }">
															<input type="hidden" value="admin" name="rpwd">&nbsp;&nbsp;&nbsp;
															</c:when>
														<c:otherwise>
															<td><a>비밀번호</a> <br> <input type="password"
																name="rpwd" placeholder="비밀번호 입력">&nbsp;&nbsp;&nbsp;</td>
														</c:otherwise>
													</c:choose>

													<td><a>별점</a> <br> 
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
													</td>
												</tr>
												<tr>
													<td><a>내용</a></td>
												</tr>
											</table>
											<textarea rows="4" cols="140" name="rcontent"
												placeholder="내용 입력"></textarea>
											<button type="submit" class="btn btn-main">등록</button>
										</form>
									</li>
									<hr>
									<c:if test="${rcount == 0}">
										<a class="product-description mt-20"> 아직 작성된 리뷰가 없습니다.</a>
									</c:if>
									<c:forEach var="ee" items="${rlist }">
										
										<!-- Comment Item start-->
										<li class="media">

											<div class="media-body">
												<div class="comment-info">
													<a class="star-box" id="star-box${ee.rnum}">
															<span class="star_print star_left"></span> 
															<span class="star_print star_right"></span> 
															<span class="star_print star_left"></span> 
															<span class="star_print star_right"></span> 
															<span class="star_print star_left"></span> 
															<span class="star_print star_right"></span> 
															<span class="star_print star_left"></span> 
															<span class="star_print star_right"></span> 
															<span class="star_print star_left"></span> 
															<span class="star_print star_right"></span>
															<b>${ee.rgrade }</b>점
														</a>
													<input type="hidden" value="${ee.rnum }">
													<!-- 제목 -->
													<h4 class="comment-author">${ee.rtitle } </h4>
													<!-- 작성자 아이디 -->
													<h4 class="comment-author">
														<c:choose>
															<c:when test="${ee.mid == null}">
																<a>(탈퇴한 회원)</a>
															</c:when>
															<c:otherwise>
																<a>${ee.mid }</a>
															</c:otherwise>
														</c:choose>
														
													</h4>
													<script>
															var rgrade = "<c:out value="${ee.rgrade}"/>";
															var rnum = "<c:out value="${ee.rnum}"/>";
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
												
													<!-- 날짜/시간 -->
													<a>${ee.rdate}</a>

													<!-- 수정, 삭제 버튼 -->

													<button type="button" id="rupdbtn" class="comment-button"
														onclick="return location='updatereviewform?rnum=${ee.rnum}'">수정</button>
													<button type="button" id="rdelbtn" class="comment-button"
														onclick="return location='deletereview?rnum=${ee.rnum}&gnum=${vo.gnum}'">삭제</button>

												</div>


												<p>${ee.rcontent }</p>
											</div>

										</li>
										<!-- End Comment Item -->

									</c:forEach>

								</ul>
								<div>
								<c:if test="${pageInfo.totalRows != 0 }">
									<%@include file="reviewAdmin_page.jsp"%>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$.fn.priceBuilder = function(price) {
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		$(".product-price").each(function(idx) {
			// 해당 체크박스의 Value 가져오기
			var value = $(this).text();
			$(this).text($.fn.priceBuilder(value) + ' 원');
		});

		var gnum = "<c:out value="${vo.gnum}"/>";
		$("#deletebtn").click(function() {
			if (confirm("정말로 삭제하시겠습니까 ?")) {
				alert('삭제되었습니다.');
				location.href = 'gaguDelete?gnum=' + gnum;
			}
		});

	});
	function updateCk(rnum, rpwd) {
		var password = prompt("비밀번호를 입력하세요.", "");
		if (password == rpwd) {
			location.href = 'updatereviewform?rnum=' + rnum;
		} else {
			alert("비밀번호 인증 실패");
		}
	}

	function deleteCk(rnum, rpwd) {
		var password = prompt("비밀번호를 입력하세요.", "");
		if (password == rpwd) {
			location.href = 'deletereview?rnum=' + rnum + '&gnum=' + $
			{
				vo.gnum
			}
			;
		} else {
			alert("비밀번호 인증 실패");
		}
	}

	function reviewCheck(){
		if(add.mid.value == ""){
			add.mid.focus();
			alert("비회원은 리뷰 작성이 불가합니다!");
			return false;
		}else if(add.rpwd.value == ""){
			add.rpwd.focus();
			alert("비밀번호를 입력해주세요!");
			return false;
		}else if(add.rtitle.value == ""){
			add.rtitle.focus();
			alert("제목을 입력해주세요!");
			return false;
		}else if(add.rgrade.value == ""){
			add.rgrade.focus();
			alert("점수를 매겨주세요!");
			return false;
		}else if(add.rcontent.value == ""){
			add.rcontent.focus();
			alert("내용을 입력해주세요!");
			return false;
		}else{
			return true;
		}
	}
	/* 	function nonMemCk(){
	 alert("로그인 후 이용하세요.");
	 location='loginform';
	 } */
</script>
<%@include file="footer.jsp"%>