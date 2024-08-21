<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<!DOCTYPE html>
<html>
  <head>
    <title>보담 愛 | 공지사항</title>
    
    <link href="${ resPath }css/webSettings.css" rel="stylesheet">
    <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
    <link href="${ resPath }css/admin-header.css" rel="stylesheet">
    <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
    
    <style type="text/css">
      .notice-list { margin: 0 auto; width: 1200px; }
      .notice-list-content { margin: 100px; }
      
      .notice-table { margin: 50px; }
      .display-flex { display: flex; align-items: center; }
      .notice-info { display: inline; margin-right: 20px; }
      .notice-btn { display: inline; margin-left: auto; }
      .notice-content { margin-top: 20px; }
      .notice-content { margin: 50px 0; }
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

      <!-- 컨텐츠 -->
      <!-- 본인이 작업할 영역 -->
      <div class="notice-list">
        <div class="notice-list-content">
          <div>
            <h3>공지사항 관리 > 공지사항</h3>
          </div>
  
          <!-- 공지사항 상세페이지 -->
          <div class="notice-table">
            <h3>${ notice.notice_title }</h3>
            
            <div class="display-flex">
              <div class="notice-info">
                <span class="notice-info">${ notice.user_id }</span>
                <span class="notice-info">${ notice.notice_date }</span>
                <span class="notice-info">조회 ${ notice.notice_hits }</span>
              </div>
              
              <div class="notice-btn">
                <a href="${ context }admin/notice/edit/${notice.notice_no}">
                  <button type="button" class="btn btn-outline-info">수정</button>
                </a>
                <button type="button" class="btn btn-outline-info">삭제</button>
              </div>
              
            </div>
            <hr class="my-2">
            
            <div class="notice-content">
              <p>${ notice.notice_content }</p>
            </div>
            <button type="button" class="btn btn-outline-info w-100 btn-lg"
                  onclick="location.href='${ context }admin/notice'">뒤로 가기</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>