<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<html>
<head>
  <title>보담 愛 | 로그인</title>

  <link href="${ resPath }css/webSettings.css" rel="stylesheet">
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js" ></script>
  
  <style type="text/css">
    .login { width: 1200px; margin: 0 auto; text-align: center; }
  
  </style>
  
</head>

<body>
  <!-- nav -->
  <jsp:include page="/WEB-INF/views/user/common/navar.jsp" />

  <!-- content -->
  <div class="login">
    <div>
      <div style="text-align: center;">
        <button class="btn btn-light btn-outline-dark" style="width: 250px; height: 55px">사용자</button>
        <button class="btn btn-sencondary btn-outline-dark" style="width: 250px; height: 55px">관리자</button>
      </div>
      <div class="text-bg-light p-3 border border-black d-flex justify-content-center" style="width: 500px; height: 500px">
        <div class="text-bg-light p-3 border border-black d-flex justify-content-center" style="width: 380px; height: 300px">
          <div class="translate-middle"  style="text-align: center">
            <div class=" fs-1 fw-bold" style="margin: 20px auto 20px;">로그인</div>
            <form action="/">
              <div style="width: 280px; height: 35px">
                <input type="text" placeholder="ID" class="form-control">
              </div>
              <div style="width: 280px; height: 35px; margin: 10px auto 30px;">
                <input type="password" placeholder="PW" class="form-control">
              </div>
              <div>
                <button type="button" class="btn btn-light btn-outline-dark">sign-up</button>
                <input type="submit" value="login" class="btn btn-primary btn-outline-dark">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- footer -->
  <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
  
</body>
</html>
