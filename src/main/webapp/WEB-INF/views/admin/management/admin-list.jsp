<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<!DOCTYPE html>
<html>
<head>
  <title>보담 愛 | 관리자 조회</title>
  
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
      font-weight: 500;
      font-size: 18px;
    }

    button[type="button"] {
      border: none;
      border-radius: 10px;
      padding: 5px;
      background-color: lightgray;
    }

    .search-wrap {
      border: 1px solid gray;
      border-radius: 10px;
      width: 400px;
      height: 50px;
      display: inline-block;
      float: right;
    }

    .search-wrap select {
      padding: 3px 0;
      margin-top: 8px;
      margin-left: 10px;
      text-align: center;
    }

    .search-wrap input[name="keyword"] {
      padding: 3px 0;
      border-radius: 7px;
      border: 1px solid gray
    }

    .search-wrap input[type="submit"] {
      border-radius: 10px;
      border: 1px solid gray;
      padding: 3px 15px;
    }

    .admin-table {
      width: 1000px;
      margin: 15px auto;
    }

    .admin-table table {
      width: 100%;
      text-align: center;
    }

    .admin-table table th {
      font-weight: bold;
    }

    button[type="reset"] {
      border: none;
      padding: 3px 30px;
      background-color: #BEDAE2;
      border-radius: 10px;
    }

    .pagination {
      display: inline-block;
      width: 100%;
      text-align: center;
    }

    .pagination b {
      font-weight: bold;
    }

    .arrow {
      width: 20px;
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
          <span>관리자 관리</span>
        </div>
        <button type="button" onclick="location.href='${context}admin/adminManagement'">관리자 등록 / 수정</button>
        <div class="search-wrap">
          <form action="${context}admin/adminList">
            <select name="option">
              <option value="a.admin_no">관리자 번호</option>
              <option value="user_id">아이디</option>
              <option value="user_name" selected>이름</option>
            </select>
            <input type="text" name="keyword">
            <input type="submit" value="검색">
          </form>
        </div>
        <div class="admin-table">
          <table class="table">
            <colgroup>
              <col style="width: 15%">
              <col style="width: 25%">
              <col style="width: 25%">
              <col style="width: 20%;">
              <col>
            </colgroup>
            <thead>
              <tr>
                <th>관리자 번호</th>
                <th>관리자 이름</th>
                <th>관리자 ID</th>
                <th>등록 날짜</th>
                <th>상태</th>
              </tr>
            </thead>
            <tbody>
              <c:if test="${admins.size() == 0}">
                <tr style="font-weight: bold; font-size: 18px;">
                  <td colspan="5">조회 결과가 존재하지 않습니다. :)</td>
                </tr>
              </c:if>
              <c:forEach var="admin" items="${admins}">
                <tr>
                  <td>${admin.admin_no}</td>
                  <td>${admin.user_name}</td>
                  <td>${admin.user_id}</td>
                  <td><fmt:formatDate value="${admin.admin_date}" pattern="YYYY-MM-dd" /> </td>
                  <td><button type="reset" onclick="location.href='${context}admin/adminManagement'">수정</button></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <div class="pagination">
            <c:if test="${paging.startPage > paging.blockSize}">
              <a href="${context}admin/adminList?page=${paging.startPage - 1}">
                <img class="arrow" src="${resPath}img/left-arrow-icon.png" alt="">
              </a>
            </c:if>
            <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
              <c:if test="${paging.currentPage == i}">
                <b>${i}</b>
              </c:if>
              <c:if test="${paging.currentPage != i}">
                <a href="${context}admin/adminList?page=${i}">${i}</a>
              </c:if>
            </c:forEach>
            <c:if test="${paging.endPage < paging.totalPages}">
              <a href="${context}admin/adminList?page=${paging.startPage + 10}">
                <img class="arrow" src="${resPath}img/right-arrow-icon.png" alt="">
              </a>
            </c:if>
          </div>
        </div>
      </div>

    </div>
  </div>

</body>
</html>