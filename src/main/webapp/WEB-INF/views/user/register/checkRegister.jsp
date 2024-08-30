<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />
<!DOCTYPE html>
<html>
  <head>
    <title>보담 愛 | 개인정보 동의</title>
    
    <!-- CSS 파일 링크 -->
    <link href="${ resPath }css/webSettings.css" rel="stylesheet">
    <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${resPath}css/login.css?after">
    
    <!-- JavaScript 파일 링크 -->
    <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
    
    <!-- 페이지 내 스타일 정의 -->
    <style type="text/css">
      .register { width: 500px;  margin: 100px auto; text-align: center; }
      .checkBox { width: 500px; text-align: left; }
      
      .form-check { padding-left: 0; margin-bottom: 0; }
      .form-check .form-check-input { margin-left: 0; }
      .form-check-first { margin-bottom: 40px; }
      .form-check-second { margin-bottom: 70px; }
      .fullAgreement { font-weight: bold; }
      
      button { width: 500px; }     
      label { font-size: 30px; }
      
      input[type=checkbox] { width: 30px; height: 30px; margin-right: 10px; text-align: center; }
      
    </style>
  </head>
  
  <body>
    <!-- 상단 로고 포함 -->
    <jsp:include page="/WEB-INF/views/user/common/logo.jsp" />
  
    <!-- 본문 내용 -->
    <div class="register">
      <div class="checkBox">
        <!-- 전체 동의 체크박스 -->
        <div class="form-check-first form-check">
          <input class="form-check-input" type="checkbox" id="checkAll"> 
          <label class="form-check-label chk" for="checkAll">전체 동의하기</label>
        </div>
        
        <!-- 개별 동의 항목 -->
        <div class="form-check-second">
          <!-- 이용약관 동의 체크박스 -->
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="tos"> 
            <label class="form-check-label chk tos" for="tos">[필수] 이용약관</label>
          </div>
    
          <!-- 개인정보 수집 및 이용 동의 체크박스 -->
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="personalInformation"> 
            <label class="form-check-label chk personalInformation" for="personalInformation">[필수] 개인정보 수집 및 이용</label>
          </div>
    
          <!-- 위치기반 서비스 이용약관 동의 체크박스 -->
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="location"> 
            <label class="form-check-label chk select location" for="location">[선택] 위치기반 서비스 이용약관</label>
          </div>
        </div>
      </div>
      
      <!-- '다음' 버튼 -->
      <div>
        <button type="button" class="btn btn-outline-info btn-lg" id="nextButton" disabled
                onclick="location.href='${ context }user/register'">다음</button>
      </div>
    </div>
  </body>
  
  <script>
    // 전체 동의 체크박스
    const checkAll = document.querySelector('#checkAll');
  
    // 전체 동의 체크박스 클릭 시 모든 체크박스 체크 / 해제
    checkAll.addEventListener('click', function() {
      const isChecked = checkAll.checked; 
      const checkboxes = document.querySelectorAll('.form-check-input:not(#checkAll)');
      
      checkboxes.forEach(checkbox => {
        checkbox.checked = isChecked;
      });
      
      updateNextButtonState(); // '다음' 버튼 상태 업데이트
    });
  
    // 개별 체크박스
    const checkboxes = document.querySelectorAll('.form-check-input:not(#checkAll)');
  
    // 개별 체크박스 클릭 시 전체 동의 체크박스 상태 + '다음' 버튼 상태 업데이트
    checkboxes.forEach(checkbox => {
      checkbox.addEventListener('click', function() {
        updateCheckAllState(); // 전체 동의 체크박스 상태 업데이트
        updateNextButtonState(); // '다음' 버튼 상태 업데이트
      });
    });
  
    // 전체 동의 체크박스 상태 업데이트 함수
    function updateCheckAllState() {
      const checkboxes = document.querySelectorAll('.form-check-input:not(#checkAll)');
      const checkedCnt = document.querySelectorAll('.form-check-input:not(#checkAll):checked').length;
      const totalCnt = checkboxes.length;
  
      checkAll.checked = totalCnt === checkedCnt;
    }
  
    // '다음' 버튼 상태 업데이트 함수
    function updateNextButtonState() {
      const requiredCheckboxes = document.querySelectorAll('.form-check-input[id=tos], .form-check-input[id=personalInformation]');
      const allCheckboxes = document.querySelectorAll('.form-check-input:not(#checkAll)');
      
      const allRequiredChecked = requiredCheckboxes.length === document.querySelectorAll('.form-check-input[id=tos]:checked, .form-check-input[id=personalInformation]:checked').length;
      const allChecked = allCheckboxes.length === document.querySelectorAll('.form-check-input:not(#checkAll):checked').length;
  
      const nextButton = document.querySelector('#nextButton');
      nextButton.disabled = !(allRequiredChecked || allChecked); // 필수 체크박스가 모두 체크되거나 모든 체크박스가 체크된 경우 '다음' 버튼 활성화
    }
    
  </script>
</html>
