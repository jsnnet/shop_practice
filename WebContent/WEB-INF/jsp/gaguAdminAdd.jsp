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
					<h1 class="page-name">상품관리</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li class="active"><a href="main">상품 정보 등록</a></li>
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
					<a class="logo" href="main"> <img src="images/logo.png" alt="">
					</a>
					<h2 class="text-center">상품 등록</h2>
					<form class="text-left clearfix" action="gaguAdd" method="post"
						enctype="multipart/form-data" id="gaguform">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="가구 이름"
								name="gname" id="gname" required="required">
						</div>
						<div class="form-group">
							<select class="form-control" name="ginum" id="ginum"
								required="required">
								<option value="">가구 종류</option>
								<c:forEach items="${list}" var="e">
									<option value="${e.ginum}">${e.giname}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<textarea rows="5" cols="3" class="form-control" name="ginfo"
								id="ginfo" placeholder="가구정보" style="resize: none;"
								required="required"></textarea>
						</div>
						<div class="form-group">
							<select class="form-control" name="gcolor" id="gcolor"
								required="required">
								<option value="">가구 색상</option>
								<option value="brown">갈색</option>
								<option value="white">흰색</option>
								<option value="dark-brown">짙은갈색</option>
								<option value="red-rose">붉은장미색</option>
								<option value="gray">회색</option>
								<option value="black">검정색</option>
								<option value="navy">네이비색</option>
								<option value="light-gray">밝은회색</option>
								<option value="light-navy">밝은남색</option>
								<option value="ivory">병아리색</option>
								<option value="dark-gray">어두운회색</option>
								<option value="dark-mint">어두운민트</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="가구 크기"
								name="gsize" id="gsize" required="required">
						</div>

						<div class="form-group">
							<select class="form-control" name="gcompany" id="gcompany"
								required="required">
								<option value="">가구 제조사</option>
								<option value="Ikea">이케아</option>
								<option value="Yuri">유리가구장인</option>
								<option value="Daechidong">대치동가구장인</option>
								<option value="그랜드침대">그랜드침대</option>
								<option value="금성침대">금성침대</option>
								<option value="한샘">한샘</option>
								<option value="보니애">보니애</option>
								<option value="로포텐">로포텐</option>
								<option value="리바이트이즈마인">리바이트이즈마인</option>
								<option value="레트로하우스">레트로하우스</option>
							</select>
						</div>

						<div class="form-group">
							<input type="number" class="form-control" placeholder="가구 가격"
								name="gprice" id="gprice" required="required">
						</div>
						<div class="form-group">
							<input type="number" class="form-control" placeholder="가구 재고"
								name="gstock" id="gstock" required="required">
						</div>
						<div class="form-group">
							<input type="file" class="form-control" placeholder="가구 섬네일 이미지"
								name="multipartFile" id="gpicture" required="required">
						</div>
						<div class="form-group">
							<input type="file" class="form-control" placeholder="가구 설명 이미지"
								name="multipartFile2" id="gdetail" required="required">
						</div>
						<div class="text-center">
							<button type="submit" id="submitbtn"
								class="btn btn-main text-center">가구추가</button>
						</div>
					</form>
					<p class="mt-20 form-group">
						<a href="main">돌아가기</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="footer.jsp"%>