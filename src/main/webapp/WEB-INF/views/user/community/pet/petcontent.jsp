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
<link href="${ resPath }css/petcontent.css" rel="stylesheet">

</head>

<body>
	<!-- nav -->
	<jsp:include page="/WEB-INF/views/user/common/navar.jsp" />

	<div class="contents_wrap">
		<div class="container">
			<div class="contents_box">
				<div class="tit_box">
					<h2>반려동물 자랑</h2>
				</div>
				<div class="contents_area">
					<div class="contents">
						<div>
							<div class="row">
								<table class="table table-striped"
									style="text-align: center; border: 1px solid #dddddd">
									<thead>
										<tr>
											<td style="width: 20%;">반려동물 이름</td>
											<td colspan="2"></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>작성자</td>
											<td colspan="2"></td>
										</tr>
										<tr>
											<td>등록일</td>
											<td colspan="2"></td>
										</tr>
										<tr>
											<td>내용</td>
											<td colspan="2" style="min-height: 200px; text-align: left;">
											
											</td>
										</tr>
									</tbody>
								</table>
								<a href="${ context }/" class="btn btn-primary">목록</a>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />

</body>
</html>
