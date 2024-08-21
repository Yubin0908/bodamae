<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<html>
<head>
  <title>보담 愛</title>
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${resPath}css/webSettings.css">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <style>
    .content {
      width: 1200px;
      margin: 0 auto;
    }

    .mypage-title {
      background-color: #dddddd;
      height: 300px;
    }

    .mypage-title > p {
      line-height: 300px;
      letter-spacing: 2px;
    }

    .content-tab {
      width: 1100px;
      margin: 0 auto;
    }

    .list-table {
      width: 100%;
    }

    .list-table > ul:after {
      content: "";
      clear: both;
    }

    .list-table > ul {
      text-align: center;
    }

    .list-table > ul > li {
      width: 50%;
      float: left;
      padding: 15px 100px;
      border: 1px solid lightgray;
      background-color: #eee;
    }

    .list-table > ul > li > a {
      font-weight: bold;
      font-size: 20px;
      background-color: #fff;
      padding: 3px 10px 3px 40px;
      border-radius: 15px;
    }

    .list-table > ul > li:nth-of-type(1) > a {
      background: url("${resPath}img/icon-edit.png") no-repeat 10px white;
      background-size: 20px;
    }

    .list-table > ul > li:nth-of-type(2) > a {
      background: url("${resPath}img/user-icon.png") no-repeat 10px white;
      background-size: 20px;
    }

    .form_wrap {
      background-color: #dddddd;
      width: 1100px;
      height: 450px;
      margin: 0 auto 40px auto;
    }

    .notion-msg {
      text-align: center;
      margin-top: 90px;
    }

    .notion-msg > p {
      font-weight: bold;
      font-size: 1.2em;
      line-height: 50px;
    }

    .form {
      text-align: center;
      margin-top: 50px;
    }

    .form input {
      padding: 10px 55px;
      border: none;
      border-radius: 12px;
    }

    .form input[type="submit"] {
      margin-top: 60px;
    }
  </style>
</head>
<body>
  <%-- header --%>
  <jsp:include page="../common/navar.jsp" />

  <%-- content --%>
  <div class="content my-5">
    <div class="mypage-title w-100">
      <p class="fw-bold fs-2 text-center">
        <span class="userName fs-4">홍길동님, </span>
        <span class="title">마이페이지</span>
      </p>
    </div>
    <br>
    <div class="content-tab">
      <div class="list-table">
        <ul>
          <li class="list-table-list"><a href="${context}mypage/list">나의 작성글</a></li>
          <li class="list-table-list"><a href="${context}mypage/emailCheck">회원정보수정</a></li>
        </ul>
      </div>
    </div>


  </div>
    <div class="form_wrap">
      <div class="notion-msg">
        <p>개인정보보호를 위해 본인확인은 필수입니다.</p>
        <p>가입된 계정의 비밀번호를 입력하세요.</p>
      </div>
      <div class="form">
        <form action="${context}mypage/emailCheck" method="post">
          <input type="password" name="user_password" placeholder="비밀번호를 입력하세요...">
          <br>
          <input type="submit" value="확 인">
        </form>
      </div>
    </div>
  <jsp:include page="../common/footer.jsp" />
  <script>
    const li = document.getElementsByClassName("list-table-list");

    li[1].style.backgroundColor = "#fff";
    li[1].firstChild.style.backgroundColor = "#87CEEB";
    li[1].firstChild.style.color = "#fff";

    function handler(e) {
      const target = e.target;

      if (target.textContent.includes("회원정보수정")) {
        li[1].style.backgroundColor = "#fff";
        li[1].firstChild.style.backgroundColor = "#87CEEB";
        li[1].firstChild.style.color = "#fff";
        li[0].style.backgroundColor = "#dddddd";
        li[0].firstChild.style.backgroundColor = "#fff";
        li[0].firstChild.style.color = "#000";
      }
    }

    for (let item of li) {
      item.addEventListener('click', handler);
    }
  </script>
</body>
</html>
