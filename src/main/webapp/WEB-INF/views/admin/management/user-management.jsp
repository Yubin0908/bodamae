<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<!DOCTYPE html>
<html>
<head>
  <title>보담 愛 | 회원 상세</title>
  
  <link href="${ resPath }css/webSettings.css" rel="stylesheet">
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <link href="${ resPath }css/admin-header.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  <style>
    .content {
      width: 1000px;
      margin: 0 auto;
    }

    .title {
      margin-bottom: 10px;
    }

    .title > span {
      font-weight: bold;
      font-size: 24px;
    }

    .user-info {
      width: 600px;
      margin: 0 auto;
      height: 558px;
      border: 1px solid gray;
      border-radius: 15px;
    }

    .user-info > p:nth-of-type(1) {
      font-weight: bold;
      font-size: 1.5em;
      text-align: center;
      margin-top: 5px;
      margin-bottom: 20px;
    }

    .user-data {
      text-align: left;
      font-weight: 500;
      font-size: 18px;
      line-height: 55px;
      margin-left: 150px;
    }

    .button-group {
      float: right;
      margin-right: 300px;
      margin-top: 10px;
    }

    .button-group button {
      padding: 10px 40px;
      border: none;
      border-radius: 15px;
      font-weight: bold;
    }

  </style>
</head>

<body>
  <div id="container">
    <!-- nav -->
    <jsp:include page="/WEB-INF/views/admin/common/navar.jsp" />

    <!-- 로고 -->
    <div class="main-content">
      <div class="admin-logo">
        <img class="admin-logo-img" alt="관리자로고이미지"
          src="${resPath}img/logo_admin.png">
      </div>

      <!-- 컨텐츠 -->
      <div class="content">
        <div class="title">
          <span>회원 관리 > 회원 상세</span>
        </div>

        <div class="user-info">
          <p>${user.user_name} 님 상세 정보</p>
          <br>
          <div class="user-data">
            <p>사용자 아이디 : ${user.user_id}</p>
            <p>사용자 이름 : ${user.user_name}</p>
            <p>사용자 성별 : ${user.user_gender == 'M' ? '남자':'여자'}</p>
            <p>사용자 생년월일 : ${user.user_birthdate}</p>
            <p>사용자 전화번호 : ${user.user_tel}</p>
            <p>사용자 가입일자 : ${user.user_regist_date}</p>
            <p>관리자 여부 : ${user.admin_check == 1 ? "관리자":"일반"}</p>
          </div>
        </div>
      </div>
      <div class="button-group">
        <button type="button" onclick="history.back()">뒤로가기</button>
        <button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">회원삭제</button>
      </div>
      <!-- Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-body">
              해당 회원을 삭제하시겠습니까?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
              <button type="button" class="btn btn-primary" onclick="location.href='${context}admin/userDrop/${user.user_id}'">삭제</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>