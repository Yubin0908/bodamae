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
  .cmp-detail-page {
    width: 1000px;
    margin: 0 auto;
  }
  .cmp-detail {
    width: 1000px;
    border: 1px solid #888;
    border-radius: 20px;
    text-align: center; 
    justify-content: center;
  }
 .cmp-img {
    width:480px;
    padding: 10px;
  }
  .down-side {
    display: flex;
    font-size: 20px;
  }
  .d-left-side {
    width: 600px;
    padding-left: 50px;
    text-align: left;
  }
  .d-right-side {
    width: 400px;
    padding-left: 30px;
    text-align: left;
  }
  .d-right-side>div {
    margin-top: 10px;
  }
  .d-down-side {
    width: 1000x;
    margin: 10px 0;
    font-size: 20px;
    text-align: center;
  }
  button[type="reset"] {
    margin: 10px;
    width: 200px;
    line-height: 60px;
    border: 1px solid #888;
    border-radius: 10px;
    font-size: 25px;
    font-weight: bold;
  }
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
					<h2>업체 관리 > 상세 > ${ cmp.cmp_name }</h2>
				</div>
				<div class="cmp-detail" >
          <div>
  					<div class="up-side" >
  						<img class="cmp-img" alt="업체 이미지"  src ="${ cmp.cmp_img_url }">
  					</div>
            <div class="down-side" >
              <div class="d-left-side" >
      					<div>
      						업체 코드&nbsp;&nbsp;&nbsp;&nbsp; : ${ cmp.cmp_code }
      					</div>
      					<div>
      						업체 이름&nbsp;&nbsp;&nbsp;&nbsp; : ${ cmp.cmp_name }
      					</div>
      					<div>
      						업체 주소&nbsp;&nbsp;&nbsp;&nbsp; : ${ cmp.cmp_address }
      					</div>
      					<div>
      						업체 주소_구 : ${ cmp.cmp_address_gu }
      					</div>
              </div>
              <div class="d-right-side" >
      					<div>
      						전화번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : ${ cmp.cmp_tel_no }
      					</div>
      					<div>
      						업체 휴무일&nbsp;&nbsp;&nbsp; : ${ cmp.cmp_holidays }
      					</div>
      					<div>
      						업체 운영시간 : ${ cmp.operation_hours }
      					</div>
              </div>
            </div>
            <div class="d-down-side" >
    					<div>
    						업체 반려동물 제한사항 내용 :
    					</div>
              <div>${ cmp.pet_restriction }</div>
            </div>
          </div>
				</div>
        <div class="btn-reset" >
          <button type="reset"  onclick="history.back()">뒤로가기</button>
        </div>
			</div>
		</div>
	</div>
</body>
</html>