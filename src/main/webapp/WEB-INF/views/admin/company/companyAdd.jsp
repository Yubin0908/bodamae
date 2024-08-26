<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>보담 愛-업체등록</title>
    <link href="${ resPath }css/webSettings.css" rel="stylesheet">
    <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
    <link href="${ resPath }css/admin-header.css" rel="stylesheet">
    <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
	
	<style type="text/css">
			/* input x자 표시 없애기 크롬(https://wazacs.tistory.com/33) */
		input::-webkit-search-decoration,
		input::-webkit-search-cancel-button,
		input::-webkit-search-results-button,
		input::-webkit-search-results-decoration {
			display: none;
		}
		.cmp-add { width: 1000px; margin: 0 auto; }
		.cmp-add-form { width: 1000px; border: 1px solid #888; border-radius: 20px; 	}
		.upside {display: flex;}
		.image { width: 500px; text-align: center; justify-content: center; }
		.right-side { width: 500px;  }
		.down-side { width: 1000px; text-align: center; }
		.preview { margin: 10px auto; bolder:1px solid #888;  width: 400px; height: 200px; }
		#img-url { border: 1px solid #888 }
		label { display: inline-block; margin: 10px; }
		input { padding: 3px; }
		#pet_restriction { padding: 5px; width: 500px; line-height: 50px ; }
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

			<div class="cmp-add" >
				<div>
					<h2>업체 관리 > 등록</h2>
				</div>
				<form class="cmp-add-form" action="">
					<div class="upside" >
						<div  class="image" >
							<div class="preview">
								<label for="preview"></label>
								<img id="preview" alt="이미지 미리보기" src="">
							</div>
							<div class="img-url">	
								<label for="img_url" ></label>
								<input name="img_url" id="img_url" type="file" placeholder="이미지 URL" >
							</div>
						</div>
						<div class="right-side">
							<div class="cmp-code">
								<label for="cmp_code" >업체 코드 :</label>
								<input name="cmp_code" type="text" id="cmp_code" disabled="disabled" >
							</div>
							<div class="cmp-category">
								<label for="cmp_category" >업체 카테고리 : </label>
								<input name="cmp_category" type="text" id="cmp_category">
							</div>
							<div class="cmp-address" >
								<label for="cmp_address" >업체 주소 : </label>
								<input name="cmp_address" type="text" id="cmp_address" placeholder="도로명주소" >
							</div>
							<div class="cmp-address-gu">
								<label for="cmp_address_gu" >업체 주소_구 : </label>
								<input name="cmp_address_gu" type="text" id="cmp_address_gu" placeholder="ex) 강남구" >
							</div>
							<div class="cmp-tel-no">
								<label for="cmp_tel_no" >업체 번호 : </label>
								<input name="cmp_tel_no" type="text" id="cmp_tel_no" >
							</div>
						</div>
					</div>
					<div class="down-side">
						<div >
							<label for="cmp_holidays" >업체 휴무일 : </label>
							<input type="text" name="cmp_holidays" id="cmp-holidays" >
						</div>
						<div>
							<label for="operation_hours" >운영시간 : </label>
							<input type="text" name="operation_hours" id="operation-hours" >
						</div>
						<div>
							<label for="pet_restriction" >반려동물 제한사항 내용 : </label>
							<!-- <input type="text" name="pet_restriction" id="pet-restriction" > -->
							<textarea name="pet_restriction" id="pet_restriction" rows="2" cols="1" placeholder="ex) 맹견류, 공격성, 짖음 심한 경우 불가, 5차 접종, 매너벨트 필수" ></textarea>
						</div>
						<div>
							<input type="submit" value="등록 완료" >
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>