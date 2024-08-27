<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<style type="text/css">
/* input x자 표시 없애기 크롬(https://wazacs.tistory.com/33) */
input::-webkit-search-decoration, input::-webkit-search-cancel-button,
input::-webkit-search-results-button, input::-webkit-search-results-decoration
	{ display: none; }

  .cmp-add {
  	width: 1000px;
  	margin: 0 auto;
  }
  
  .cmp-add-form {
  	width: 1000px;
  	border: 1px solid #888;
  	border-radius: 20px;
    text-align: center;  
  }
  
  .upside {
  	display: flex;
  }
  
  .image {
    margin: 10px;
  	width: 480px;
  	text-align: center;
  }
  
  .right-side {
    margin-top: 20px;
  	width: 500px;
  }
  
  
  .preview {
  	margin: 10px 10px;
    padding: 5px;
  	border: 1px solid #888;
    border-radius: 15px;
  	width: 410px;
  	height: 200px;
    vertical-align: middle;
  }
  img.cmp-img {
    width: 400px;
    height: 100%;
    object-fit: contain;
  }
  
  label {
  	display: inline-block;
  	margin: 10px;
  }
  
  input {
    display: inline-block;
  	padding: 3px;
    width: 300px;
  }
  .down-side {
    margin: 0 auto;
  	width: 500px;
  	text-align: left;
  }
  .pet_restriction {
    text-align: left;
  }
  #pet_restriction {
  	padding: 5px;
  	width: 480px;
  	line-height: 50px;
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
  .btn-submit {
    display: inline-block;
    justify-content: center;
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

      <div class="cmp-add">
        <div>
          <h2>업체 관리 > 등록</h2>
        </div>
        <form class="cmp-add-form" action="${ context }admin/company/companyList" method="post">
          <div class="upside">
            <div class="image">
              <div class="preview" id="img_preview"></div>
              <div class="img-url">
                <label for="img_url"></label> 
                <input id="img_url" type="file" onchange="setPreview(event);" accept="image/*"  placeholder="이미지 URL">
              </div>
              <div >
                <input type="hidden" name="cmp_img_url" id="cmp_img_url" type="url">
              </div>  
            </div>
            <%-- 이미지 미리보기 --%>
            <script type="text/javascript">
            function setPreview(event) {
              const reader = new FileReader();

              reader.onload = function(event) {
                const img = document.createElement('img');
                img.setAttribute("src", event.target.result);
                img.setAttribute("class", "cmp-img");
                document.querySelector("div#img_preview.preview").appendChild(img);
              };

              reader.readAsDataURL(event.target.files[0]);
              console.log(event.target.files[0]);
            }
            document.getElementById('img_url').addEventListener('change', function(event) {
              const file = event.target.files[0];
              if (file) {
              		const imgList = document.querySelectorAll("div#img_preview.preview");
              		console.log("이미지 저장된 리스트",imgList[0]);
              		if(imgList[0].children.length >= 1) {
              			const firstChild = document.querySelectorAll('div#img_preview.preview.firstChild');
              			console.log("선택된 첫번째 자식",firstChild);
              			imgList[0].removeChild(imgList[0].children[0]);
              		}
                  // 파일을 브라우저 내에서 URL로 변환
                  const imageUrl = URL.createObjectURL(file);
                  console.log("파일로 변환된",file);

                  // 변환된 URL을 input[type="url"] 요소에 담기
                  /* const cmpImgUrl = document.getElementById('cmp_img_url'); */
                  /* cmpImgUrl.value = imageUrl; */
                  const cmpImgUrl = $('#cmp_img_url')
                  // url데이터 변환
                  const formData = new FormData();
                  formData.append('image', file);
                  $.ajax({
                    url: 'https://api.imgbb.com/1/upload?key=536e86c464cec8babb1221e0332e4097',
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (res) {
                    	console.log(res);
                    	console.log(cmpImgUrl);
                    	console.log(cmpImgUrl.val());
                    	cmpImgUrl.val(res.data.url);
                    },
                    error: function (err) {
                      console.error(err);
                    }
                  });
                } else {
                  img.val("");
                }
          });
            </script>
            
            <div class="right-side">
              <div class="cmp-code">
                <label for="cmp_name">업체 이름 :</label> 
                <input name="cmp_name" type="text" id="cmp_name" >
              </div>
              <div class="cmp-address">
                <label for="cmp_address">업체 주소 : </label> 
                <input name="cmp_address" type="text" id="cmp_address" placeholder="도로명주소">
              </div>
              <div class="cmp-address-gu">
                <label for="cmp_address_gu">업체 주소_구 : </label> 
                <input name="cmp_address_gu" type="text" id="cmp_address_gu" placeholder="ex) 강남구">
              </div>
              <div class="cmp-tel-no">
                <label for="cmp_tel_no">전화번호 : </label> 
                <input name="cmp_tel_no" type="text" id="cmp_tel_no">
              </div>
              <div>
                <label for="cmp_holidays">업체 휴무일 : </label> 
                <input type="text" name="cmp_holidays" id="cmp-holidays">
              </div>
              <div>
                <label for="operation_hours">운영시간 : </label> 
                <input type="text" name="operation_hours" id="operation-hours">
              </div>
            </div>
          </div>
          <div class="down-side">
            <div>
              <label class="pet_restriction" for="pet_restriction">반려동물 제한사항 내용</label>
              <!-- <input type="text" name="pet_restriction" id="pet-restriction" > -->
              <input name="pet_restriction" id="pet_restriction" placeholder="ex) 맹견류, 공격성, 짖음 심한 경우 불가, 5차 접종, 매너벨트 필수"></input>
            </div>
          </div>
          <div class="btn-submit">
            <input type="submit" value="등록 완료">
          </div>
        </form>
        <div class="btn-reset" ><button type="reset" onclick="location.href='${context}admin/company/companyList'" >취소</button></div>
      </div>
    </div>
  </div>

</body>
</html>