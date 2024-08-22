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
      background: #dddddd url("${resPath}img/title-bg.jpg") 50% 50%;
      height: 300px;
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
      margin-top: 30px;
    }

    .notion-msg > p {
      font-weight: bold;
      font-size: 1.2em;
      line-height: 50px;
    }

    .notion-msg > p:nth-of-type(1) {
      font-size: 1.7em;
    }

    .form {
      text-align: center;
      margin-top: 30px;
    }

    .form input {
      display: block;
      margin: 10px auto;
      padding: 10px 55px;
      border: none;
      border-radius: 12px;
    }

    .form input[type="submit"] {
      margin-top: 10px;
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
          <li class="list-table-list"><a href="${context}mypage/emailCheck">회원정보수정</a></li>
        </ul>
      </div>
    </div>


  </div>
    <div class="form_wrap">
      <div class="notion-msg">
        <p>비밀번호 변경</p>
        <p>변경할 비밀번호를 입력하세요.</p>
      </div>
      <div class="form">
        <form action="${context}mypage/passwordModify" method="post">
          <input type="hidden" name="user_id" value="admin001">
          <input type="password" name="current_pw" placeholder="기존 비밀번호">
          <input type="password" name="new_pw" placeholder="변경할 비밀번호">
          <input type="password" name="new_pw_chk" placeholder="변경할 비밀번호 확인">
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
      e.preventDefault();
      const new_pw = document.querySelector('input[name="new_pw"]').value;
      const new_pw_chk = document.querySelector('input[name="new_pw_chk"]').value;
      const current_pw = document.querySelector('input[name="current_pw"]').value;
      const user_id = document.querySelector('input[type="hidden"]').value;

      if (current_pw !== null && new_pw !== null && new_pw_chk !== null && new_pw === new_pw_chk) {
        $.ajax({
          url: '${context}mypage/userPasswordCheck',
          method: 'post',
          data: {
            user_id: user_id,
            user_password: current_pw
          },
          dataType: 'html',
          success: function (data, status) {
            if (data === 'pass') {
              alert('비밀번호 변경이 완료되었습니다. 다시 로그인 바랍니다.');
              location.href = '${context}mypage/list';
            }
          },
          error: function () {
            alert('잘못된 비밀번호 입니다. 다시 확인하신 후 입력바랍니다.');
          }
        });
      } else {
        alert('비밀번호가 입력되지 않았거나, 변경할 비밀번호가 일치하지 않습니다. 다시 확인 바랍니다.');
      }
    });
  </script>
</body>
</html>
