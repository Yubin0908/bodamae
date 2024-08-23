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

	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">등록일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<td>1</td>
					<td>안녕하세요</td>
					<td>홍길동</td>
					<td>2024-08-22</td>
					<td>18</td>
					</tr>
				</tbody>
			</table>
			<a href="${context}community/board/write" class="btn btn-primary pull-right">등록</a>
		</div>
	</div>




	<!--  footer -->
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />


</body>
</html>