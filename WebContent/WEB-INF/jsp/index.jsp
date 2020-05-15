<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<%@include file="header.jsp"%>

<c:choose>
	<c:when test="${sessionScope.map.madmin == 0 }">
		<!-- 관리자 메인화면 -->

		<div class="container">
			<div class="col-md-6">
				<h3 class="title text-left">전체 조회수</h3>
				<input type="hidden" id="count1" value="${cvo.count1 }"> <input
					type="hidden" id="count2" value="${cvo.count2 }"> <input
					type="hidden" id="count3" value="${cvo.count3 }"> <input
					type="hidden" id="count4" value="${cvo.count4 }"> <input
					type="hidden" id="count5" value="${cvo.count5 }"> <input
					type="hidden" id="count6" value="${cvo.count6 }"> <input
					type="hidden" id="count7" value="${cvo.count7 }"> <input
					type="hidden" id="count9" value="${cvo.count9 }"> <input
					type="hidden" id="count10" value="${cvo.count10 }"> <input
					type="hidden" id="count11" value="${cvo.count11 }">
				<canvas id="myChart" width="400" height="400">
				</canvas>
			</div>
			
			<div class="col-md-6">
				<h3 class="title">가구 종류 별 별점 평균</h3>
				<input type="hidden" id="sumcount1" value="${svo.count21 }">
				<input type="hidden" id="sumcount2" value="${svo.count22 }">
				<input type="hidden" id="sumcount3" value="${svo.count23 }">
				<input type="hidden" id="sumcount4" value="${svo.count24 }">
				<input type="hidden" id="sumcount5" value="${svo.count25 }">
				<input type="hidden" id="sumcount6" value="${svo.count26 }">
				<input type="hidden" id="sumcount7" value="${svo.count27 }">
				<input type="hidden" id="sumcount9" value="${svo.count29 }">
				<input type="hidden" id="sumcount10" value="${svo.count210 }">
				<input type="hidden" id="sumcount11" value="${svo.count211 }">
				<canvas id="myChart2" width="400" height="400">
				</canvas>
			</div>
			
			
			
			<div class="col-md-6">
			<br>
			<hr>
			<h3 class="title">주간 매출</h3>
				<input type="hidden" id="weekmoney1" value="${mvo.count31 }">
				<input type="hidden" id="weekmoney2" value="${mvo.count32 }">
				<input type="hidden" id="weekmoney3" value="${mvo.count33 }">
				<input type="hidden" id="weekmoney4" value="${mvo.count34 }">
				<input type="hidden" id="weekmoney5" value="${mvo.count35 }">
				<input type="hidden" id="weekmoney6" value="${mvo.count36 }">
				<input type="hidden" id="weekmoney7" value="${mvo.count37 }">
				<input type="hidden" id="today" value="${dvo.today }"> <input
					type="hidden" id="today1" value="${dvo.today1 }"> <input
					type="hidden" id="today2" value="${dvo.today2 }"> <input
					type="hidden" id="today3" value="${dvo.today3 }"> <input
					type="hidden" id="today4" value="${dvo.today4 }"> <input
					type="hidden" id="today5" value="${dvo.today5 }"> <input
					type="hidden" id="today6" value="${dvo.today6 }">
				<canvas id="myChart3" width="400" height="400">
				</canvas>
			</div>
			<div class="col-md-6">
				<br>
				<hr>
				<h3 class="title" style="text-align:left;">사용자 접속 순위</h3>
				<c:forEach var="e" items="${rvo}" varStatus="num">
					<input type="hidden" id="chartRankingName${num.count}" value="${e.mname}">
					<input type="hidden" id="chartRanking${num.count}" value="${e.cnt}">
				</c:forEach>
				<canvas id="myChart4" width="400" height="400">
				</canvas>
			</div>

		</div>

	</c:when>

	<c:otherwise>
		<!-- 사용자 메인화면 -->
		<!-- Swiper Slider -->
		<div class="swiper-container">
			<div class="swiper-wrapper">

				<c:forEach var="slide" items="${list }" end="10">
					<div class="swiper-slide">
						<a href="gaguShopDetail?gnum=${slide.gnum }&page=1"> <img
							src="${pageContext.request.contextPath}/resources/images/shop/products/${slide.gpicture}"></a>
					</div>
				</c:forEach>

			</div>
		</div>

		<!-- 카테고리 섹션 -->
		<section class="product-category section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="title text-center">
							<h2>제품 카테고리</h2>
						</div>
					</div>
					<div class="col-md-6">
						<div class="category-box">
							<a href="gaguShop?ginum=2"> <img
								src="${pageContext.request.contextPath}/resources/images/shop/category/category-diningtable6.jpg"
								alt="" />
								<div class="content">
									<h3 style="font-weight: bolder">식탁</h3>
									<p style="font-weight: bold">제품 보러가기</p>
								</div>
							</a>
						</div>
						<div class="category-box">
							<a href="gaguShop?ginum=5"> <img
								src="${pageContext.request.contextPath}/resources/images/shop/category/category-sofa1.jpg"
								alt="" />
								<div class="content">
									<h3 style="font-weight: bolder">소파</h3>
									<p style="font-weight: bold">제품 보러가기</p>
								</div>
							</a>
						</div>
					</div>
					<div class="col-md-6">
						<div class="category-box">
							<a href="gaguShop?ginum=6"> <img
								src="${pageContext.request.contextPath}/resources/images/shop/category/category-tvtable4.jpg"
								alt="" />
								<div class="content">
									<h3 style="font-weight: bolder">거실장</h3>
									<p style="font-weight: bold">제품 보러가기</p>
								</div>
							</a>
						</div>
						<div class="category-box">
							<a href="gaguShop?ginum=1"> <img
								src="${pageContext.request.contextPath}/resources/images/shop/category/category-wardrobe9.jpg"
								alt="" />
								<div class="content">
									<h3 style="font-weight: bolder">장롱</h3>
									<p style="font-weight: bold">제품 보러가기</p>
								</div>
							</a>
						</div>
					</div>
					<%-- <div class="col-md-6">
				<div class="category-box category-box-2">
					<a href=""> <img
						src="${pageContext.request.contextPath}/resources/images/shop/category/category-${list.gpicture }"
						alt="" />
						<div class="content">
							<h3>Jewellery</h3>
							<p>View Products</p>
						</div>
					</a>
				</div>
			</div> --%>
				</div>
			</div>
		</section>
		<!-- 제품 섹션 -->
		<section class="products section">
			<div class="container">
				<div class="row">
					<div class="title text-center">
						<h2>신상품</h2>
					</div>
				</div>

				<div class="row">
					<c:forEach var="list" items="${list }" end="5">
						<div class="col-md-4">
							<div class="product-item">
								<div class="product-thumb">
									<!-- Sale tag -->
									<!-- <span class="bage">Sale</span>  -->
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/images/shop/products/${list.gpicture }"
										alt="product-img" />
									<div class="preview-meta">
										<ul>
											<li><a href="gaguShopDetail?gnum=${list.gnum}"><i
													class="tf-ion-ios-search"></i></a></li>
										</ul>
									</div>
								</div>
								<div class="product-content">
									<h4>
										<a href="gaguShopDetail?gnum=${list.gnum}&page=1">${list.gname }</a>
									</h4>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>


	</c:otherwise>
