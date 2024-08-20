<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />
<html>
<head>
  <title>보담 愛</title>
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js" ></script>
  <link rel="stylesheet" href="${resPath}css/mypage.css">
</head>
<body>
<div class="mypage-wrap">
  <div class="mypage-title">
    <div class="mypage-user">
      <span>홍길동님, </span>
      <span>마이페이지</span>
    </div>
  </div>
  <div class="content">
    <div class="content-tap">
      <ul>
        <li><a href="">나의 작성글</a></li>
        <li><a href="">회원정보수정</a></li>
      </ul>

    </div>
  </div>
</div>
</body>
</html>
