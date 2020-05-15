<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">��ٱ���</h1>
					<ol class="breadcrumb">
						<li><a href="main">Home</a></li>
						<li class="active">��ٱ���</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>
<div class="page-wrapper">
	<div class="cart shopping">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="block">
						<div class="product-list">
							<form method="post">
								<table class="table">
									<thead>
										<tr>
											<th>����</th>
											<th>�̸�</th>
											<th>����</th>
											<th>����</th>
											<th>����</th>
											<th>�� ����</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<div class="allCheck">
											<input type="checkbox" name="allCheck" id="allCheck"
												onchange="checkSum()"><label for="allCheck">���
												����</label>
										</div>
										<c:set var="sum" value="0" />
										<c:if test="${vo.cart == null }">
											<tr class="" style="text-align: center;">
												<td class="">
													<h3>��ٱ��ϰ� ������ϴ�.</h3>
												</td>
											</tr>
										</c:if>
										<c:if test="${vo.cart != null }">
											<c:forEach var="e" items="${vo.cart }">
												<tr class="">
													<td class="">
														<div class="chBox">
															<input type="checkbox" name="chBox" class="chBox"
																onchange="checkSum()" data-cnum="${e.cnum }"
																data-cheSum="${e.gagu.gprice*e.chit }">
														</div>
														<div class="product-info">
															<a href=""><img
																src="${pageContext.request.contextPath }/resources/images/shop/products/${e.gagu.gpicture }"
																style="width: 100px; border: 0px"></a>
														</div>
													</td>
													<td>${e.gagu.gname }</td>
													<td>${e.gagu.gcolor }</td>
													<td><input type="number" id="chit_${e.cnum }"
														name="chit_${e.cnum }" value="${e.chit }" min="1" step="1"
														max="${e.gagu.gstock }"></td>
													<td><fmt:formatNumber type="number"
															maxFractionDigits="3" value="${e.gagu.gprice }" /></td>
													<td><fmt:formatNumber type="number"
															maxFractionDigits="3" value="${e.gagu.gprice*e.chit }" /></td>
													<td><button type="button" class="btn btn-default"
															onclick="modify_sel_${e.cnum}(${e.cnum})">
															<i class="tf-pencil2" aria-hidden="true"></i>
														</button></td>
													<td><button type="button" class="btn btn-default"
															onclick="deleteC(${e.cnum })">
															<i class="tf-ion-close" aria-hidden="true"></i>
														</button></td>
												</tr>
												<c:set var="sum" value="${sum + (e.gagu.gprice * e.chit)}" />
											</c:forEach>
										</c:if>
									</tbody>
								</table>
								<div style="text-align: right;">
									<a
										style="background-color: white; color: black; font-size: 20px;">��
										�հ� : <fmt:formatNumber type="number" maxFractionDigits="3"
											value="${sum}" />��
									</a>
								</div>
								<div class="checkSum" style="text-align: right:;"></div>
								<div class="delBtnC">
									<button type="button" id="purchaseBtn" name="purchaseBtn"
										class="btn btn-main pull-right">����</button>
									&nbsp;&nbsp;&nbsp;
									<button type="button" id="delBtn" name="delBtn"
										class="btn btn-main pull-right">���� ����</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ���ŷ� �Ѿ�� -->
<script>
	$('#purchaseBtn').click(function () {
		var checkArr = new Array();
		  if(confirm("���� ���� �Ͻðڽ��ϱ�?") == true) {
			  var $form = $('<form></form>');
			  $form.attr('action','gorder');
			  $form.attr('method','post');
			  $form.appendTo('body');
			  $("input[class='chBox']:checked").each(function() {
					checkArr.push($(this).attr("data-cnum"));
			});
			  var chbox = $("<input type='hidden' value='"+checkArr+"' name='chbox[]'>"); 	
			  $form.append(chbox);
			 
			 if(checkArr.length){ 
			  $form.submit();
			 }else{
				alert("üũ�� �ּ���"); 
			 }
		  }  
	})
</script>
<!-- ���� -->
<c:forEach var="e" items="${vo.cart }">
	<script>
		function modify_sel_${e.cnum}(cnum) {		
		if(confirm("���� �Ͻðڽ��ϱ�?") == true){
			var chit = $('#chit_${e.cnum}').val();
			var chobox = {"cnum" : cnum, "chit" : chit};
			$.ajax({
				url : "modefy",
				type : "post",
				data : chobox})
				   }
			        location.reload();
			}
</script>
</c:forEach>
<!-- ��ü üũ�ڽ� ���� -->
<script>
	$('#allCheck').click(function() {
		var chk = $(this).prop("checked");
		if(chk){
			$('.chBox').prop('checked',true);
		}else{
			$('.chBox').prop('checked',false);
		}
	});
	$('.chBox').click(function(){
		$('#allCheck').prop('checked',false);
	});
</script>
<!-- ���� ���� -->
<script>	
	$('#delBtn').click(function() {		
		if(confirm("���� ���� �Ͻðڽ��ϱ�?") == true){
			var checkArr = new Array();
			
			$("input[class='chBox']:checked").each(function() {
				checkArr.push($(this).attr("data-cnum"));
		});
			$.ajax({
				url : "deleteCart",
				type : "post",
				data : {chbox : checkArr}
			})
		}
		setTimeout(function(){
        	location.reload();
		},300); 
	})
</script>
<!-- üũ�� ��ǰ ���հ� -->
<script>
	function checkSum(){
		var checkSum = new Array();
		var ckecke = "";
		if($("input[class='chBox']").is(":checked") == true){
		$("input[class='chBox']:checked").each(function() {
			ckecke = $(this).attr("data-cheSum");
				checkSum.push(ckecke)
		});
		}else{
			checkSum.push(0)
		}	
		$.ajax({
			url : "checkSum",
			type : "get",
			data : {checkS : checkSum},
			//dataType: "json",
			success: function(data) {
	 			if(data != null){
				let tag ="";
				tag += "<a style='background-color: white; color: black; font-size: 20px;' >";
				tag += "���� �հ� : "+data+"��</a>";
				$('.checkSum').html(tag);
				}else if (data == null){
				let tag ="";
				tag += "<a style='background-color: white; color: black; font-size: 20px;' >";
				tag += "���� �հ� : 0 ��</a>";
				$('.checkSum').html(tag);
				}
			},
			error: function (error) {
				console.log(error)
			}
		})	
	}
</script>

<!-- ���� -->
<script>					
	function deleteC(cnum) {		
	        if(confirm("���� ���� �Ͻðڽ��ϱ�?") == true) {
		   $.ajax({
			   url : "deleteCartSel",
				type : "post",
				data : {chbox : cnum}})
		   }
	        	location.reload();
	}
</script>
<%@ include file="footer.jsp"%>