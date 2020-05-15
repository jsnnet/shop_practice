<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<style>
th {
	text-align: center;
}
</style>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">���� �� ����</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li><a href="mypageinfo">����������</a></li>
						<li class="active"><a href="myreviewlist?mid=${sessionScope.map.mid}">���� �� ����</a></li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="user-dashboard page-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="post-comments">
				<b>�� ${rcount }��</b>
					<ul class="media-list comments-list m-bot-50 clearlist">
						<br>
						
						<c:if test="${rcount == 0}">
							<a class="product-description mt-20"> ���� �ۼ��� ���䰡 �����ϴ�.</a>
						</c:if>
						<c:forEach var="ee" items="${rlist }">
						<hr>
							<!-- Comment Item start-->
							<li class="media">

								<div class="media-body">
									<div class="comment-info">
										
										<a class="star-box" id="star-box${ee.rnum}"> <span
											class="star_print star_left"></span> <span
											class="star_print star_right"></span> <span
											class="star_print star_left"></span> <span
											class="star_print star_right"></span> <span
											class="star_print star_left"></span> <span
											class="star_print star_right"></span> <span
											class="star_print star_left"></span> <span
											class="star_print star_right"></span> <span
											class="star_print star_left"></span> <span
											class="star_print star_right"></span> <b>${ee.rgrade }</b>��
										</a> <input type="hidden" value="${ee.rnum }">
										<!-- ���� -->
										<h4 class="comment-author">${ee.rtitle }</h4>
										<!-- �ۼ��� ���̵� -->
										<h4 class="comment-author">
											<a>${ee.mid }</a>
											
										</h4>
										<script>
											var rgrade = "<c:out value="${ee.rgrade}"/>";
											var rnum = "<c:out value="${ee.rnum}"/>";
											var j = 0;
											for (var i = 0.5; i <= rgrade; i += 0.5) {
												$('#star-box' + rnum + ' span')
														.eq(j).addClass("on");
												j++;
											}
										</script>
										<!-- ��¥/�ð� -->
										<a>${ee.rdate}</a>

										<!-- ����, ���� ��ư -->

										<button type="button" id="rupdbtn" class="comment-button"
											onclick="return updateRCk(${ee.rnum }, '${ee.rpwd }');">����</button>
										<button type="button" id="rdelbtn" class="comment-button"
											onclick="return deleteRCk(${ee.rnum }, '${ee.rpwd}');">����</button>

									</div>


									<p>${ee.rcontent }</p>
								</div>

							</li>
							<!-- End Comment Item -->

						</c:forEach>

					</ul>
					<div>
						<c:if test="${pageInfo.totalRows != 0 }">
							<%@include file="mypageReview_page.jsp"%>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<script>
function updateRCk(rnum, rpwd){
	var password= prompt("��й�ȣ�� �Է��ϼ���.","");
	if(password == rpwd){
		location='updatereviewform?rnum='+rnum;
	}else{
		alert("��й�ȣ ���� ����");
	}
}


function deleteRCk(rnum, rpwd){
	var password= prompt("��й�ȣ�� �Է��ϼ���.","");
	if(password == rpwd){
		location='deletereview?rnum='+rnum + '&gnum=' + ${gvo.gnum};
	}else{
		alert("��й�ȣ ���� ����");
	}
}
</script>