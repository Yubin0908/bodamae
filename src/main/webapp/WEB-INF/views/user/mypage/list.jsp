<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<html>
<head>
  <title>보담 愛</title>
  <link rel="stylesheet" href="${ resPath }css/webSettings.css">
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
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

    .table {
      width: 1100px;
      margin: 20px auto;
      text-align: right;
      border-collapse: collapse;
    }

    .table th, .table td {
      border: 1px solid lightgray;
      padding: 8px;
      text-align: center;
    }

    .table th {
      border-top: 2px solid gray;
      border-bottom: 2px solid gray;
      background-color: #f9f9f9;
    }

    .table > thead {
      border-top: 2px solid gray;
    }

    .pagination {
      display: inline-block;
      width: 1200px;
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
    <table class="table table-hover table-bordered results">
      <thead>
        <tr>
          <th>글번호</th>
          <th>제 목</th>
          <th>조회수</th>
          <th>작성일자</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="freeboard" items="${freeBoards}">
          <tr>
            <td>${freeboard.board_no}</td>
            <td><a href="#">${freeboard.board_title}</a></td>
            <td>${freeboard.board_hits}</td>
            <td><fmt:formatDate value="${freeboard.board_date}" pattern="YYYY-MM-dd hh분 mm초" /> </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <div class="pagination">
      <c:if test="${paging.startPage > paging.blockSize}">
        <a href="${context}mypage/list?page=${paging.startPage - 1}">
          <img class="arrow" src="${resPath}img/left-arrow-icon.png" alt="">
        </a>
      </c:if>
      <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
        <c:if test="${paging.currentPage == i}">
          <b>${i}</b>
        </c:if>
        <c:if test="${paging.currentPage != i}">
          <a href="${context}mypage/list?page=${i}">${i}</a>
        </c:if>
      </c:forEach>
      <c:if test="${paging.endPage < paging.totalPages}">
        <a href="${context}mypage/list?page=${paging.startPage + 10}">
          <img class="arrow" src="${resPath}img/right-arrow-icon.png" alt="">
        </a>
      </c:if>
    </div>
  </div>
  <jsp:include page="../common/footer.jsp" />
  <script>
    const li = document.getElementsByClassName("list-table-list");

    li[0].style.backgroundColor = "#fff";
    li[0].firstChild.style.backgroundColor = "#87CEEB";
    li[0].firstChild.style.color = "#fff";

    function handler(e) {
      const target = e.target;

      if (target.textContent.includes("나의 작성글")) {
        li[1].style.backgroundColor = "#fff";
        li[1].firstChild.style.backgroundColor = "#87CEEB";
        li[1].firstChild.style.color = "#fff";
        li[0].style.backgroundColor = "#dddddd";
        li[0].firstChild.style.backgroundColor = "#fff";
        li[0].firstChild.style.color = "#000";
      } else {
        li[0].style.backgroundColor = "#fff";
        li[0].firstChild.style.backgroundColor = "#87CEEB";
        li[0].firstChild.style.color = "#fff";
      }
    }

    for (let item of li) {
      item.addEventListener('click', handler);
    }
  </script>
</body>
</html>
