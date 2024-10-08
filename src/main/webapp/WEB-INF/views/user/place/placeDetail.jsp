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
  <style type="text/css">
    .place-detail-page {
      width: 1200px;
      margin: 0 auto;
    }
    .place-detail {
      width: 1000px;
      margin: 100px;
      text-align: center;
    }
    .place-detail-content {
      border: 1px solid #888;
      border-radius: 20px;
      text-align: center;
      font-size: 20px;
    }
    h3 {
      text-align: left;
      margin-bottom: 20px;
    }
    .place-img {
      margin: 10px auto;
    }
    .column {
      font-weight: bold;
    }
    #place-img {
     width: 800px;
      height: 400px;
      object-fit: contain;
    }
    .down-side {
      display: flex;
      margin-bottom: 20px;
    }
    .d-left-side{
      margin-top: 20px;
      padding-left:20px;
      width: 500px;
      text-align: left;
    }
    .inner-line {
      margin-top: 10px;
    }
    .column {
      display: inline-block;  
    }
    .detail {
      display: inline-block;
    }
    .d-right-side {
      margin-left: auto;
      margin-right: 20px;
    }
    #pet-restriction {
      width: 110px;
      opacity: 0.7;
    }
    .pet-restriction-down {
      border: 1px solid #D9D9D9;
      background-color: #D9D9D9;
      border-radius: 30px;
      width: 500px;
      line-height: 130px;
    }
    .btn-reset {
      margin: 0 auto;
    }
    button[type="reset"] {
      display : inline-block;
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
	<div id="container">
		<!--  navar -->
		<jsp:include page="/WEB-INF/views/user/common/navar.jsp" />

		<div class="place-detail-page">
			<div class="place-detail">
        <div class="place-detail-header" >
  				<div>
  					<h3>장소 > ${ place.cmp_name } </h3>
  				</div>
        </div>
        <div class="place-detail-content">
          <div class="place-img up-side" >
            <img id="place-img" alt="업체이미지 ${ place.cmp_name }" src="${ place.cmp_img_url }">
          </div>
          <div class="down-side" >
            <div class="d-left-side" >
              <div class="inner-line" >
                <div class="column">
                  장소 이름&nbsp;&nbsp; : 
                </div>
                <div class="detail" >
                  ${ place.cmp_name }
                </div>
              </div>
              <div class="inner-line" >
                <div class="column" >
                  주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
                </div>
                <div class="detail" >
                  ${ place.cmp_address }
                </div>
              </div>
              <div class="inner-line" >
                <div class="column" >
                  전화번호&nbsp;&nbsp;&nbsp; : 
                </div>
                <div class="detail" >
                  ${ place.cmp_tel_no }
                </div>
              </div>
              <div class="inner-line" >
                <div class="column" >
                  휴무일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 
                </div>
                <div class="detail" >
                  ${ place.cmp_holidays }
                </div>
              </div>
              <div class="inner-line" >
                <div class="column" >
                  운영시간&nbsp;&nbsp;&nbsp; : 
                </div>
                <div class="detail" >
                  ${ place.operation_hours }
                </div>
              </div>
            </div>
            <div class="d-right-side" >
              <div class="pet-restriction-up" >
                필독! 반려동물 제한사항 내용 <img id=pet-restriction alt="맹견사진" src="${resPath}img/dog.png">
              </div>
              <div class="pet-restriction-down detail" >
                ${ place.pet_restriction }
              </div>
            </div>
          </div>
        </div>
          <div class="btn-reset" >
            <button type="reset"  onclick="location.href='${context}place'">목록으로</button>
          </div>
			</div>
		</div>
	</div>

		<!--  footer -->
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</body>
</html>