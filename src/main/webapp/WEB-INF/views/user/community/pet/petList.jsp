<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<html>
<head>

<title>보담 愛</title>
<link href="${ resPath }css/webSettings.css" rel="stylesheet">
<link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
<script src="${ resPath }js/bootstrap.bundle.min.js"></script>
<link href="${ resPath }css/petlogout.css" rel="stylesheet">
</head>
<body>
	<!--  navar -->
	<jsp:include page="/WEB-INF/views/user/common/navar.jsp" />


	<div class="content">
		<div class="search-group">
			<!-- searchForm -->
			<form class="category-search-box" action="${ context }">
				<label class="cmp-category" for="column"></label><label for="search"></label>
				<input type="search" name="search" id="search">
        <input type="submit" id="submit" value="검색">
			</form>

			<button class="btn-new-pet" href="#">등록</button>
			</a>
		</div>
		<hr />

		<div>
			<div class="card">
				<img src="..." class="card-img-top" alt="...">
				<div class="card-body">
					<a class="cardA" href="${ context }petcontent">
						<h5 class="card-title">반려동물 이름</h5>
						<p class="card-text">작성자 아이디 | 등록 날짜</p>
					</a>
				</div>
			</div>
		</div>

		<div class="pagenavar">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>

	</div>


	<!--  footer -->
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</body>

</html>