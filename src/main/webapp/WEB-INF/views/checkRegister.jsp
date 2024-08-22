<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />
<!DOCTYPE html>
<html>
  <head>
    <title>보담 愛 | 개인정보 동의</title>
    
    <link href="${ resPath }css/webSettings.css" rel="stylesheet">
    <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${resPath}css/login.css?after">
    <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
    
    <style type="text/css">
      .register { width: 500px;  margin: 0 auto; text-align: center; }
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
    <!-- nav -->
    <jsp:include page="/WEB-INF/views/user/common/logo.jsp" />
  
    <!-- content -->
    <div class="register">
      <div class="checkBox">
        <div class="form-check-first form-check">
          <input class="form-check-input" type="checkbox" id="checkAll"> 
          <label class="form-check-label chk" for="checkAll">전체 동의하기</label>
        </div>
        
        <div class="form-check-second">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="tos"> 
            <label class="form-check-label chk tos" for="tos">[필수] 이용약관</label>
          </div>
    
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="personalInformation"> 
            <label class="form-check-label chk personalInformation" for="personalInformation">[필수] 개인정보 수집 및 이용</label>
          </div>
    
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="location"> 
            <label class="form-check-label chk select location" for="location">[선택] 위치기반 서비스 이용약관</label>
          </div>
        </div>
      </div>
      
      <!-- 버튼 -->
      <div>
         <a class="logoA" href="${ context }register">
          <button type="button" class="btn btn-outline-info btn-lg" id="nextButton" >다음</button>
        </a>
      </div>
    </div>
  </body>
  
  <script>
    const checkAll = document.querySelector('#checkAll'); // 모두 체크
    
    checkAll.addEventListener('click', function() {
      const isChecked = checkAll.checked;
      const checkboxes = document.querySelectorAll('.form-check-input:not(#checkAll)');
      
      checkboxes.forEach(checkbox => {
        checkbox.checked = isChecked;
      });
      
      updateNextButtonState();
    });
  
    const checkboxes = document.querySelectorAll('.form-check-input:not(#checkAll)');
  
    checkboxes.forEach(checkbox => {
      checkbox.addEventListener('click', function() {
        updateCheckAllState();
        updateNextButtonState();
      });
    });
  
    function updateCheckAllState() {
      const checkboxes = document.querySelectorAll('.form-check-input:not(#checkAll)');
      const checkedCnt = document.querySelectorAll('.form-check-input:not(#checkAll):checked').length;
      const totalCnt = checkboxes.length;
  
      checkAll.checked = totalCnt === checkedCnt;
    }
  
    function updateNextButtonState() {
      const requiredCheckboxes = document.querySelectorAll('.form-check-input[id=tos], .form-check-input[id=personalInformation]');
      const allCheckboxes = document.querySelectorAll('.form-check-input:not(#checkAll)');
      
      const allRequiredChecked = requiredCheckboxes.length === 
                                 document.querySelectorAll('.form-check-input[id=tos]:checked, .form-check-input[id=personalInformation]:checked').length;
      const allChecked = allCheckboxes.length === document.querySelectorAll('.form-check-input:not(#checkAll):checked').length;
  
      const nextButton = document.querySelector('#nextButton');
      nextButton.disabled = !(allRequiredChecked || allChecked);
    }
    
  </script>
  
</html>
