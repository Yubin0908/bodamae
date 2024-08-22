<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />
<!DOCTYPE html>
<html>
<head>
    <title>보담 愛 | 회원가입</title>
    <link href="${resPath}css/webSettings.css" rel="stylesheet">
    <link href="${resPath}css/bootstrap.min.css" rel="stylesheet">
    <script src="${resPath}js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <style type="text/css">
      .register { width: 500px; margin: 100px auto; }
      .date { margin-bottom: 40px; }
      .gender { margin-bottom: 40px; }
      .btn { width: 500px; }
      
      .id_check { margin-top: 5px; }
      .id_ok { color: green; display: none; }
      .id_not { color: red; display: none; }
      .id_already { color: red; display: none; }
      .error { margin-top: 5px; }
      
      .label { margin-bottom: 10px; font-weight: bold; }
      .gender-check { display: flex; }
      .check-l { margin-right: auto; }
      .check-box { width: 200px; }
      .form-check-label { font-size: 20px; }
      .error { color: red; }
      .disabled { opacity: 0.5; cursor: not-allowed; }
    </style>
</head>
  
<body>
    <!-- nav -->
    <jsp:include page="/WEB-INF/views/user/common/logo.jsp" />
  
    <!-- content -->
    <div class="register">
      <form action="${context}register" method="post" id="registrationForm">
        <div class="form-floating mb-3">
          <!-- oninput="validateForm()" -->
          <input type="text" class="form-control" onChange = "checkId()" 
                 id="user_id" name="user_id" minlength="5" maxlength="15" placeholder="ID"> 
          <label for="floatingInput">아이디</label>
          <div class="id_check">
            <span class="id_ok">사용 가능한 아이디입니다.</span>
            <span class="id_not">아이디는 5 ~15 자의 영문 소문자, 숫자만 사용 가능합니다.</span>
            <span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
          </div>
        </div>
        <div class="form-floating mb-3">
          <input type="password" class="form-control" id="user_password" oninput="validatePasswords()"
                 name="user_password" minlength="8" maxlength="20" placeholder="Password"> 
          <label for="floatingPassword">비밀번호</label>
        </div>
        <div class="form-floating mb-3">
          <input type="password" class="form-control" id="user_r_password" oninput="validatePasswords()"
                 name="user_r_password" minlength="8" maxlength="20" placeholder="Password"> 
          <label for="floatingPassword">비밀번호 확인</label>
          <p id="password-error" class="error"></p>
        </div>
        
        <div>
          <label class="label" for="user_name">이름</label>
          <div class="form-floating mb-3">
            <input type="text" class="form-control" id="user_name" oninput="validateForm()"
                   name="user_name" minlength="2" maxlength="5" placeholder="name"> 
            <label for="floatingInput">이름</label>
          </div>
        </div>
        
        <div>
          <label class="label" for="user_tel">연락처</label>
          <div class="form-floating mb-3">
            <input type="text" class="form-control" id="user_tel" oninput="oninputPhone(this)"
                   name="user_tel" maxlength="14" placeholder="tel"> 
            <label for="floatingInput">연락처</label>
          </div>
        </div>
        
        <div class="date">
          <label class="label" for="user_birthdate">생년월일</label>
          <div>
            <input type="date" id="user_birthdate" name="user_birthdate" value="1998-06-22"
                   class="form-control" max="2024-12-31" min="1900-01-01" oninput="validateForm()">
          </div>
        </div>
        
        <div class="gender">
          <label class="label" for="user_gender">성별</label>
          <div class="gender-check">
            <div class="form-check check-box check-l">
              <input class="form-check-input" type="radio" id="F" name="user_gender" value="F" checked>
              <label class="form-check-label" for="flexRadioDefault2">여자</label>
            </div>
            <div class="form-check check-box check-r">
              <input class="form-check-input" type="radio" id="M" name="user_gender" value="M">
              <label class="form-check-label" for="flexRadioDefault1">남자</label>
            </div>
          </div>
        </div>
  
        <!-- 버튼 -->
        <button type="submit" class="btn btn-outline-info btn-lg disabled" id="submitBtn" disabled>가입하기</button>
      </form>
    </div>
</body>
  
  <script>
    function checkId(){
        var id = $('#user_id').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'${context}idCheck', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{ id : id },
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                if(cnt == "0"){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
                    id = document.getElementById('user_id').value.trim();
                    if (id.length >= 5 && id.length <= 15) {
                      $('.id_ok').css("display","inline-block"); 
                      $('.id_already').css("display", "none");   
                      $('.id_not').css("display", "none");
                      return validateForm();
                    } else {
                      $('.id_ok').css("display","none"); 
                      $('.id_already').css("display", "none");  
                      $('.id_not').css("display", "inline-block"); 
                      return false;
                    }
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    if (id.length >= 5 && id.length <= 15) {
                      $('.id_already').css("display", "inline-block");  
                      $('.id_ok').css("display","none"); 
                      $('.id_not').css("display", "none");       
                      $('#id').val('');
                      return false;
                    } else {
                      $('.id_ok').css("display","none"); 
                      $('.id_already').css("display", "none");  
                      $('.id_not').css("display", "inline-block");      
                      $('#id').val('');
                      return false;
                    }
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
        };
	
    function oninputPhone(target) {
      target.value = target.value
          .replace(/[^0-9]/g, '')
          .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
      validateForm(); // Validate the form on phone number input change
    }
    
    function validatePasswords() {
      const password = document.getElementById('user_password').value.trim();
      const confirmPassword = document.getElementById('user_r_password').value.trim();
      const errorElement = document.getElementById('password-error');
      
      if (password !== confirmPassword) {
        errorElement.textContent = '비밀번호가 다릅니다.';
        document.getElementById('submitBtn').disabled = true;
        document.getElementById('submitBtn').classList.add('disabled');
        return false;
      } else {
        errorElement.textContent = '';
        return validateForm();
      }
    }
    
    function validateForm() {
      const id = document.getElementById('user_id').value.trim();
      const password = document.getElementById('user_password').value.trim();
      const confirmPassword = document.getElementById('user_r_password').value.trim();
      const name = document.getElementById('user_name').value.trim();
      const tel = document.getElementById('user_tel').value.trim();
      const birthdate = document.getElementById('user_birthdate').value.trim();
      const gender = document.querySelector('input[name="user_gender"]:checked');
      
      const isValid = id.length >= 5 && id.length <= 15 &&
                      password.length >= 8 && password.length <= 20 &&
                      name.length >= 2 && name.length <= 5 &&
                      tel.length > 0 && 
                      birthdate &&
                      gender &&
                      password == confirmPassword;
      
      const submitBtn = document.getElementById('submitBtn');
      
      if (isValid) {
        submitBtn.classList.remove('disabled');
        submitBtn.disabled = false;
      } else {
        submitBtn.classList.add('disabled');
        submitBtn.disabled = true;
      }
      
      return isValid;
    }
    
</script>
</html>

=======
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
>>>>>>> 65bc8adc07ac922eaa512404aa7969f64c72a6c2
