<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />
<html>

<head>
<title>보담 愛</title>
<link href="${ resPath }css/webSettings.css" rel="stylesheet">
<link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
<script src="${ resPath }js/bootstrap.bundle.min.js"></script>
<link href="${ resPath }css/petlogout.css" rel="stylesheet">


</head>
<body>
  <!--  navar -->
  <jsp:include page="/WEB-INF/views/user/common/navar.jsp" />

  <div class="container">
    <div class="row">
      <form method="post" action="${context}community/board/writeAction">
        <table class="table table-striped"
          style="text-align: center; border: 1px solid #dddddd">
          <thead>
            <tr>
              <th colspan="2"
                style="background-color: #eeeeee; text-align: center;">게시판
                글쓰기 양식</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><input type="text" class="form-control"
                placeholder="글 제목" name="board_title" maxlength="100"></td>
            </tr>
            <tr>
              <td><textarea class="form-control" placeholder="글 내용"
                  name="board_content" style="height: 350px"></textarea></td>

            </tr>
          </tbody>
        </table>
        <input type="submit" class="btn btn-primary pull-right"
          value="등록">
      </form>
    </div>
  </div>




  <!--  footer -->
  <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />


</body>
</html>