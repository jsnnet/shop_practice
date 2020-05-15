<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">상세 문의</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li><a href="qna_list?page=1">문의사항</a></li>
						<li class="active">상세 문의</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>


<div class="page-wrapper">
	<div class="purchase-confirmation shopping">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="block ">
						<div class="purchase-confirmation-details">
							<table id="purchase-receipt" class="table">
								<thead>
									<tr>
										<th style="width: 200px"><strong>게시물 번호:</strong></th>
										<th>${vo.qnum}</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><strong>제목 : </strong></td>
										<td>${vo.qtitle}</td>
									</tr>

									<tr>
										<td><strong>분류:</strong></td>
										<td>${vo.qcatagory}</td>
									</tr>
									<tr>
										<td><strong>업데이트 날짜:</strong></td>
										<td>${vo.qdate}</td>
									</tr>
									<tr>
										<td><strong>내용 :</strong></td>
										<td>${vo.qcontent}</td>
									</tr>
									
									<tr>
										<td colspan="2">
											<c:choose>
												<%--회원일때 수정,삭제가능 --%>
												<c:when test="${sessionScope.map.madmin == 1}">
													<button type="button" class="btn btn-default"
														onclick="location='qna_upform?num=${vo.qnum}'">
														<i class="tf-pencil2" aria-hidden="true"></i>
													</button>
													<button type="button" class="btn btn-default"
														onclick="deleteQnA(${vo.qnum});">
														<i class="tf-ion-close" aria-hidden="true"></i>
													</button>
												</c:when>
												<%--관리자 일때 --%>
												<c:otherwise>
													
												</c:otherwise>
											</c:choose>
											<input type="button" class="btn btn-default text-right" value="List" 
                                    			onclick="location='qna_list?page=1'">
										</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2">
											<form action="qnacomm_insert" method="post" id="insert">
												<input type="text" name="qccontent" style="width: 550px"
													id="qccontent"> <input type="submit"
													class="btn btn-main" value="작성" id="btn">
												<!--게시물번호와 회원번호 전달 -->
												<input type="hidden" value="${sessionScope.map.mnum}"
													name="mnum" id="mnum"> <input type="hidden"
													value="${vo.qnum}" id="qnum" name="qnum">
											</form>
										</td>
									</tr>
								</tfoot>
							</table>
							<div>
								<!-- 댓글 리스트 -->
								<c:forEach var="e" items="${list}">
									<ul>
										<li>
											<div>
												<c:choose>
													<c:when test="${e.madmin == 0}">
													작성자 : &nbsp;관리자 &nbsp;
													</c:when>
													<c:otherwise>
													작성자 : &nbsp;${e.mid}&nbsp;
													</c:otherwise>
												</c:choose>
												&nbsp; | &nbsp; 작성시각 : ${e.qcdate }
												<c:choose>
													<%--자기의 계정과 맞을 경우에만 댓글 수정,삭제 가능  --%>
													<c:when test="${sessionScope.map.mid==e.mid}">
														<button type="button" class="btn btn-default"
															onclick="location='qnacomm_upform?qcnum=${e.qcnum}&qnum=${vo.qnum}'">
															<i class="tf-pencil2" aria-hidden="true"></i>
														</button>
														<button type="button" class="btn btn-default"
															onclick="return deleteCheck(${e.qcnum},${vo.qnum});">
															<i class="tf-ion-close" aria-hidden="true"></i>
														</button>
													</c:when>
													<c:when test="${sessionScope.map.madmin==0}">
														<button type="button" class="btn btn-default"
																onclick="location='qnacomm_upform?qcnum=${e.qcnum}&qnum=${vo.qnum}'">
																<i class="tf-pencil2" aria-hidden="true"></i>
															</button>
															<button type="button" class="btn btn-default"
																onclick="return deleteCheck(${e.qcnum},${vo.qnum});">
																<i class="tf-ion-close" aria-hidden="true"></i>
															</button>
													</c:when>
													<c:otherwise>

													</c:otherwise>
												</c:choose>
											</div>
											<div>내용 &nbsp;: &nbsp;${e.qccontent}</div>
										</li>
									</ul>
									<hr>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="footer.jsp"%>
<script>
	//게시글 삭제
	function deleteQnA(qnum){
		if(confirm('삭제하시겠습니까?')){
			location='qna_delete?num=${vo.qnum}'
		}
	}
	//댓글 삭제
	function deleteCheck(qcnum,qnum){
		//alert(pwd);
		if(confirm('삭제하시겠습니까?')){
			location='qnacomm_delete?qcnum='+qcnum+'&qnum='+qnum;
		}
	}
	
</script>
