<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<!DOCTYPE html>
<html>
  <head>
    <title>보담 愛 | 공지사항 수정</title>
    
    <link href="${ resPath }css/webSettings.css" rel="stylesheet">
    <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
    <link href="${ resPath }css/admin-header.css" rel="stylesheet">
    <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.tiny.cloud/1/nd8grynjd8268gdl5ya7l9blew0p9nql98thf7fre8azeeg6/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    
    <style type="text/css">
      .notice-list { margin: 0 auto; width: 1200px; }
      .notice-list-content { margin: 100px; }
      .notice-form { margin: 50px auto; width: 800px; }
      .form-notice-content { width: 100%; height: 200px; }
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
            <h3>공지사항 관리 > 공지사항 수정</h3>
          </div>
  
          <!-- 공지사항 추가폼 -->
          <div class="notice-form">
            <form action="${ context }admin/noticeList/edit/${ notice.notice_no }" method="post">
            
              <div class="row my-2">
                <div class="col-2 fw-bolder">
                  <label for="notice_title">제목</label>
                </div>
                <div class="col">
                  <input type="text" id="notice_title" name="notice_title" class="form-control" 
                    value="${ notice.notice_title }">
                </div>
              </div>
          
              <div class="row my-2">
                <div class="col-2 fw-bolder">
                  <label for="notice_content">내용</label>
                </div>
                <div class="col">
                  <textarea cols="79" rows="10" id="notice_content" name="notice_content"><c:out value="${ notice.notice_content }" /></textarea>
                </div>
              </div>
              
              <!-- 버튼 -->
              <div class="row mt-5">
                <div class="col">
                  <button type="button" class="btn btn-outline-info w-100 btn-lg"
                    onclick="location.href='${ context }admin/noticeList'">뒤로 가기</button>
                </div>
                <div class="col">
                  <button type="submit" class="btn btn-outline-info w-100 btn-lg">수정 완료</button>
                </div>
              </div>
            </form>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

<script>
  tinymce.init({
      selector: 'textarea',
      plugins: 'autolink code link autoresize paste contextmenu image preview',
      toolbar: 'undo redo | fintsizeselect | forecolor | bold italic strikethrough underline | alignleft aligncenter alignright alignjustify | tinycomments | bullist numlist outdent indent | link custom_image | code preview',
      fintsize_formats: '8px 10px 12px 14px 16px 18px 20px 22px 24px 26px 28px 30px 36px 40px 48px',
      tinycomments_mode: 'embedded',
      tinycomments_author: 'Author name',
      fullpage_default_font_size: "16px",
      paste_as_text: true,
      paste_data_images: true,
      branding: false,
      language: "ko_KR",
      menubar: false,
      min_height: 800,
      max_height: 800,
      content_style: 'body { text-align: center; }',
  });
</script>

</html>