<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />
<html>

<head>
<title>보담 愛 | 장소</title>
<link href="${ resPath }css/webSettings.css" rel="stylesheet">
<link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
<script src="${ resPath }js/bootstrap.bundle.min.js"></script>

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
				<div class="search-group"></div>
			</div>
		</div>
	</div>

		<!--  footer -->
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</body>
</html>