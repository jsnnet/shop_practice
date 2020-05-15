<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">�� ����</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li><a href="qna_list?page=1">���ǻ���</a></li>
						<li class="active">�� ����</li>
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
										<th style="width: 200px"><strong>�Խù� ��ȣ:</strong></th>
										<th>${vo.qnum}</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><strong>���� : </strong></td>
										<td>${vo.qtitle}</td>
									</tr>

									<tr>
										<td><strong>�з�:</strong></td>
										<td>${vo.qcatagory}</td>
									</tr>
									<tr>
										<td><strong>������Ʈ ��¥:</strong></td>
										<td>${vo.qdate}</td>
									</tr>
									<tr>
										<td><strong>���� :</strong></td>
										<td>${vo.qcontent}</td>
									</tr>
									
									<tr>
										<td colspan="2">
											<c:choose>
												<%--ȸ���϶� ����,�������� --%>
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
												<%--������ �϶� --%>
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
													class="btn btn-main" value="�ۼ�" id="btn">
												<!--�Խù���ȣ�� ȸ����ȣ ���� -->
												<input type="hidden" value="${sessionScope.map.mnum}"
													name="mnum" id="mnum"> <input type="hidden"
													value="${vo.qnum}" id="qnum" name="qnum">
											</form>
										</td>
									</tr>
								</tfoot>
							</table>
							<div>
								<!-- ��� ����Ʈ -->
								<c:forEach var="e" items="${list}">
									<ul>
										<li>
											<div>
												<c:choose>
													<c:when test="${e.madmin == 0}">
													�ۼ��� : &nbsp;������ &nbsp;
													</c:when>
													<c:otherwise>
													�ۼ��� : &nbsp;${e.mid}&nbsp;
													</c:otherwise>
												</c:choose>
												&nbsp; | &nbsp; �ۼ��ð� : ${e.qcdate }
												<c:choose>
													<%--�ڱ��� ������ ���� ��쿡�� ��� ����,���� ����  --%>
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
											<div>���� &nbsp;: &nbsp;${e.qccontent}</div>
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
	//�Խñ� ����
	function deleteQnA(qnum){
		if(confirm('�����Ͻðڽ��ϱ�?')){
			location='qna_delete?num=${vo.qnum}'
		}
	}
	//��� ����
	function deleteCheck(qcnum,qnum){
		//alert(pwd);
		if(confirm('�����Ͻðڽ��ϱ�?')){
			location='qnacomm_delete?qcnum='+qcnum+'&qnum='+qnum;
		}
	}
	
</script>
