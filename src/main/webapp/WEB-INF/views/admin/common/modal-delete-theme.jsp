<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />
<html>
<head>
  <title>보담 愛</title>
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js" ></script>
</head>
<body>
  <div style="width: 400px; height : 250px; border: .5px solid gray; box-shadow: 2px 3px 3px #999; border-radius: 15px; position: fixed; left: 50%; top: 50%; transform: translate(-50%, -50%); z-index: 9999">
    <p style="text-align: center; position: relative; top: 75px; font-weight: bold">해당 테마를 <br/>삭제하시겠습니까?</p>
    <div class="btn-group position-relative" style="left: 50px; top: 100px;">
      <button type="button" class="p-2 fw-bold" style="height: 57px; width: 100px; border-radius: 15px; border: none">취소</button>
      <button type="button" class="p-2 position-relative fw-bold" style="height: 57px; width: 100px; border-radius: 15px; border: none; left: 100px">삭제</button>
    </div>
  </div>
</body>
</html>
