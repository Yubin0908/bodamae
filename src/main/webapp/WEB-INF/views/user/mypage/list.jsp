<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<html>
<head>
  <title>보담 愛</title>
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${resPath}css/webSettings.css">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  <style>
    .content {
      width: 1200px;
      margin: 0 auto;
    }
  </style>
</head>
<body>
  <%-- header --%>
  <jsp:include page="../common/navar.jsp" />

  <%-- content --%>
  <div class="content">
    <div class="mypage-title w-100">
      <p>
        <span class="userName">홍길동님, </span>
        <span class="title">마이페이지</span>
      </p>
    </div>
  </div>

</body>
</html>
