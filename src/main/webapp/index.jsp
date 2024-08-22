<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />
<html>
<head>
  <meta charset="UTF-8">
  <title>보담 愛 | 로그인</title>

  <link href="${ resPath }css/webSettings.css" rel="stylesheet">
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  <style>
    .content {
      position: relative;
      margin: 0 auto;
    }

    .to_user {
      width: 250;
      height: 55px;
      border: 2px solid black;
    }

    .to_admin {
      width: 250;
      height: 55px;
      border: 2px solid black;
      cursor: pointer;
    }

    .out_wrap {
      width: 500px;
      height: 500px;
      border: 2px solid black;
    }

    .inner_wrap {
      width: 380px;
      height: 300px;
      border: 2px solid black;
      margin: 0 auto;
    }


    .login_font {
      text-align: center;
    }

    .txt_box {
      text-align: center;
    }

    .login_fail_msg {
      color: red;
    }

  </style>
</head>
<body>
<<<<<<< HEAD
<h1>test</h1>
</body>
</html>
=======
<div class="content">
  <div class="out_wrap">
    <div class="inner_wrap">
      <div class="login_font">로그인</div>
      <div class="form_wrap">
        <form action="${context}user/login" method="post">
          <div class="txt_box" id="txt_box">
            <div><input class="user_id" name="user_id" type="text" id="user_id" placeholder="ID" minlength="5" maxlength="15"></div>
            <div><input class="user_ppassword" name="user_password" id="user_password" type="password" placeholder="PW" minlength="8" maxlength="20"></div>
          </div>
          <div class="btn">
            <button class="btn_sign_up" type="button">sign-up</button>
            <input class="btn_login" type="submit" value="login">
          </div>
        </form>
        <div class="login_fail_msg" id="login_fail_msg">아이디 및 비밀번호가 틀렸습니다.</div>
      </div>
    </div>
  </div>
</div>

<script>

  // const loginBtn = document.getElementsByClassName("btn_login");
  const loginBtn = document.querySelector(".btn_login");
  var failMsg = document.getElementById("login_fail_msg");

  failMsg.style.visibility = "hidden";

  loginBtn.addEventListener('click', event => {
    const userId = document.getElementById("user_id")
    const userPw = document.getElementById("user_password");

    if(loginBtn == null) {
      event.preventDefault();
      failMsg.style.visibility = "visible";
    }

  });


</script>

</body>
</html>
>>>>>>> 65bc8adc07ac922eaa512404aa7969f64c72a6c2
