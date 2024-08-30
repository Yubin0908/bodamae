<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />
<html>

<head>
<title>보담 愛 | 자유게시판</title>
<link href="${ resPath }css/webSettings.css" rel="stylesheet">
<link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
<script src="${ resPath }js/bootstrap.bundle.min.js"></script>


<style type="text/css">
	/* input x자 표시 없애기 크롬(https://wazacs.tistory.com/33) */ input::-webkit-search-decoration,
	input::-webkit-search-cancel-button, input::-webkit-search-results-button,
	input::-webkit-search-results-decoration {
	display: none;
}

.board-list {
	margin: 0 auto;
	width: 1200px;
}

.board-list-content {
	margin: 100px;
}

/* 양쪽 정렬(https://seons-dev.tistory.com/entry/display-flex-좌우-정렬) */
.search-group {
	margin: 20px 0;
	display: flex;
	flex-wrap: no-wrap;
	line-height: 50px;
	justify-content: flex-start;
}

.btn-new-board {
	display: inline-block;
	margin-right: auto;
	border: 1px solid #888;
	border-radius: 10px;
	font-size: 30px;
	background-color: #D9D9D9;
	text-align: center;
	width: 200px;
	line-height: 56px
}

/* serch박스 css */
.category-search-box {
	display: inline-block;
	border: 1px solid #888;
	width: 400px;
	line-height: 59px;
	border-radius: 10px;
	margin-left: auto;
}

form>input {
	line-height: 30px;
	border-radius: 10px;
	border: 1px solid #888;
}

select#column {
	margin-left: 5px;
	width: 100px;
	padding: 2.5px 6px;
}

input#search {
	width: 206px;
}

input#submit {
	width: 50px;
	line-height: 30px;
	background-color: #D9D9D9;
}

th {
	text-align: center;
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

	<div id="container">
		<!--  navar -->
		<jsp:include page="/WEB-INF/views/user/common/navar.jsp" />

		<div class="board-list">
			<div class="board-list-content">
				<div>
					<h3>자유 게시판</h3>
				</div>

				<div class="search-group">
					<a href="${ context }community/board/write">
						<button class="btn-new-board">등록</button>
					</a>
					<!-- searchForm -->
					<form class="category-search-box"
						action="${ context }community/board/search">
						<label class="board-category" for="column"></label> <select
							id="filter" name="filter">
							<option value="board_no">게시글 번호</option>
							<option value="board_title">글 제목</option>
						</select> <label for="search"></label> <input type="search" name="search"
							id="search"> <input type="submit" id="submit" value="검색">
					</form>
				</div>
				<div class="board-table">
					<table class="table">
						<thead class="table-light">
							<tr>
								<th>게시글 번호</th>
								<th>글 제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="boardList" items="${ boardList }">
								<tr>
									<td><a class="text-primary"
										href="${ context }community/board/${ boardList.board_no }">${ boardList.board_no }</a>
									</td>
									<td><a class="text-primary"
										href="${ context }community/board/${ boardList.board_no }">${ boardList.board_title }</a>
									</td>
									<td>${ boardList.user_id}</td>
									<td><fmt:formatDate value="${ boardList.board_date }"
											type="both" /></td>
									<td>${ boardList.board_hits }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="pagination">
					<c:if test="${paging.startPage > paging.blockSize}">
						<a href="${context}community/board?page=${paging.startPage - 1}">
							<img class="arrow" src="${resPath}img/left-arrow-icon.png" alt="">
						</a>
					</c:if>
					<c:forEach var="i" begin="${paging.startPage}"
						end="${paging.endPage}">
						<c:if test="${paging.currentPage == i}">
							<b>${i}</b>
						</c:if>
						<c:if test="${paging.currentPage != i}">
							<a href="${context}community/board?page=${i}">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${paging.endPage < paging.totalPages}">
						<a href="${context}community/board?page=${paging.startPage + 10}">
							<img class="arrow" src="${resPath}img/right-arrow-icon.png"
							alt="">
						</a>
					</c:if>
				</div>
			</div>
		</div>

		<!--  footer -->
	</div>
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</body>
</html>