<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<!DOCTYPE html>
<html>
<head>
  <title>보담 愛 | 관리자 등록/수정</title>
  
  <link href="${ resPath }css/webSettings.css" rel="stylesheet">
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <link href="${ resPath }css/admin-header.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  <style>
    .content {
      width: 1000px;
      margin: 0 auto;
    }

    .content > p {
      display: inline-block;
      font-weight: bold;
    }

    .title {
      margin-bottom: 10px;
    }

    .title > span {
      font-weight: 500;
      font-size: 18px;
    }

    button[type="button"] {
      border: none;
      border-radius: 10px;
      padding: 5px;
      background-color: lightgray;
    }

    .first-wrap, .second-wrap {
      width: 100%;
      border: 1px solid gray;
      border-radius: 15px;
      box-shadow: 5px 5px 3px #dddddd;
      box-sizing: border-box;
      margin-top: 10px;
      height: 450px;
      overflow-y: auto;
    }

    .first-wrap .admin-table, .second-wrap .admin-table {
      width: 100%;
    }
    .search-wrap {
      border: 1px solid gray;
      border-radius: 10px;
      width: 300px;
      height: 50px;
      margin-left: 145px;
      margin-top: -35px;
    }

    .search-wrap select {
      width: 60px;
      padding: 3px 0;
      margin-top: 8px;
      margin-left: 10px;
      margin-bottom: 70px;
      text-align: center;
    }

    .search-wrap input[name="keyword"] {
      width: 160px;
      padding: 3px 0;
      border-radius: 7px;
      border: 1px solid gray
    }

    .search-wrap input[type="submit"] {;
      border-radius: 10px;
      border: 1px solid gray;
      padding: 3px 10px;
    }

    .admin-table {
      width: 1100px;
      margin: 15px auto;
    }

    .admin-table table {
      width: 100% !important;
      text-align: center !important;
    }

    .admin-table table th {
      font-weight: bold !important;
    }

    button[type="reset"] {
      border: none;
      padding: 3px 30px;
      background-color: #BEDAE2;
      border-radius: 10px;
    }

    #left-menu {
      width: 45%;
    }

    #right-menu {
      width: 45%;
      float: right;
      margin-top: -375px;
    }

    .switch {
      margin-top: -395px;
      text-align: center;
    }

    .switch button {
      margin-top: 100px;
      padding: 5px 10px;
      border: none;
      border-radius: 15px;
    }

    .selected {
      background-color: #dddddd;
      font-weight: bold;
    }

    .back {
      padding: 10px 40px;
      border-radius: 15px;
      border: none;
      float: right;
      font-weight: bold;
      margin-top: 10px;
      margin-left: 500px;
    }
  </style>
</head>

<body>
  <c:if test="${failMsg}">
    <script>
      alert('${failMsg}');
    </script>
  </c:if>
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
          <span>관리자 관리 > 관리자 수정</span>
        </div>
        <br>
        <div id="left-menu">
          <p><b>회원 목록</b></p>
          <div class="search-wrap">
            <form action="${context}admin/adminManagement">
              <select name="option">
                <option value="user_id">아이디</option>
                <option value="user_name" selected>이름</option>
              </select>
              <input type="text" name="keyword">
              <input type="submit" value="검색">
            </form>
          </div>
          <div class="first-wrap">
            <div class="admin-table">
              <table class="table">
                <colgroup>
                  <col style="width: 20%">
                  <col style="width: 15%">
                  <col style="width: 25%">
                  <col style="width: 30%;">
                  <col>
                </colgroup>
                <thead>
                  <tr>
                    <th>사용자 ID</th>
                    <th>이 름</th>
                    <th>생년월일</th>
                    <th>가입일자</th>
                  </tr>
                </thead>
                <tbody class="user">
                  <c:forEach var="user" items="${users}">
                    <tr onclick="selectHandler(this, '${user.user_id}')">
                      <td>${user.user_id}</td>
                      <td>${user.user_name}</td>
                      <td>${user.user_birthdate}</td>
                      <td>${user.user_regist_date}</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="switch">
          <button data-bs-toggle="modal" data-bs-target="#regist-modal">등록 ></button>
          <br>
          <button data-bs-toggle="modal" data-bs-target="#remove-modal">< 삭제</button>
        </div>
        <div id="right-menu">
          <p><b>관리자 목록</b></p>
          <div class="search-wrap">
            <form action="${context}admin/adminManagement">
              <input type="hidden" name="admin" value="y">
              <select name="option">
                <option value="a.admin_no">관리자 번호</option>
                <option value="user_id">아이디</option>
                <option value="user_name" selected>이름</option>
              </select>
              <input type="text" name="keyword">
              <input type="submit" value="검색">
            </form>
          </div>
          <div class="second-wrap">
            <div class="admin-table table-responsive" style="overflow-y: auto">
              <table class="table">
                <colgroup>
                  <col style="width: 20%">
                  <col style="width: 15%">
                  <col style="width: 25%">
                  <col style="width: 30%;">
                  <col>
                </colgroup>
                <thead>
                  <tr>
                    <th>사용자 ID</th>
                    <th>이 름</th>
                    <th>생년월일</th>
                    <th>가입일자</th>
                  </tr>
                </thead>
                <tbody class="admins">
                  <c:forEach var="admin" items="${admins}">
                    <tr onclick="selectAdminHandler(this, '${admin.user_id}')">
                      <td>${admin.user_id}</td>
                      <td>${admin.user_name}</td>
                      <td>${admin.user_birthdate}</td>
                      <td>${admin.user_regist_date}</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <button class="back" onclick="history.back()">뒤로가기</button>
        <%-- 등록 시, modal --%>
        <div class="modal fade" id="regist-modal" tabindex="-1" aria-labelledby="regist-modal-label" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-body">
                해당 회원을 관리자로 등록하시겠습니까?
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" onclick="clickEventRegist()">등록</button>
              </div>
            </div>
          </div>
        </div>
        <%-- 삭제 시, modal --%>
        <div class="modal fade" id="remove-modal" tabindex="-1" aria-labelledby="remove-modal-label" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-body">
                해당 관리자를 삭제하시겠습니까?
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" onclick="clickEventRemove()">삭제</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
    let targetUser;

    function selectHandler(param, user_id) {
      const tr = document.querySelectorAll('.user > tr');
      const isSelected = param.classList.contains('selected');
      tr.forEach(t => t.classList.remove('selected'));

      if (!isSelected) {
        param.classList.add('selected');
        targetUser = user_id;
      } else {
        targetUser = null;
      }
    }

    function clickEventRegist() {
      if (targetUser) {
        location.href = '${context}admin/updateUser/' + targetUser;
      }
    }

    function selectAdminHandler(param, user_id) {
      const tr = document.querySelectorAll('.admins > tr');
      const isSelected = param.classList.contains('selected');
      tr.forEach(t => t.classList.remove('selected'));

      if (!isSelected) {
        param.classList.add('selected');
        targetUser = user_id;
      } else {
        targetUser = null;
      }
    }

    function clickEventRemove() {
      if (targetUser) {
        location.href = '${context}admin/updateAdmin/' + targetUser;
      }
    }

  </script>
</body>
</html>