</c:choose>

<script src="https://ajax.googleapis.com/ajax/libs/jquery-3.4.1.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.js"></script>
<script type="text/javascript">
	var ctx = document.getElementById("myChart");
	var count1 = $('#count1').val();
	var count2 = $('#count2').val();
	var count3 = $('#count3').val();
	var count4 = $('#count4').val();
	var count5 = $('#count5').val();
	var count6 = $('#count6').val();
	var count7 = $('#count6').val();
	var count9 = $('#count9').val();
	var count10 = $('#count10').val();
	var count11 = $('#count11').val();
	var myChart = new Chart(ctx, {

		type : "pie",
		data : {
			labels : [ '장롱', '식탁', '침대', '스프링매트', '소파', '거실장', '리클라이너',
					'키즈/오피스', '소품', '서랍장' ],
			datasets : [ {
				label : "가구종류 별 조회수 ",
				data : [ count1, count2, count3, count4, count5, count6,
						count7, count9, count10, count11 ],
				backgroundColor : [ "rgba(255, 99, 132, 0.2)",
						"rgba(54, 162, 235, 0.2)", "rgba(255, 206, 86, 0.2)",
						"rgba(75, 192, 192, 0.2)", "rgba(153, 102, 255, 0.2)",
						"rgba(255, 159, 64, 0.2)", "rgba(100, 205, 0, 0.2)",
						"rgba(241, 188, 0, 0.2)", "rgba(241, 91, 0, 0.2)",
						"rgba(241, 91, 226, 0.2)" ],
				borderColor : [ "rgba(255, 99, 132, 1)",
						"rgba(54, 162, 235, 1)", "rgba(255, 206, 86, 1)",
						"rgba(75, 192, 192, 1)", "rgba(153, 102, 255, 1)",
						"rgba(255, 159, 64, 1)", "rgba(100, 205, 0, 1)",
						"rgba(241, 188, 0, 1)", "rgba(241, 91, 0, 1)",
						"rgba(241, 91, 226, 1)" ],
				borderWidth : 1
			} ]
		},
		options : {
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
			}
		}
	});
</script>

