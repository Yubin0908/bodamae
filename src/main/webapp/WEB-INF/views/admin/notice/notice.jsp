<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<!DOCTYPE html>
<html>
  <head>
    <title>보담 愛 | 로그인</title>
    
    <link href="${ resPath }css/webSettings.css" rel="stylesheet">
    <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
    <link href="${ resPath }css/admin-header.css" rel="stylesheet">
    <script src="${ resPath }js/bootstrap.bundle.min.js" ></script>
    
    <style type="text/css">
      /* input x자 표시 없애기 크롬(https://wazacs.tistory.com/33) */
      input::-webkit-search-decoration, input::-webkit-search-cancel-button,
      input::-webkit-search-results-button, input::-webkit-search-results-decoration
      { display: none; }
      
      .cmp-list { margin: 0 auto; width: 1000px; }
      
      /* 양쪽 정렬(https://seons-dev.tistory.com/entry/display-flex-좌우-정렬) */
      .search-group {
        margin: 20px 0;
        display: flex;
        flex-wrap: no-wrap;
        line-height: 80px;
        justify-content: flex-start;
      }
      
      .btn-new-company {
        display: inline-block;
        margin-right: auto;
        border: 1px solid #888;
        border-radius: 10px;
        font-size: 30px;
        background-color: #D9D9D9;
        text-align: center;
        width: 200px;
        line-height: 56px
      }
      
      /* serch박스 css */
      .category-search-box {
        display: inline-block;
        border: 1px solid #888;
        width: 400px;
        line-height: 60px;
        border-radius: 10px;
      }
      
      form > input {
        line-height: 30px;
        border-radius: 10px;
        border: 1px solid #888;
      }
      
      select #column { padding: 2.5px 6px; }
      input #search { width: 206px; }
      input #submit { width: 50px; line-height: 30px; background-color: #D9D9D9; }
    </style>
  </head>
  
  <body>
    <!-- nav -->
    <jsp:include page="/WEB-INF/views/admin/common/navar.jsp" />
    
    <!-- content -->
<%--     <div>
      <img src="${resPath}img/logo_admin.png" style="width: 125px; height: 125px; position: relative; left: 900px;" alt="logo_admin">
    </div> --%>
    
    <div class="cmp-list">
      <div>
        <h3>공지사항 관리</h3>
      </div>
      <div class="search-group">
        <a href="${ context }admin/company/companyAdd"><button
            class="btn-new-company">등록</button></a>
        <!-- searchForm -->
        <form class="category-search-box" action="${ context }">
          <label class="cmp-category" for="column"></label> 
            <select id="column" name="column">
              <option selected>선택</option>
              <option value="cmp_code">게시글 번호</option>
              <option value="cmp_name">글 제목</option>
            </select>
            <label for="search"></label> 
            <input type="search" name="search" id="search">
            <input type="submit" id="submit" value="검색">
        </form>
      </div>
      <!-- 업체 리스트 -->
      <div class="cmp-table">
        <table class="table">
          <thead class="table-light">
            <tr>
              <th>코드</th>
              <th>업체명</th>
              <th>주소_구</th>
              <th>전화번호</th>
              <th>테마</th>
              <th>상태</th>
            </tr>
          </thead>
          <tbody>
            <%-- <c:forEach var="cmp" items="companyLIst"  > --%>
            <tr>
              <%-- <td>${ cmp.cmp_code }</td>
            <td>${ cmp.cmp_name }</td>
            <td>${ cmp.cmp_address_gu }</td>
            <td>${ cmp.cmp_tel_no }</td>
            <td></td>
            <td></td> --%>
            </tr>
            <%-- </c:forEach> --%>
          </tbody>
        </table>
      </div>
    </div>
    
  </body>
</html>