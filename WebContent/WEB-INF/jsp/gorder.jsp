<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<section class="page-header">
   <div class="container">
      <div class="row">
         <div class="col-md-12">
            <div class="content">
               <h1 class="page-name">주문</h1>
               <ol class="breadcrumb">
                  <li><a href="main">Home</a></li>
                  <li class="active">주문하기</li>
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
            
            <div class="dashboard-wrapper user-dashboard">
               <div class="table-responsive">
                  <form action="gordersubmit" method="post">
                  <input type="hidden" name="ototal" value="${priceSum }">
                  <table class="table info">
                     <thead>
                        <tr>
                           <th>회원 정보</th>
                        </tr>
                     </thead>
                     <tbody class ="sangdong_a">
                        <tr>
                           <td>이름</td>
                           <td>${mem.mname}</td>
                        </tr>
                        <tr>
                           <td>휴대폰 번호</td>
                           <td>${mem.mtel }</td>
                        </tr>
                     </tbody>
                  </table>
                  <table class="table">
                     <thead>
                        <tr>
                           <th>받는 사람 정보</th>
                        </tr>
                        
                     </thead>
                     <tbody class ="sangdong_b">
                        <tr>
                           <td>이름</td>
                           <td>${mem.mname}</td>
                        </tr>
                        <tr>
                           <td>배송 주소</td>
                           <td><p>우편번호 : ${mem.mpost}</p> 
                              <p>${mem.maddr1}</p>
                              <p>상세주소 : ${mem.maddr2 }</p></td>
                        </tr>
                     </tbody>
                  </table>
                  
                  <table class="table info">
                        <thead>
                           <tr>
                              <th>배송 정보  상동 <input type="checkbox" name="checkBtn" id="checkBtn"></th>
                           </tr>
                        </thead>
                        <tbody class="sangdong_tag">
                           <tr>
                              <td>이름 </td>
                              <td><input type="text" name="oname" ></td>
                           </tr>
                           <tr>
                              <td>휴대폰 번호 </td>
                              <td><input type="text" name="otel"></td>
                           </tr>
                           <tr>
                              <td>배송 주소</td>
                              <td><p>우편번호 : <input type="text" class="form-control" name="opost" id="opost" placeholder="우편번호"
                              onclick="javascript:execDaumPostcode();">
                                 <input type="button" class="btn btn-default" name="mpostBtn" id="mpostBtn" value="검색"
                                 onclick="javascript:execDaumPostcode();"></p> 
                                 <p><input type="text" class="form-control" name="oaddr1" id="oaddr1" placeholder="주소"></p>
                                 <p><input type="text" class="form-control" name="oaddr2" id="oaddr2" placeholder="상세주소"></p>
                              </td>
                           </tr>
                        </tbody>                    
                  </table>                  
                  <table class="table">
                     <thead>
                        <tr>
                           <th>구매 리스트</th>
                        </tr>
                     </thead>
                     <tbody>
                     <tr>
                           <td>상품이름</td>
                           <td>상품 정보</td>
                           <td>갯수</td>
                           <td>가격</td>
                           <td>총 가격</td>
                        </tr>
                     <c:forEach var="e" items="${list}" varStatus="i" begin="0" step="1">
                       <input type="hidden" name="gorderDetail[${i.index }].gnum" value="${e.gagu.gnum }">
                       <input type="hidden" name="gorderDetail[${i.index }].odamount" value="${e.chit }">
                       <input type="hidden" name="gorderDetail[${i.index }].cnum" value="${e.cnum }">
                       <input type="hidden" name="gorderDetail[${i.index }].odprice" value="${e.gagu.gprice*e.chit }">
                        <tr>
                           <td> ${e.gagu.gname }</td>
                           <td>${e.gagu.ginfo } | 색상 : ${e.gagu.gcolor }</td>
                           <td>${e.chit }</td>
                           <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${e.gagu.gprice }" />원</td>                          
                           <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${e.gagu.gprice*e.chit }" />원</td>
                        </tr>
                     </c:forEach>
                     </tbody>
                  </table>
                  <table class="table">
                     <thead>
                        <tr>
                           <th>결제</th>
                        </tr>
                     </thead>
                     <tbody class ="gorderBuy">
                        <tr>
                           <td>총금액</td>
                        </tr>
                        <tr>
                           <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${priceSum }" />원
                           	<ul class="list-inline dashboard-menu text-center">               
               					<li><input type="submit" class="btn btn-main button-style active" value="구매"></li>
            			   	</ul>
            			   </td>
                        </tr>
                     </tbody>
                  </table>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<!-- 주소검색 -->