<script type="text/javascript">
	var ctx = document.getElementById("myChart2");
	var count1 = $('#sumcount1').val();
	var count2 = $('#sumcount2').val();
	var count3 = $('#sumcount3').val();
	var count4 = $('#sumcount4').val();
	var count5 = $('#sumcount5').val();
	var count6 = $('#sumcount6').val();
	var count7 = $('#sumcount7').val();
	var count9 = $('#sumcount9').val();
	var count10 = $('#sumcount10').val();
	var count11 = $('#sumcount11').val();
	var myChart = new Chart(ctx, {

		type : "bar",
		data : {
			labels : [ '장롱', '식탁', '침대', '스프링매트', '소파', '거실장', '리클라이너',
					'키즈/오피스', '소품', '서랍장' ],
			datasets : [ {
				label : "가구종류별 리뷰 별점 평균 ",
				data : [ count1, count2, count3, count4, count5, count6,
						count7, count9, count10, count11 ],
				backgroundColor : [ "rgba(241, 91, 226, 0.2)",
						"rgba(255, 99, 132, 0.2)", "rgba(54, 162, 235, 0.2)",
						"rgba(255, 206, 86, 0.2)", "rgba(75, 192, 192, 0.2)",
						"rgba(153, 102, 255, 0.2)", "rgba(255, 159, 64, 0.2)",
						"rgba(100, 205, 0, 0.2)", "rgba(241, 188, 0, 0.2)",
						"rgba(241, 91, 0, 0.2)", "rgba(241, 91, 226, 0.2)" ],
				borderColor : [ "rgba(241, 91, 226, 1)",
						"rgba(255, 99, 132, 1)", "rgba(54, 162, 235, 1)",
						"rgba(255, 206, 86, 1)", "rgba(75, 192, 192, 1)",
						"rgba(153, 102, 255, 1)", "rgba(255, 159, 64, 1)",
						"rgba(100, 205, 0, 1)", "rgba(241, 188, 0, 1)",
						"rgba(241, 91, 0, 1)", ],
				borderWidth : 1
			} ]
		},
		options : {
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
			}
		}
	});
</script>

<script type="text/javascript">
	var ctx = document.getElementById("myChart3");
	var count1 = $('#weekmoney1').val();
	var count2 = $('#weekmoney2').val();
	var count3 = $('#weekmoney3').val();
	var count4 = $('#weekmoney4').val();
	var count5 = $('#weekmoney5').val();
	var count6 = $('#weekmoney6').val();
	var count7 = $('#weekmoney7').val();
	var today = $('#today').val();
	var today1 = $('#today1').val();
	var today2 = $('#today2').val();
	var today3 = $('#today3').val();
	var today4 = $('#today4').val();
	var today5 = $('#today5').val();
	var today6 = $('#today6').val();

	var myChart = new Chart(ctx,
			{

				type : "line",
				data : {
					labels : [ today6, today5, today4, today3, today2, today1,
							today ],
					datasets : [ {
						label : "주간 매출 ",
						data : [ count7, count6, count5, count4, count3,
								count2, count1 ],
						backgroundColor : [ "rgba(241, 91, 226, 0.2)",
								"rgba(255, 99, 132, 0.2)",
								"rgba(54, 162, 235, 0.2)",
								"rgba(255, 206, 86, 0.2)",
								"rgba(75, 192, 192, 0.2)",
								"rgba(153, 102, 255, 0.2)",
								"rgba(255, 159, 64, 0.2)" ],
						borderColor : [ "rgba(241, 91, 226, 1)",
								"rgba(255, 99, 132, 1)",
								"rgba(54, 162, 235, 1)",
								"rgba(255, 206, 86, 1)",
								"rgba(75, 192, 192, 1)",
								"rgba(153, 102, 255, 1)",
								"rgba(255, 159, 64, 1)" ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
</script>
<script type="text/javascript">
	var ctx = document.getElementById("myChart4");

	var count1 = $('#chartRanking1').val();
	var count2 = $('#chartRanking2').val();
	var count3 = $('#chartRanking3').val();
	var count4 = $('#chartRanking4').val();
	var count5 = $('#chartRanking5').val();

	var today1 = $('#chartRankingName1').val();
	var today2 = $('#chartRankingName2').val();
	var today3 = $('#chartRankingName3').val();
	var today4 = $('#chartRankingName4').val();
	var today5 = $('#chartRankingName5').val();

	var myChart = new Chart(ctx,
			{
				type : "bar",
				data : {
					labels : [ today1, today2, today3, today4, today5 ],
					datasets : [ {
						label : "사용자 접속 순위 TOP5 ",
						data : [ count1, count2, count3, count4, count5 ],
						backgroundColor : [ "rgba(241, 91, 226, 0.2)",
								"rgba(255, 99, 132, 0.2)",
								"rgba(54, 162, 235, 0.2)",
								"rgba(153, 102, 255, 0.2)",
								"rgba(255, 159, 64, 0.2)" ],
						borderColor : [ "rgba(241, 91, 226, 1)",
								"rgba(255, 99, 132, 1)",
								"rgba(54, 162, 235, 1)",
								"rgba(153, 102, 255, 1)",
								"rgba(255, 159, 64, 1)" ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
</script>
<script
	src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>
<script>
	// swiper
	var swiper = new Swiper('.swiper-container', {
		slidesPerView : 1,
		spaceBetween : 100,
		speed : 3000,
		loop : true,
		autoplay : true,
		autoplayDisableOnInteraction : false,
		pagination : {
			el : '.swiper-pagination',
			clickable : false,
		},
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		},
	});
</script>

<%@include file="footer.jsp"%>