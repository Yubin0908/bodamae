<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js" ></script>
  <style>
  .footer {
          position: absolute;
          bottom: 0;
          width: 100%;
          background-color: #FFEEC1;
          text-align: center;
      }
      .intro { color: #888 }
  </style>
</head>
<body>
  <div class="footer">
    <footer class="py-3 my-4">
      <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="${ context }" class="nav-link px-2 text-body-secondary">Home</a></li>
          <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">장소</a></li>
          <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">테마별</a></li>
          <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">커뮤니티</a></li>
      </ul>
      <p class="intro" >Created by 진혜정, 장태일, 장종락, 이홍준, 박기훈</p>
      <p class="text-center text-body-secondary">&copy; 2024 Company, BodamAe Inc</p>
    </footer>
  </div>
</body>
</html>