<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>
<body id="body">

<section class="forget-password-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
          <a class="logo" href="index.html">
            <img src="images/logo.png" alt="">
          </a>
          <h2 class="text-center">��ۼ���</h2>
          <form class="text-left clearfix" action="qnacomm_update" method="post">
            <p>�ۼ��� : ${vo.mid } | �ۼ��ð� : ${vo.qcdate }</p>
            <div class="form-group">
              <input type="hidden" value="${vo.qcnum}" name="qcnum">
              <input type="hidden" value="${qnum}" name="qnum">
              <input type="text" class="form-control" name="qccontent" value="${vo.qccontent}">
            </div>
            <div class="text-center">
              <button type="submit" class="btn btn-main text-center">����</button>
            </div>
          </form>
          <p class="mt-20"><a href="qna_detailForm?num=${qnum}">�ǵ��ư���</a></p>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
<%@include file="footer.jsp"%>