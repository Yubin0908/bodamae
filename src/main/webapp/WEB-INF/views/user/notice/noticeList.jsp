<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<html>
<head>
  <title>보담 愛 | 공지사항</title>
  <link rel="stylesheet" href="${ resPath }css/webSettings.css">
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  
  <style type="text/css">
    .content { width: 1200px; margin: 100px auto; }
    .notice-table { width: 1000px; margin: 0 auto; }
    .table { margin: 0 auto; }
  </style>
</head>
<body>
  <%-- header --%>
  <jsp:include page="../common/navar.jsp" />

  <%-- content --%>
  <div class="content">
    <!-- 공지사항 리스트 -->
    <div class="notice-table">
      <table class="table">
        <thead class="table-light">
          <tr>
            <th>게시글 번호 </th>
            <th>작성자</th>
            <th>글 제목</th>
            <th>작성일</th>
            <th>조회수</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="noticeList" items="${ noticeList }">
            <tr>
              <td>
                <a class="text-primary" href="${ context }/noticeList/${ noticeList.notice_no }">${ noticeList.notice_no }</a>
              </td>
              <td>${ noticeList.user_id }</td>
              <td>
                <a class="text-primary" href="${ context }/noticeList/${ noticeList.notice_no }">${ noticeList.notice_title }</a>
              </td>
              <td>
                <fmt:formatDate value="${ noticeList.notice_date }" type="both" />
              </td>
              <td>${ noticeList.notice_hits }</td>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>