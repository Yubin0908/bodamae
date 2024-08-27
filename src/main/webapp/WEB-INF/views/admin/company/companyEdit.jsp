<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

  input { width: 300px; }
  input[type="submit"] {
    margin: 10px;
    width: 200px;
    line-height: 60px;
    border: 1px solid #888;
    border-radius: 10px;
    font-size: 25px;
    font-weight: bold;
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
  .btn-reset {
    text-align: right;
  }
</style>
</head>
<body>

  <div id="container">
    <!-- nav -->
    <jsp:include page="/WEB-INF/views/admin/common/navar.jsp" />
    <!-- 로고 -->
    <div class="main-content">
      <div class="admin-logo">
        <img class="admin-logo-img" alt="관리자로고이미지" src="${resPath}img/logo_admin.png">
      </div>

      <div class="cmp-detail-page">
        <div>
          <h2>업체 관리 > 수정 > ${ cmp.cmp_name }</h2>
        </div>
        <div class="cmp-edit">
          <form action="${ context }admin/company/companyDetail/${ cmp.cmp_code }" method="post" >
            <div class="upside">
              <div> <img alt="업체 이미지" src="${ img }"/> </div>
              <div class="right-side">
                <div class="cmp-code">
                  <label for="cmp_code">업체 코드 :</label>
                  <input name="cmp_code" type="text" id="cmp_code" value="${ cmp.cmp_code }" disabled="disabled">
                </div>
                <div class="cmp-name">
                  <label for="cmp_name">업체 이름 : </label>
                  <input name="cmp_name" type="text" id="cmp_name" value="${ cmp.cmp_name }" >
                </div>
                <div class="cmp-address">
                  <label for="cmp_address">업체 주소 : </label>
                  <input name="cmp_address" type="text" id="cmp_address" value="${ cmp.cmp_address }" >
                </div>
                <div class="cmp-address-gu">
                  <label for="cmp_address_gu">업체 주소_구 : </label>
                  <input name="cmp_address_gu" type="text" id="cmp_address_gu" value="${ cmp.cmp_address_gu }" >
                </div>
                <div class="cmp-tel-no">
                  <label for="cmp_tel_no">업체 번호 : </label>
                  <input name="cmp_tel_no" type="text" id="cmp_tel_no" value="${ cmp.cmp_tel_no }" >
                </div>
              </div>
            </div>
            <div class="down-side">
              <div>
                <label for="cmp_holidays">업체 휴무일 : </label>
                <input type="text" name="cmp_holidays" id="cmp-holidays" value="${ cmp.cmp_holidays }" >
              </div>
              <div>
                <label for="operation_hours">운영시간 : </label>
                <input type="text" name="operation_hours" id="operation-hours" value="${ cmp.operation_hours }" >
              </div>
              <div>
                <label for="pet_restriction">반려동물 제한사항 내용 : </label>
                <!-- <input type="text" name="pet_restriction" id="pet-restriction" > -->
                <input name="pet_restriction" id="pet_restriction"  value="${ cmp.pet_restriction }" />
              </div>
              <div>
                <input type="submit" value="수정 완료">
              </div>
            </div>
          </form>
          <div class="btn-reset" ><button type="reset"  onclick="history.back()">뒤로가기</button></div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>