<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<head>
<style type="text/css">
  /* input x자 표시 없애기 크롬(https://wazacs.tistory.com/33) */
  input::-webkit-search-decoration,
  input::-webkit-search-cancel-button,
  input::-webkit-search-results-button,
  input::-webkit-search-results-decoration { display:none; }
    
  .container-fluid { width: 1200px; height: 100px; }
  .user_logo { width: 120px; }
  
  .navbar-menu { margin-right: auto; }
  .navbar-userInfo { margin-left: auto; }
  .searchvar { width: 400px; height: 70px; border-radius: 40px; }
  .navbar-searchvarForm { margin: 0; line-height: 100px; } 
  
  .mypage { width: 40px; margin: auto; }
  .nav-item { font-size: 22px; font-weight: bold; line-height: 70px; }
  .mypage-a { display: inline-block; }
</style>
</head>

<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-logo" href="${ context }"> 
     <img class="user_logo" alt="user_logo" src="${ resPath }img/logo.png"></img>
    </a>
     
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
      data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
      aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav navbar-menu">
        <li class="nav-item"><a class="nav-link" href="${ context }place" aria-current="page">장소</a></li>
        <li class="nav-item"><a class="nav-link" href="${ context }notice" aria-current="page">공지사항</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="/" role="button" data-bs-toggle="dropdown" 
          aria-expanded="false">커뮤니티</a>
          
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${ context }community/pets">반려동물 자랑</a></li>
            <li><a class="dropdown-item" href="${ context }community/board">자유게시판</a></li>
          </ul>
      </ul>
      
      <form action="${ context }search" method="get">
        <label for="search"></label>
        <input class="searchvar form-control" name="place" type="search" id="place" placeholder="장소를 검색해주세요.">
      </form>
      
      <!-- 로그인 / 회원가입 -->
      <c:if test="${user == null}">
        <ul class="navbar-nav navbar-userInfo">
          <li class="nav-item"><a class="nav-link" href="${context}user/login">로그인</a></li>
          <li class="nav-item"><a class="nav-link" href="${context}user/checkRegister">회원가입</a></li>
        </ul>
      </c:if>
      <!-- 내 계정 / 로그아웃 -->
      <c:if test="${user != null}">
        <ul class="navbar-nav navbar-userInfo">
          <li class="nav-item">
            <a class="nav-link mypage-a" href="${context}mypage/list">
              <span class="userName fs-4">${sessionScope.user.user_name == null ? "이름":sessionScope.user.user_name}님</span>
            </a>
          </li>
          <li class="nav-item"><a class="nav-link logout" href="${context}user/logout">로그아웃</a></li>
        </ul>
      </c:if>
    </div>
  </div>
</nav>
