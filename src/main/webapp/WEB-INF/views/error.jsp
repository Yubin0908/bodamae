<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />

<!DOCTYPE html>
<html>
<head>
  <link href="${ resPath }css/webSettings.css" rel="stylesheet">
  <style type="text/css">
    body { background-color: #ffcf00; }
    .error-cnt { margin: auto; }
    img { height: 700px; }
  </style>
</head>
<body>
  <div class="error-cnt">
    <img class="error" id="errorImage" alt="error" src="${ resPath }img/error-001.png">
  </div>

</body>
  <script type="text/javascript">
    var tid;  					// 타이머 ID를 저장할 변수
    var st = 5;  				// 카운트다운 초
    var imageIndex = 1; 
    var imageCount = 5; // 에러 이미지 개수

    window.onload = function() { // 페이지 로드 후 매초 updatePage 함수를 호출
      tid = setInterval(updatePage, 1000);
    }

    function updatePage() {
      st--; // 초 감소
      
      var img = document.getElementById('errorImage');
      if (imageIndex > imageCount) { // 이미지 인덱스가 범위를 초과하면 초기화
        imageIndex = 1;
      }
      
   		// 이미지 파일 경로를 설정하고 이미지 업데이트
      img.src = "${resPath}img/error-" + ("00" + imageIndex).slice(-3) + ".png";
      imageIndex++;

      if (st < 0) {  
        clearInterval(tid);    // 타이머 정지
        window.history.back(); // 카운트다운이 끝나면 타이머를 정지하고 이전 페이지로 돌아감
      }
    } 
  </script>
</html>
