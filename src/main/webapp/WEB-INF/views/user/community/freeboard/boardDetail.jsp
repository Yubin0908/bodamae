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

			</div>
		</div>
	</div>
	<!--  footer -->
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</body>



</html>