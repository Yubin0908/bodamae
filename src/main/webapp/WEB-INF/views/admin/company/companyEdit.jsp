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
  .cmp-edit-page{
    width: 1000px;
    margin: 0 auto;
  }
  .cmp-edit-form {
    width: 1000px;
    border: 1px solid #888;
    border-radius: 20px;
    text-align: center;  
  }
  .up-side {
    display: flex;
  }
  .left-side {
    width: 500px;
    
  }
  .right-side {
    width: 500px;
    margin-right: 25px;
    margin-top: 10px
  }
  label {
    display: inline-block;
    margin: 10px;
    font-weight: bold;
  }
  input[type="text"] {
    padding-left: 10px;
    width: 330px;
  }
  .cmp-img {
    width:480px;
    padding: 10px;
   
  }
  .inner {
    margin: 10px 0;
    display: flex;
  }
  .down-side {
    
  }
  #pet_restriction {
    width: 500px;
    line-height: 40px;
  }
  
  input[type="submit"] {
    margin: 10px;
    width: 200px;
    line-height: 60px;
    border: 1px solid #888;
    border-radius: 10px;
    font-size: 25px;
    font-weight: bold;
  }
   .btn-side {
    display: flex;
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
    text-align: left;
  }
  .btn-modal {
    margin-left: auto;
  }
  button#btn-modal {
    margin: 10px;
    width: 200px;
    height: 60px;
    border: 1px solid #888;
    border-radius: 10px;
    font-size: 25px;
    font-weight: bold;
    background-color: #F0F0F0;
    color:#000;
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
    <!-- 메인 콘텐츠 -->
      <div class="cmp-edit-page">
        <div>
          <h2>업체 관리 > 수정 > ${ cmp.cmp_name }</h2>
        </div>
        <div class="cmp-edit">
          <form class="cmp-edit-form" action="${ context }admin/company/companyDetail/${ cmp.cmp_code }" method="post" >
            <div class="up-side">
              <div class="left-side"> 
                <img class="cmp-img" alt="업체 이미지" src="${ cmp.cmp_img_url }"/> 
              </div>
              <div class="right-side">
                <div class="cmp-code inner">
                  <label for="cmp_code">업체 코드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</label>
                  <input name="cmp_code" type="text" id="cmp_code" value="${ cmp.cmp_code }" disabled="disabled">
                </div>
                <div class="cmp-name inner">
                  <label for="cmp_name">업체 이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </label>
                  <input name="cmp_name" type="text" id="cmp_name" value="${ cmp.cmp_name }" >
                </div>
                <div class="cmp-address inner">
                  <label for="cmp_address">업체 주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </label>
                  <input name="cmp_address" type="text" id="cmp_address" value="${ cmp.cmp_address }" >
                </div>
                <div class="cmp-address-gu inner">
                  <label for="cmp_address_gu">업체 주소_구&nbsp;&nbsp;&nbsp; : </label>
                  <input name="cmp_address_gu" type="text" id="cmp_address_gu" value="${ cmp.cmp_address_gu }" >
                </div>
                <div class="cmp-tel-no inner">
                  <label for="cmp_tel_no">전화번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </label>
                  <input name="cmp_tel_no" type="text" id="cmp_tel_no" value="${ cmp.cmp_tel_no }" >
                </div>
                <div class="cmp-holidays inner" >
                  <label for="cmp_holidays">업체 휴무일&nbsp;&nbsp;&nbsp;&nbsp; : </label>
                  <input type="text" name="cmp_holidays" id="cmp-holidays" value="${ cmp.cmp_holidays }" >
                </div>
                <div class="operation-hours inner" >
                  <label for="operation_hours">운영시간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </label>
                  <input type="text" name="operation_hours" id="operation-hours" value="${ cmp.operation_hours }" >
                </div>
                <div>
              </div>
            </div>
            </div>
            <div class="down-side">
                <label for="pet_restriction">반려동물 제한사항 내용 : </label>
                <!-- <input type="text" name="pet_restriction" id="pet-restriction" > -->
                <input type="text" name="pet_restriction" id="pet_restriction"  value="${ cmp.pet_restriction }" />
            </div>
            <div>
              <input type="submit" value="수정 완료">
            </div>
          </form>
          <div class="btn-side" >
            <div class="btn-reset" >
              <button type="reset"  onclick="history.back()">뒤로가기</button>
            </div>
            <!-- Button trigger modal -->
            <div class="btn-modal">
              <button id="btn-modal" type="button" class="btn btn-outline-info" 
                data-bs-toggle="modal" data-bs-target="#Modal-${ cmp.cmp_code }">업체 삭제</button>
            </div>
          </div>
          <!-- Modal -->
          <div class="modal fade" id="Modal-${ cmp.cmp_code }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5 text-size-bold" id="exampleModalLabel">해당 업체를 삭제 하시겠습니까 ?</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                  <button type="button" class="btn btn-info" 
                  onclick="location.href='${pageContext.request.contextPath}/admin/company/delete/${cmp.cmp_code}'">삭제</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>