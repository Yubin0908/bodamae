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
  <link rel="stylesheet" href="${resPath}css/login.css?after">
  <script src="${ resPath }js/bootstrap.bundle.min.js" ></script>
  
</head>

<body>
  <!-- nav -->
  <jsp:include page="/WEB-INF/views/user/common/navar.jsp" />

  <!-- content -->
  <div class="login">
    <div class="out_wrap">
      <div class="select_btn">
        <button class="btn btn-light btn-outline-dark">사용자</button>
        <button class="btn btn-sencondary btn-outline-dark">관리자</button>
      </div>
      <div class="mid_wrap">
        <div class="in_wrap">
          <div class="login_content">
            <div class="login_text">로그인</div>
            <form action="/">
              <div class="text_input">
                <div>
                  <input type="text" placeholder="ID" class="id_input form-control">
                </div>
                <div>
                  <input type="password" placeholder="PW" class="pw_input form-control">
                </div>
                <div class="login_btn">
                  <button type="button" class="btn btn-light btn-outline-dark">sign-up</button>
                  <button type="submit" class="btn btn-primary btn-outline-dark">login</button>
                </div>
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
