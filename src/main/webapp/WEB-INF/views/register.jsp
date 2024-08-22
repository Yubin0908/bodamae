<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<!DOCTYPE html>
<html>
<head>
  <title>보담 愛 | 개인정보 동의</title>
  <link href="${resPath}css/webSettings.css" rel="stylesheet">
  <link href="${resPath}css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${resPath}css/login.css?after">
  <script src="${resPath}js/bootstrap.bundle.min.js"></script>
  <script>
    document.addEventListener("DOMContentLoaded", function() {
      const checkAll = document.getElementById("checkAll");
      const tos = document.getElementById("tos");
      const personalInformation = document.getElementById("personalInformation");
      const location = document.getElementById("location");
      const nextButton = document.getElementById("nextButton");

      function updateButtonState() {
        if (checkAll.checked) {
          tos.checked = true;
          personalInformation.checked = true;
          location.checked = true;
        }

        const requiredChecked = tos.checked && personalInformation.checked;
        const isButtonEnabled = requiredChecked || checkAll.checked;

        nextButton.disabled = !isButtonEnabled;
      }

      // Event listeners for checkboxes
      checkAll.addEventListener("change", updateButtonState);
      tos.addEventListener("change", updateButtonState);
      personalInformation.addEventListener("change", updateButtonState);
      location.addEventListener("change", updateButtonState);

      // Initial update
      updateButtonState();
    });
  </script>
  <style type="text/css">
    .register { width: 500px; margin: 0 auto; text-align: center; }
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
<jsp:include page="/WEB-INF/views/user/common/navar.jsp" />

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
  <button type="button" class="btn btn-outline-info btn-lg" id="nextButton" disabled>다음</button>
</div>
</body>
</html>