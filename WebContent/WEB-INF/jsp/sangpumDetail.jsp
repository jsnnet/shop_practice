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
					<h1 class="page-name">침실</h1>
					<ol class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li class="active">침실</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>


<section class="products section">
<form id="detailF" name="detailF" method="post" action="cart" target="detailF">
<input type="hidden" name="mnum" value="${vo.mnum }">
<input type="hidden" name="gnum" value="${dto.gnum }">
	<h3>상품 상세보기</h3>
<input type="button" id="jangbaguny" value="장바구니">
<p>${vo.mnum }</p>
<p>${dto.gnum }</p>
<p>${dto.gname }</p>
<p>${dto.ginum }</p>
<p>${dto.ginfo }</p>
<p>${dto.gcolor }</p>
<p>${dto.gpicture }</p>
<p>${dto.gsize }</p>
<p>${dto.gcompany }</p>
<p>${dto.gprice }</p>
<p>${dto.gstock }</p>
<input type="number" id="chit" name="chit" value="1" step="1" >
</form>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function() {
	
	$('#jangbaguny').click(function(){
		
		if(confirm("장바구니에 담으실껀가요?") == true){
			var chit = $('#chit').val();
			window.open('cart?mnum='+${vo.mnum}+'&gnum='+${dto.gnum}+'&chit='+chit,'width=500', 'height=500');
		}
	});
});
</script>

</section>


<%@include file="footer.jsp"%>