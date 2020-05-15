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
               <h1 class="page-name">�ֹ�</h1>
               <ol class="breadcrumb">
                  <li><a href="main">Home</a></li>
                  <li class="active">�ֹ��ϱ�</li>
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
                           <th>ȸ�� ����</th>
                        </tr>
                     </thead>
                     <tbody class ="sangdong_a">
                        <tr>
                           <td>�̸�</td>
                           <td>${mem.mname}</td>
                        </tr>
                        <tr>
                           <td>�޴��� ��ȣ</td>
                           <td>${mem.mtel }</td>
                        </tr>
                     </tbody>
                  </table>
                  <table class="table">
                     <thead>
                        <tr>
                           <th>�޴� ��� ����</th>
                        </tr>
                        
                     </thead>
                     <tbody class ="sangdong_b">
                        <tr>
                           <td>�̸�</td>
                           <td>${mem.mname}</td>
                        </tr>
                        <tr>
                           <td>��� �ּ�</td>
                           <td><p>�����ȣ : ${mem.mpost}</p> 
                              <p>${mem.maddr1}</p>
                              <p>���ּ� : ${mem.maddr2 }</p></td>
                        </tr>
                     </tbody>
                  </table>
                  
                  <table class="table info">
                        <thead>
                           <tr>
                              <th>��� ����  �� <input type="checkbox" name="checkBtn" id="checkBtn"></th>
                           </tr>
                        </thead>
                        <tbody class="sangdong_tag">
                           <tr>
                              <td>�̸� </td>
                              <td><input type="text" name="oname" ></td>
                           </tr>
                           <tr>
                              <td>�޴��� ��ȣ </td>
                              <td><input type="text" name="otel"></td>
                           </tr>
                           <tr>
                              <td>��� �ּ�</td>
                              <td><p>�����ȣ : <input type="text" class="form-control" name="opost" id="opost" placeholder="�����ȣ"
                              onclick="javascript:execDaumPostcode();">
                                 <input type="button" class="btn btn-default" name="mpostBtn" id="mpostBtn" value="�˻�"
                                 onclick="javascript:execDaumPostcode();"></p> 
                                 <p><input type="text" class="form-control" name="oaddr1" id="oaddr1" placeholder="�ּ�"></p>
                                 <p><input type="text" class="form-control" name="oaddr2" id="oaddr2" placeholder="���ּ�"></p>
                              </td>
                           </tr>
                        </tbody>                    
                  </table>                  
                  <table class="table">
                     <thead>
                        <tr>
                           <th>���� ����Ʈ</th>
                        </tr>
                     </thead>
                     <tbody>
                     <tr>
                           <td>��ǰ�̸�</td>
                           <td>��ǰ ����</td>
                           <td>����</td>
                           <td>����</td>
                           <td>�� ����</td>
                        </tr>
                     <c:forEach var="e" items="${list}" varStatus="i" begin="0" step="1">
                       <input type="hidden" name="gorderDetail[${i.index }].gnum" value="${e.gagu.gnum }">
                       <input type="hidden" name="gorderDetail[${i.index }].odamount" value="${e.chit }">
                       <input type="hidden" name="gorderDetail[${i.index }].cnum" value="${e.cnum }">
                       <input type="hidden" name="gorderDetail[${i.index }].odprice" value="${e.gagu.gprice*e.chit }">
                        <tr>
                           <td> ${e.gagu.gname }</td>
                           <td>${e.gagu.ginfo } | ���� : ${e.gagu.gcolor }</td>
                           <td>${e.chit }</td>
                           <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${e.gagu.gprice }" />��</td>                          
                           <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${e.gagu.gprice*e.chit }" />��</td>
                        </tr>
                     </c:forEach>
                     </tbody>
                  </table>
                  <table class="table">
                     <thead>
                        <tr>
                           <th>����</th>
                        </tr>
                     </thead>
                     <tbody class ="gorderBuy">
                        <tr>
                           <td>�ѱݾ�</td>
                        </tr>
                        <tr>
                           <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${priceSum }" />��
                           	<ul class="list-inline dashboard-menu text-center">               
               					<li><input type="submit" class="btn btn-main button-style active" value="����"></li>
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
<!-- �ּҰ˻� -->
<script>
function execDaumPostcode() {
   new daum.Postcode({
   oncomplete: function(data) {
   // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
   // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
   var fullAddr = ''; // ���� �ּ� ����
   var extraAddr = ''; // ������ �ּ� ����

   // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
   if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
      fullAddr = data.roadAddress;

   } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
      fullAddr = data.jibunAddress;
   }
   // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
   if(data.userSelectedType === 'R'){
   //���������� ���� ��� �߰��Ѵ�.
   if(data.bname !== ''){
      extraAddr += data.bname;
   }
   // �ǹ����� ���� ��� �߰��Ѵ�.
   if(data.buildingName !== ''){
      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
   }
   // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
      fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
   }
   // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
   document.getElementById('opost').value = data.zonecode; //5�ڸ� �������ȣ ���
   document.getElementById('oaddr1').value = fullAddr;
   // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
   document.getElementById('oaddr2').focus();
   }
}).open();
}

</script>
<!-- �� ��ư -->
<script>
$(function() {
   $('#checkBtn').change(function(){   
      let tag = "";
      if($(this).is(':checked')){         
         tag += "<tr><td>�̸� </td>";
         tag += "<td><input type='text' name='oname' value='${mem.mname}'></td></tr><tr>";
         tag += "<td>�޴��� ��ȣ </td>";
         tag += "<td><input type='text' name='otel' value='${mem.mtel }'></td>";
         tag += "</tr><tr><td>��� �ּ�</td>";
         tag += "<td><p>�����ȣ : <input type='text' class='form-control' name='opost' id='opost' placeholder='�����ȣ' value='${mem.mpost}' readonly='readonly'>";
         tag += "<input type='button' class='btn btn-default' name='mpostBtn' id='mpostBtn' value='�˻�' disabled='disabled'></p>"; 
         tag += "<p><input type='text' class='form-control' name='oaddr1' id='oaddr1' placeholder='�ּ�' value='${mem.maddr1}' readonly='readonly'></p>";
         tag += "<p><input type='text' class='form-control' name='oaddr2' id='oaddr2' placeholder='���ּ�' value='${mem.maddr2 }' readonly='readonly'></p>";
         tag += "</td></tr>";
         $('.sangdong_tag').html(tag);
      }else{
         tag += "<tr><td>�̸� </td>";
         tag += "<td><input type='text' name='oname'></td></tr><tr>";
         tag += "<td>�޴��� ��ȣ </td>";
         tag += "<td><input type='text' name='otel'></td>";
         tag += "</tr><tr><td>��� �ּ�</td>";
         tag += "<td><p>�����ȣ : <input type='text' class='form-control' name='opost' id='opost' placeholder='�����ȣ' onclick='javascript:execDaumPostcode();'>";
         tag += "<input type='button' class='btn btn-default' name='mpostBtn' id='mpostBtn' value='�˻�' onclick='javascript:execDaumPostcode();'></p>"; 
         tag += "<p><input type='text' class='form-control' name='oaddr1' id='oaddr1' placeholder='�ּ�'></p>";
         tag += "<p><input type='text' class='form-control' name='oaddr2' id='oaddr2' placeholder='���ּ�'></p>";
         tag += "</td></tr>";
         $('.sangdong_tag').html(tag);
      }
   });
});
</script>
<%@ include file="footer.jsp"%>