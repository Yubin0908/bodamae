<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<!DOCTYPE html>
<html>
<head>
<title>보담 愛 | 자유게시판</title>

<link href="${ resPath }css/webSettings.css" rel="stylesheet">
<link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
<script src="${ resPath }js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.tiny.cloud/1/nd8grynjd8268gdl5ya7l9blew0p9nql98thf7fre8azeeg6/tinymce/6/tinymce.min.js"></script>

<style type="text/css">
.board-list {
	margin: 0 auto;
	width: 1200px;
}

.board-list-content {
	margin: 100px;
}

.board-table {
	margin: 50px;
}

.display-flex {
	display: flex;
	align-items: center;
}

.board-info {
	display: inline;
	margin-right: 20px;
}

.board-btn {
	display: inline;
	margin-left: auto;
}

.board-content {
	margin-top: 20px;
}

.board-content {
	margin: 50px 0;
}
</style>
</head>

<body>
	<!--  navar -->
	<div id="container">
		<jsp:include page="/WEB-INF/views/user/common/navar.jsp" />

		<!-- 컨텐츠 -->
		<!-- 본인이 작업할 영역 -->
		<div class="board-list">
			<div class="board-list-content">
				<div>
					<h3>자유 게시판</h3>
				</div>

				<div class="board-table">
					<h3>${ freeBoard.board_title }</h3>
					<div class="display-flex">
						<div class="board-info">
							<span class="board-info">${freeBoard.user_id}</span> 
							<span class="board-info">${freeBoard.board_date}</span> 
							<span class="board-info">${freeBoard.board_hits}</span>
						</div>
					</div>
					<div class="board-content">
						<p>${ freeBoard.board_content }</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  footer -->
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</body>

</html>