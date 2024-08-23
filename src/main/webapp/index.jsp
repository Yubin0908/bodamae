<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<html>
<head>
  <title>보담 愛</title>
  <link rel="stylesheet" href="${ resPath }css/webSettings.css">
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  
  <style type="text/css">
    .content { width: 1200px; margin: 100px auto; }
    .table { margin: 0 auto; }
  </style>
</head>
<body>
  <%-- header --%>
  <jsp:include page="/WEB-INF/views/user/common/navar.jsp" />

  <%-- content --%>
  <div class="content">
  </div>
</body>
</html>
