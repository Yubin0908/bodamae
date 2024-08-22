<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<head>
  <style type="text/css">
<<<<<<< HEAD
    .logo-content { margin: 0 auto; text-align: center; }
=======
    .logo-content { margin: 0 auto; text-align: center; margin-bottom: 100px; }
>>>>>>> 65bc8adc07ac922eaa512404aa7969f64c72a6c2
    .logo { width: 150px; }
  </style>
</head>

<!-- 회원가입 / 로그인에 사용 -->

<div class="logo-content">
  <a class="logoA" href="${ context }">
    <img class="logo" alt="logo" src="${ resPath }img/logo.png"></img>
  </a>
</div>