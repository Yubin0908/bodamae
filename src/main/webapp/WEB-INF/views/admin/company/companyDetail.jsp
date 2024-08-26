<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>보담 愛-업체상세</title>
    <link href="${ resPath }css/webSettings.css" rel="stylesheet">
    <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
    <link href="${ resPath }css/admin-header.css" rel="stylesheet">
    <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
	<style type="text/css">
	</style>
</head>
<body>

	<div id="container" > 
	  <!-- nav -->
	  <jsp:include page="/WEB-INF/views/admin/common/navar.jsp" />
    <!-- 로고 -->
    <div class="main-content">
      <div class="admin-logo">
        <img class="admin-logo-img" alt="관리자로고이미지" src="${resPath}img/logo_admin.png">
      </div>
		
			<div class="cmp-detail-page" >
				<div>
					<h2>업체 관리 > 상세</h2>
				</div>
				<div class="cmp-detail" >
					<div>
						<img alt="이미지 미리보기" src="">
					</div>
					<div>
						업체 코드 : ${ cmp.cmp_code }
					</div>
					<div>
						업체 카테고리 : ${ cmp.cmp_category }
					</div>
					<div>
						업체 주소 : ${ cmp.cmp_address }
					</div>
					<div>
						업체 주소_구 : ${ cmp.cmp_address_gu }
					</div>
					<div>
						업체 번호 : ${ cmp.cmp_tel_no }
					</div>
					<div>
						업체 휴무일 : ${ cmp.cmp_holidays }
					</div>
					<div>
						업체 운영시간 : ${ cmp.operating_hours }
					</div>
					<div>
						업체 반려동물 제한사항 내용 : ${ cmp.pet_restriction }
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>