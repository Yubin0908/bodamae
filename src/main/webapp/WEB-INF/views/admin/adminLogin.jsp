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
    margin: 0px auto;
  }

  .out_wrap {
    width: 500px;
    height: 500px;
    background-color: 599AD2;
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
    color: balck;
    font-size: 19px;
    font-weight: bold;
  } 
   
   .btn_box {
      text-align: center;
      margin: 15px auto 0px;
   }
   
   .btn_sign_up {
      width: 130px;
      height: 35px;
      color: black;
      font-size: 19px;
      font-weight: bold;
      line-height: 29px;
      border: none;
      background-color: #76bffd;
      border-radius: 20px;
   }
   
   .btn_login {
      width: 130px;
      height: 35px;
      border: 1px solid black;
      color: black;
      font-size: 19px;
      font-weight: bold;
      line-height: 29px;
      border: none;  
      background-color: #76bffd;
      border-radius: 20px;
   }
  
</style>
</head>
<body>
  <jsp:include page="/WEB-INF/views/user/common/logo.jsp" />
  <div class="content">
    <div class="out_wrap">
      <div class="inner_wrap">
        <div class="login_font">관리자 로그인</div>
        <div class="form_wrap">
          <form action="${context}admin/adminList" method="post">
            <div class="txt_box" id="txt_box">
              <div><input class="user_id" name="user_id" type="text" id="user_id" placeholder="ID" minlength="5" maxlength="15"></div>
              <div><input class="user_ppassword" name="user_password" id="user_password" type="password" placeholder="PW" minlength="8" maxlength="20"></div>
            </div>
            <div class="btn_box">
              <button class="btn_sign_up" type="button">sign-up</button>
              <input class="btn_login " type="submit" value="login">
            </div>
          </form>
          <div class="login_fail" id="login_fail_msg">아이디 및 비밀번호가 틀렸습니다.</div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>