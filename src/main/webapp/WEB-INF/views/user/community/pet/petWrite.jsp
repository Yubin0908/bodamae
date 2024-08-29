<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<html>
<head>
  <title>보담 愛 | 반려동물자랑 등록</title>
  <link href="${ resPath }css/webSettings.css" rel="stylesheet">
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <style>
    .content {
      width: 1100px;
      margin: 50px auto;
    }

    .title > p {
      font-size: 1.6em;
      font-weight: bold;
      text-align: center;
    }

    .title > hr {
      background-color: lightgray;
    }

    .sub-text {
      color: gray;
      font-size: 15px;
    }

    table {
      width: 100%;
      height: 500px;
      text-align: center;
    }

    table, th, td {
      text-align: center;
      border-collapse: collapse;
      border: 1px solid lightgray;
    }

    table tr td:nth-of-type(1) {
      background-color: rgba(211, 211, 211, .3);
    }

    input, textarea {
      margin-top: 20px;
      width: 90%;
      padding: 5px 20px;
      border-radius: 15px;
      border: 1px solid gray;
    }

    input[type="file"] {
      border: none;
    }

    textarea {
      margin-top: 10px;
      margin-bottom: -30px;
      width: 90%;
      height: 70px;
      resize: none;
    }

    .btn-group {
      width: 100%;
      margin-left: 45%;
    }

    input[type="submit"] {
      width: 150px;
      height: 50px;
      border-radius: 10px;
      border: none;
    }
  </style>
</head>
<body>
  <%-- 비로그인상태에서 접속 시, 접근 제어 --%>
  <c:if test="${sessionScope.user == null}">
    <script>
      alert('잘못된 접근입니다. 로그인 후 다시 시도해주세요.');
      location.href = '${context}user/login';
    </script>
  </c:if>
  <!--  navar -->
  <jsp:include page="/WEB-INF/views/user/common/navar.jsp" />

  <%-- content --%>
  <div class="content">
    <div class="title">
      <p>반려동물 자랑 하기</p>
    </div>
    <hr>
    <form action="${context}community/pets/write" method="post">
      <table>
        <colgroup>
          <col style="width: 20%">
          <col style="width: 80%">
        </colgroup>
        <tr>
          <td>제 목</td>
          <td><input type="text" name="pet_title" autofocus required></td>
        </tr>
        <tr>
          <td>반려동물 이름</td>
          <td><input type="text" name="pet_name" required></td>
        </tr>
        <tr>
          <td>
            대표이미지
            <br>
            <span class="sub-text">(최대 1장 등록 가능)</span>
          </td>
          <td><input type="file" name="pet_img_form" accept="image/**" required></td>
          <input type="hidden" name="pet_img">
        </tr>
        <tr>
          <td>
            반려동물 사진
            <br>
            <span class="sub-text">(최대 3장 등록 가능)</span>
          </td>
          <td><input type="file" name="pet_detail_img_form" accept="image/**" multiple required></td>
          <input type="hidden" name="pet_detail_img">
        </tr>
        <tr>
          <td class="pet-info">소개글</td>
          <td><textarea name="pet_info" required></textarea></td>
        </tr>
      </table>
      <input type="hidden" name="user_id" value="${sessionScope.user.user_id}">
      <hr>
      <div class="btn-group">
        <input type="submit" value="글등록">
      </div>
    </form>
  </div>
  <!--  footer -->
  <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />

  <%-- API 처리 부분--%>
  <script>
    const img_form = $('input[name="pet_img_form"]');
    const img = $('input[name="pet_img"]');
    const pet_detail_img_form = $('input[name="pet_detail_img_form"]');
    const pet_detail_img = $('input[name="pet_detail_img"]')

    img_form.on('change', function (event) {
      const file = event.target.files[0];
      if (file) {
        const formData = new FormData();
        formData.append('image', file);
        $.ajax({
          url: 'https://api.imgbb.com/1/upload?key=536e86c464cec8babb1221e0332e4097',
          type: 'POST',
          data: formData,
          processData: false,
          contentType: false,
          success: function (res) {
            img.val(res.data.url);
          },
          error: function (err) {
            console.error(err);
          }
        });
      } else {
        img.val("");
      }
    });

    pet_detail_img_form.on('change', function (event) {
      const file = event.target.files;
      for (let i = 0; i < file.length; i++) {
        if (file[i]) {
          const formData = new FormData();
          formData.append('image', file[i]);
          $.ajax({
            url: 'https://api.imgbb.com/1/upload?key=536e86c464cec8babb1221e0332e4097',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (res) {
              console.log(res);
              pet_detail_img.val(pet_detail_img.val() +','+ res.data.url);
            },
            error: function (err) {
              console.error(err);
            }
          });
        } else {
          img.val("");
        }
      }
    });
  </script>
</body>
</html>