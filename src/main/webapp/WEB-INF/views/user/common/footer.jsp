<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<head>
  <style>
  footer {
  	display: flex;
  	width: 100%;
  	background-color: #FFEEC1;
  	text-align: center;
    flex-direction: column;
    margin: 0;
    padding: 0;
  }
  
  .intro { color: #888 }
  .admin-btn { display: flex; justify-content: right; }
  .admin-a { margin: 0 30px 30px 0; }
  </style>
</head>

<footer class="mt-auto">
  <div>
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="${ context }" class="nav-link px-2 text-body-secondary">Home</a></li>
      <li class="nav-item"><a href="${ context }place" class="nav-link px-2 text-body-secondary">장소</a></li>
      <li class="nav-item"><a href="${ context }community/pets" class="nav-link px-2 text-body-secondary">커뮤니티</a></li>
    </ul>

    <p class="intro">Created by 박기훈, 이홍준, 장종락, 장태일, 진혜정</p>
    <p class="text-center text-body-secondary">&copy; 2024 Company, BodamAe Inc</p>
  </div>
  
  <div class="admin-btn">
    <a href="${ context }admin/login" class="nav-link px-2 text-body-secondary admin-a">
      <button type="button" class="btn btn-outline-warning">GO admin</button>
    </a>
  </div>
</footer>
