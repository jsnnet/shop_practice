<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
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
               <h1 class="page-name">출석체크</h1>
               <ol class="breadcrumb">
                  <li><a href="main">Home</a></li>
                  <li><a href="mypageinfo">마이페이지</a></li>
                  <li class="active">출석체크</li>
               </ol>
            </div>
         </div>
      </div>
   </div>
</section>
<div class="container">
   
   <script type="text/javascript"
      src="${pageContext.request.contextPath}/resources/js/attend.js"></script>
   <script type="text/javascript"
      src="${pageContext.request.contextPath}/resources/js/daygrid.js"></script>
   <script type="text/javascript"
      src="${pageContext.request.contextPath}/resources/js/timegrid.js"></script>
   <script type="text/javascript"
      src="${pageContext.request.contextPath}/resources/js/interaction.js"></script>
   <script type="text/javascript"
      src="${pageContext.request.contextPath}/resources/js/ko.js"></script>
   <script type="text/javascript"
      src="${pageContext.request.contextPath}/resources/js/moment.js"></script>
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <div id="calendar">
   		<div class="text-center">
   			<br><br>
   			<input class="btn btn-main button-style" type="button" id="btnAddTest" value="출석체크">
   		</div>
   	</div>
   <div id="mnum"></div>
</div>
<!-- 캘린더 초기설정 -->

<script>
   document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
         plugins : [ 'dayGrid' ],
         dateClick : function() {
          
         },
         plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
         header : {
            left : ' ',
            center : 'title',
            right : ''
         },
         editable : true,
         droppable : true, // this allows things to be dropped onto the calendar
         drop : function(info) {
            // is the "remove after drop" checkbox checked?
            if (checkbox.checked) {
               // if so, remove the element from the "Draggable Events" list
               info.draggedEl.parentNode.removeChild(info.draggedEl);
            }
         },
         locale : 'ko'
      });

      $.ajax({
         url : 'calendardate',
         type : 'get',
         success : function(resp) {
            $.each(resp, function(key, e) {
               //key와 value를 추출하는데 json에서 key는 위치 즉 x축에 해당 
               //value는 수치값 y축에 증가분 
               calendar.addEvent(e);
            });
            calendar.render();
            //});
         },
         error : function() {
            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
         }
      });

      $("#btnAddTest").click(function() {
         
         $.ajax({
            url : 'calendarcheck',
            type : 'get',
            success : function(resp) {
               if (resp == "") {
                  alert('이미 출석체크를 했습니다.');
               } else {
                  $.each(resp, function(key, e) {
                     //key와 value를 추출하는데 json에서 key는 위치 즉 x축에 해당 
                     //value는 수치값 y축에 증가분 
                     calendar.addEvent(e);
                     alert('출석체크를 했습니다.');
                  });
                  calendar.render();
               }
            },
            error : function() {
               alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
            }
         });

      });
   });
</script>


<style>
html, body {
   margin: 0;
   padding: 0;
   font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
   font-size: 14px;
}

#external-events {
   position: fixed;
   z-index: 2;
   top: 300px;
   left: 140px;
   width: 150px;
   padding: 0 10px;
   border: 1px solid #ccc;
   background: #eee;
}

.demo-topbar+#external-events { /* will get stripped out */
   top: 60px;
}

#external-events .fc-event {
   margin: 1em 0;
   cursor: move;
}

#calendar-container {
   position: relative;
   z-index: 1;
   margin-left: 200px;
}

#calendar {
   max-width: 900px;
   margin: 20px auto;
}
</style>


<section class="user-dashboard page-wrapper">
   <div class="container">
      <div class="row">
         <div class="col-md-12">
            <div class="dashboard-wrapper user-dashboard">
               <div class="table-responsive">
                  <table class="table">
                     <thead>
                        <tr>
                           <th>회원번호</th>
                           <th class="col-md-2 col-sm-3">출석날짜</th>
                           <th>출석시간</th>
                           <th>출석여부</th>
                        </tr>
                     </thead>
                     <tbody class="text-center">
                        <c:forEach var="e" items="${vlist}">
                           <tr>
                              <td>${e.mnum}</td>
                              <td>${e.attdate}</td>
                              <td>${e.attdatetime}</td>
                              <td>${e.title}</td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>

<%@include file="footer.jsp"%>
