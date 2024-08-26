<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<html>
<head>
  <title>보담 愛 | 공지사항</title>
  <link rel="stylesheet" href="${ resPath }css/webSettings.css">
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  
  <style type="text/css">
    .content { width: 1200px; margin: 100px auto; }
    .notice-table { width: 1000px; margin: 0 auto; }
    .table { margin: 0 auto; }
    .btn { margin-top: 100px;  }
  </style>
</head>
<body>
  <%-- header --%>
  <jsp:include page="../common/navar.jsp" />

  <%-- content --%>
  <div class="content">
  <!-- 공지사항 상세페이지 -->
    <div class="notice-table">
      <h3>${ notice.notice_title }</h3>
      
      <div class="display-flex">
        <div class="notice-info">
          <span class="notice-info">관리자</span>
          <span class="notice-info">${ notice.notice_date }</span>
          <span class="notice-info">조회 ${ notice.notice_hits }</span>
        </div>
      </div>
      <hr class="my-2">
      
      <div class="notice-content">
        <p>${ notice.notice_content }</p>
      </div>
      <button type="button" class="btn btn-outline-info w-100 btn-lg"
          onclick="location.href='${ context }notice'">뒤로 가기</button>
    </div>
  </div>
</body>
</html>