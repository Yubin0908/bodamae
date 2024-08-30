<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<html>
<head>
  <title>보담 愛 | 반려동물자랑</title>
  <link href="${ resPath }css/webSettings.css" rel="stylesheet">
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  <style>
    .content {
      width: 1100px;
      margin: 0 auto;
    }

    .card {
      width: calc(95% / 4);
      float: left;
      margin: 5px;
    }

    .card img {
      width: 100%;
      height: 200px;
    }

    a {
      text-decoration: none;
      color: black;
    }

    .card-text {
      color: gray;
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

    #community_text p {
      margin-top: 50px;
      margin-bottom: 40px;
      font-size: 1.75rem;
      font-weight: bold;
      text-align: center;
    }

    .btn-new-pet {
      border: none;
      border-radius: 10px;
      padding: 15px 50px;
      background-color: whitesmoke;
      font-weight: bold;
    }

    .btn-new-pet:hover {
      background-color: #dddddd;
    }
  </style>
</head>
<body>
	<!--  navar -->
	<jsp:include page="/WEB-INF/views/user/common/navar.jsp" />


	<div class="content">
		<div class="search-group">
      <div id="community_text"><p>커뮤니티 > 반려동물 자랑</p></div>
			<button class="btn-new-pet" onclick="location.href='${context}community/pets/write'">등  록</button>
		</div>
		<hr />

		<div class="content">
      <c:forEach var="pet" items="${pets}">
        <div class="card">
          <img src="${pet.pet_img}" class="card-img-top" alt="${pet.pet_name}">
          <div class="card-body">
            <a class="cardA" href="${ context }community/pets/${pet.pet_no}">
              <h5 class="card-title">${pet.pet_name}</h5>
              <p class="card-text">작성자: ${pet.user_id}<br>등록일: <fmt:formatDate value="${pet.pet_date}" pattern="YYYY-MM-dd HH시 mm분" /></p>
            </a>
          </div>
        </div>
      </c:forEach>

      <div class="pagination">
        <c:if test="${paging.startPage > paging.blockSize}">
          <a href="${context}community/pets?page=${paging.startPage - 1}">
            <img class="arrow" src="${resPath}img/left-arrow-icon.png" alt="">
          </a>
        </c:if>
        <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
          <c:if test="${paging.currentPage == i}">
            <b>${i}</b>
          </c:if>
          <c:if test="${paging.currentPage != i}">
            <a href="${context}community/pets?page=${i}">${i}</a>
          </c:if>
        </c:forEach>
        <c:if test="${paging.endPage < paging.totalPages}">
          <a href="${context}community/pets?page=${paging.startPage + 10}">
            <img class="arrow" src="${resPath}img/right-arrow-icon.png" alt="">
          </a>
        </c:if>
      </div>
		</div>
	</div>
  <br>
  <br>
	<!--  footer -->
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</body>

</html>