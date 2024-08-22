<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<head>
  <style type="text/css">
    .logo-content { margin: 0 auto; text-align: center; }
    .logo { width: 150px; }
  </style>
</head>

<!-- 회원가입 / 로그인에 사용 -->

<div class="logo-content">
  <a class="logoA" href="${ context }">
    <img class="logo" alt="logo" src="${ resPath }img/logo.png"></img>
  </a>
</div>