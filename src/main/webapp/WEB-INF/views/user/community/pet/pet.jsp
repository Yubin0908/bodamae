<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<html>
<head>
  <title>보담 愛</title>
  <link href="${ resPath }css/webSettings.css" rel="stylesheet">
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  <style>
    .content {
      width: 1100px;
      margin: 0 auto;
    }

    .card {
      width: calc(1100px / 4);
      float: left;
      margin: 5px;
    }

    .card img {
      width: 100%;
      height: 200px;
    }
  </style>
</head>
<body>
	<!--  navar -->
	<jsp:include page="/WEB-INF/views/user/common/navar.jsp" />


	<div class="content">
<%--		<div class="search-group">--%>
<%--			<!-- searchForm -->--%>
<%--			<form class="category-search-box" action="${ context }">--%>
<%--				<label class="cmp-category" for="column"></label><label for="search"></label>--%>
<%--				<input type="search" name="search" id="search">--%>
<%--        <input type="submit" id="submit" value="검색">--%>
<%--			</form>--%>

<%--			<button class="btn-new-pet" href="#">등록</button>--%>
<%--			</a>--%>
<%--		</div>--%>
<%--		<hr />--%>

		<div class="content">
      <c:forEach var="pet" items="${pets}">
        <div class="card">
          <img src="${pet.pet_img}" class="card-img-top" alt="${pet.pet_name}">
          <div class="card-body">
            <a class="cardA" href="${ context }community/pets/detail/${pet.pet_no}">
              <h5 class="card-title">${pet.pet_name}</h5>
              <p class="card-text">${pet.user_id} | <fmt:formatDate value="${pet.pet_date}" pattern="YYYY-MM-dd hh분 mm초" /></p>
            </a>
          </div>
        </div>
      </c:forEach>
		</div>
	</div>
	<!--  footer -->
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</body>

</html>