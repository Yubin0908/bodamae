<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<html>
<head>
  <title>보담 愛</title>

  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  <style type="text/css">
    /* input x자 표시 없애기 크롬(https://wazacs.tistory.com/33) */
    input::-webkit-search-decoration,
    input::-webkit-search-cancel-button,
    input::-webkit-search-results-button,
    input::-webkit-search-results-decoration { display:none; }

    .container-fluid { width: 1200px; height: 100px; }
    .user_logo { width: 120px; }

    .navbar-nav { margin-right: auto; }
    .navbar-userInfo { margin-left: auto; }
    .searchvar { width: 400px; height: 70px; border-radius: 40px; }
    .navbar-searchvarForm { margin: 0; line-height: 100px; }

    .mypage { width: 45px; margin: auto; }
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
      <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link" href="place" aria-current="page">장소</a></li>

        <li class="nav-item"><a class="nav-link" href="theme" aria-current="page">테마</a></li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="/" role="button" data-bs-toggle="dropdown"
             aria-expanded="false">커뮤니티</a>

          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="notice">공지사항</a></li>
            <li><a class="dropdown-item" href="pets">반려동물 자랑</a></li>
            <li><a class="dropdown-item" href="free_board">자유게시판</a></li>
          </ul>
      </ul>

      <form class="show navbar-searchvarForm" role="search">
        <input class="searchvar form-control" type="search" placeholder="Search" aria-label="Search">
      </form>

      <!-- 로그인 / 회원가입 -->
      <!-- <ul class="navbar-nav navbar-userInfo">
        <li class="nav-item"><a class="nav-link" href="login">로그인</a></li>
        <li class="nav-item"><a class="nav-link" href="register">회원가입</a></li>
      </ul> -->
      <!-- 내 계정 / 로그아웃 -->
      <ul class="navbar-nav navbar-userInfo">
        <li class="nav-item"><a class="nav-link mypage-a" href="mypage"><img class="mypage" alt="" src="${ resPath }img/user-icon.png"></a></li>
        <li class="nav-item"><a class="nav-link logout" href="logout">로그아웃</a></li>
      </ul>

    </div>
  </div>
</nav>
</html>
