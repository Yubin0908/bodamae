<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />
<html>
<head>
  <meta charset="UTF-8">
  <title>보담 愛 | 관리자 로그인</title>

  <link href="${ resPath }css/webSettings.css" rel="stylesheet">
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  <style>
    .content {
      /*position: relative;*/
      margin: 100px auto;
    }

    .out_wrap {
      width: 500px;
      height: 500px;
      background-color: #599AD2;
      display: flex;
      justify-content: center;
      align-items: center;
      border-radius: 15px;
    }

    .inner_wrap {
      width: 380px;
      height: 300px;
      margin: 50% auto;
      background-color: #fff;
      text-align: center;
      border-radius: 15px
    }

    .login_fail {
      color: #f00;
    }

    .login_font {
      font-size: 36px;
      text-align: center;
      margin: 35px auto 20px;
    }

    .txt_box {
      text-align: center;
    }

    .txt_box input{
      width: 280px;
      height: 35px;
      margin: 5px auto 5px;
      border-radius: 40px;
      text-align: left;
      padding-left: 15px;
      border: 1px solid black;
    }

    .txt_box input::placeholder {
      color: gray;
      font-size: 14px;
      font-weight: bold;
    }

    .btn_box {
      text-align: center;
      margin: 20px auto 0;
    }

    .btn_sign_up {
      width: 130px;
      padding: 10px;
      color: whitesmoke;
      font-size: 19px;
      font-weight: bold;
      border: none;
      background-color: #76bffd;
      border-radius: 10px;
      text-align: center;
    }

    .btn_login {
      width: 130px;
      padding: 10px;
      color: whitesmoke;
      font-size: 19px;
      font-weight: bold;
      border: none;
      background-color: #76bffd;
      border-radius: 10px;
      margin-left: 19px;
    }
    
    input {
    }
  </style>
</head>
<body>
  <jsp:include page="/WEB-INF/views/user/common/logo.jsp" />
  <div class="content">
    <div class="out_wrap">
      <div class="inner_wrap">
        <div class="login_font">로그인</div>
        <div class="form_wrap">
          <form action="${context}admin/login" method="post">
            <div class="txt_box" id="txt_box">
              <div><input class="user_id" name="user_id" type="text" id="user_id" placeholder="ID" minlength="5" maxlength="15" autofocus ></div>
              <div><input class="user_password" name="user_password" id="user_password" type="password" placeholder="PW" minlength="8" maxlength="20"></div>
            </div>
            <div class="btn_box">
              <button class="btn_sign_up">sign-up</button>
              <input class="btn_login " type="submit" value="login">
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>