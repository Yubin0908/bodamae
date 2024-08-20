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
  <link rel="stylesheet" href="${resPath}css/admin-header.css">
</head>
<body>
<div class="header-wrap">
  <div class="admin-info">
    <div class="thumbnail">
      <img src="${resPath}img/user-icon.png" style="width: 40px; height: 40px; position: relative; left: 15px; top: 10px" alt="">
    </div>
    <div class="admin">
      <p>홍길동 관리자님</p>
    </div>
  </div>
  <div>
    <ul>
      <li><a href="">사이트로 이동</a></li>
      <li><a href="">회원 관리</a></li>
      <li><a href="">관리자 관리</a></li>
      <li><a href="">공지사항 관리</a></li>
      <li><a href="">테마 관리</a></li>
      <li><a href="">업체 관리</a></li>
    </ul>
  </div>
  <div>
    <a href="" class="logout">로그아웃</a>
  </div>
</div>
</body>
</html>
