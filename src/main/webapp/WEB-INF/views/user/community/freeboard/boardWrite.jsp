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

.board-form {
	margin: 50px auto;
	width: 800px;
}

.form-board-content {
	width: 100%;
	height: 200px;
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
					<h3>자유 게시판 등록</h3>
				</div>

				<div class="board-form">
					<form method="post" action="${context}community/board/writeAction">

						<div class="row my-2">
							<div class="col-2 fw-bolder">
								<label for="board_title">제목</label>
							</div>
							<div class="col">
								<input type="text" id="board_title" name="board_title"
									class="form-control" value="${ board_title }">
							</div>
						</div>

						<div class="row my-2">
							<div class="col-2 fw-bolder">
								<label for="board_content">내용</label>
							</div>
							<div class="col">
								<textarea cols="79" rows="10" id="board_content"
									name="board_content" value="${ board_content}"></textarea>
							</div>
						</div>

						<!-- 버튼 -->
						<div class="row mt-5">
							<div class="col">
								<button type="button" class="btn btn-outline-info w-100 btn-lg"
									onclick="location.href='${ context }community/board'">뒤로
									가기</button>
							</div>
							<div class="col">
								<button type="submit" class="btn btn-outline-info w-100 btn-lg">등록
									완료</button>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<!--  footer -->
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</body>

<script>
	tinymce
			.init({
				selector : 'textarea',
				plugins : 'autolink code link autoresize paste contextmenu image preview',
				toolbar : 'undo redo | fintsizeselect | forecolor | bold italic strikethrough underline | alignleft aligncenter alignright alignjustify | tinycomments | bullist numlist outdent indent | link custom_image | code preview',
				fintsize_formats : '8px 10px 12px 14px 16px 18px 20px 22px 24px 26px 28px 30px 36px 40px 48px',
				tinycomments_mode : 'embedded',
				tinycomments_author : 'Author name',
				fullpage_default_font_size : "16px",
				paste_as_text : true,
				paste_data_images : true,
				branding : false,
				language : "ko_KR",
				menubar : false,
				min_height : 800,
				max_height : 800,
				content_style : 'body { text-align: center; }',
			});
	
</script>

</html>