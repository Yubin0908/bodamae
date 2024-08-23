<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<html>
<head>
  <title>보담 愛</title>
  <link rel="stylesheet" href="${resPath}css/webSettings.css">
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <style>
    a {
      text-decoration: none;
      color: #000;
    }

    .content {
      width: 1200px;
      margin: 0 auto;
    }

    .mypage-title {
      height: 300px;
      background: #dddddd url("${resPath}img/title-bg.jpg") 50% 50%;
    }

    .mypage-title > p {
      color: whitesmoke;
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
        <span class="userName fs-4">${sessionScope.user.user_name == null ? "이름":sessionScope.user.user_name}님, </span>
        <span class="title">마이페이지</span>
      </p>
    </div>
    <br>
    <div class="content-tab">
      <div class="list-table">
        <ul>
          <li class="list-table-list"><a href="${context}mypage/list">나의 작성글</a></li>
          <li class="list-table-list"><a href="${context}mypage/pwCheck">회원정보수정</a></li>
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
        <form>
          <input type="hidden" name="user_id" value="admin001">
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

    const submit_btn = document.querySelector('input[type="submit"]');

    submit_btn.addEventListener('click', e => {
      const user_id = document.querySelector('input[type=hidden]').value;
      const user_password = document.querySelector('input[type="password"]').value;

      if (!user_password) {
        e.preventDefault();
        alert('비밀번호를 입력하세요');
      } else {
        e.preventDefault();
        $.ajax({
          url: '${context}mypage/userPasswordCheck',
          method: 'post',
          data: {
            user_id: user_id,
            user_password: user_password
          },
          dataType: 'html',
          success: function (data, status) {
            if (data === 'pass') {
              location.href = '${context}mypage/userPasswordModify';
            }
          },
          error: function () {
            alert('잘못된 비밀번호 입니다. 다시 확인하신 후 입력바랍니다.');
          }
        });
      }


    });
  </script>
</body>
</html>