<script>
function execDaumPostcode() {
   new daum.Postcode({
   oncomplete: function(data) {
   // 각 주소의 노출 규칙에 따라 주소를 조합한다.
   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
   var fullAddr = ''; // 최종 주소 변수
   var extraAddr = ''; // 조합형 주소 변수

   // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
   if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
      fullAddr = data.roadAddress;

   } else { // 사용자가 지번 주소를 선택했을 경우(J)
      fullAddr = data.jibunAddress;
   }
   // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
   if(data.userSelectedType === 'R'){
   //법정동명이 있을 경우 추가한다.
   if(data.bname !== ''){
      extraAddr += data.bname;
   }
   // 건물명이 있을 경우 추가한다.
   if(data.buildingName !== ''){
      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
   }
   // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
      fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
   }
   // 우편번호와 주소 정보를 해당 필드에 넣는다.
   document.getElementById('opost').value = data.zonecode; //5자리 새우편번호 사용
   document.getElementById('oaddr1').value = fullAddr;
   // 커서를 상세주소 필드로 이동한다.
   document.getElementById('oaddr2').focus();
   }
}).open();
}

</script>
<!-- 상동 버튼 -->
<script>
$(function() {
   $('#checkBtn').change(function(){   
      let tag = "";
      if($(this).is(':checked')){         
         tag += "<tr><td>이름 </td>";
         tag += "<td><input type='text' name='oname' value='${mem.mname}'></td></tr><tr>";
         tag += "<td>휴대폰 번호 </td>";
         tag += "<td><input type='text' name='otel' value='${mem.mtel }'></td>";
         tag += "</tr><tr><td>배송 주소</td>";
         tag += "<td><p>우편번호 : <input type='text' class='form-control' name='opost' id='opost' placeholder='우편번호' value='${mem.mpost}' readonly='readonly'>";
         tag += "<input type='button' class='btn btn-default' name='mpostBtn' id='mpostBtn' value='검색' disabled='disabled'></p>"; 
         tag += "<p><input type='text' class='form-control' name='oaddr1' id='oaddr1' placeholder='주소' value='${mem.maddr1}' readonly='readonly'></p>";
         tag += "<p><input type='text' class='form-control' name='oaddr2' id='oaddr2' placeholder='상세주소' value='${mem.maddr2 }' readonly='readonly'></p>";
         tag += "</td></tr>";
         $('.sangdong_tag').html(tag);
      }else{
         tag += "<tr><td>이름 </td>";
         tag += "<td><input type='text' name='oname'></td></tr><tr>";
         tag += "<td>휴대폰 번호 </td>";
         tag += "<td><input type='text' name='otel'></td>";
         tag += "</tr><tr><td>배송 주소</td>";
         tag += "<td><p>우편번호 : <input type='text' class='form-control' name='opost' id='opost' placeholder='우편번호' onclick='javascript:execDaumPostcode();'>";
         tag += "<input type='button' class='btn btn-default' name='mpostBtn' id='mpostBtn' value='검색' onclick='javascript:execDaumPostcode();'></p>"; 
         tag += "<p><input type='text' class='form-control' name='oaddr1' id='oaddr1' placeholder='주소'></p>";
         tag += "<p><input type='text' class='form-control' name='oaddr2' id='oaddr2' placeholder='상세주소'></p>";
         tag += "</td></tr>";
         $('.sangdong_tag').html(tag);
      }
   });
});
</script>
<%@ include file="footer.jsp"%>