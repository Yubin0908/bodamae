<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<!DOCTYPE html>
<html>
  <head>
    <title>보담 愛 | 공지사항 관리</title>
    
    <link href="${ resPath }css/webSettings.css" rel="stylesheet">
    <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
    <link href="${ resPath }css/admin-header.css" rel="stylesheet">
    <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
    
    <style type="text/css">
      /* input x자 표시 없애기 크롬(https://wazacs.tistory.com/33) */
      input::-webkit-search-decoration, 
      input::-webkit-search-cancel-button,
  	  input::-webkit-search-results-button, 
      input::-webkit-search-results-decoration { display: none; }
      
      .notice-list { margin: 0 auto; width: 1200px; }
      .notice-list-content { margin: 100px; }
      
      /* 양쪽 정렬(https://seons-dev.tistory.com/entry/display-flex-좌우-정렬) */
      .search-group {
      	margin: 20px 0;
      	display: flex;
      	flex-wrap: no-wrap;
      	line-height: 50px;
      	justify-content: flex-start;
      }
      
      .btn-new-notice {
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
      	line-height: 59px;
      	border-radius: 10px;
      	margin-left: auto;
      }
      
      form>input {
      	line-height: 30px;
      	border-radius: 10px;
      	border: 1px solid #888;
      }
      
      select#column { 
        margin-left: 5px;
      	width: 100px;
      	padding: 2.5px 6px;
      }
      
      input#search { width: 206px; }
      input#submit { width: 50px; line-height: 30px; background-color: #D9D9D9; }
      
      th { text-align: center; }
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
            <h3>공지사항 관리</h3>
          </div>
  
          <div class="search-group">
            <a href="${ context }admin/noticeList/add">
              <button class="btn-new-notice">등록</button>
            </a>
  
            <!-- searchForm -->
            <form class="category-search-box" action="${ context }admin/noticeList/search">
              <label class="notice-category" for="column"></label> 
              <select id="filter" name="filter">
                <option value="notice_no">게시글 번호</option>
                <option value="notice_title">글 제목</option>
              </select> 
              <label for="search"></label> 
              <input type="search" name="search" id="search"> 
              <input type="submit" id="submit" value="검색">
            </form>
          </div>
          
          <!-- 공지사항 리스트 -->
          <div class="notice-table">
            <table class="table">
              <thead class="table-light">
                <tr>
                  <th>no</th>
                  <th>작성자</th>
                  <th>글 제목</th>
                  <th>작성일</th>
                  <th>조회수</th>
                  <th>상태</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="noticeList" items="${ noticeList }">
                  <tr>
                    <td>
                      <a class="text-primary" href="${ context }admin/noticeList/${ noticeList.notice_no }">${ noticeList.notice_no }</a>
                    </td>
                    <td>${ noticeList.user_id }</td>
                    <td>
                      <a class="text-primary" href="${ context }admin/noticeList/${ noticeList.notice_no }">${ noticeList.notice_title }</a>
                    </td>
                    <td>
                      <fmt:formatDate value="${ noticeList.notice_date }" type="both" />
                    </td>
                    <td>${ noticeList.notice_hits }</td>
                    <td>
                      <a href="${ context }admin/noticeList/edit/${ noticeList.notice_no }">
                        <button type="button" class="btn btn-outline-info" onclick="location.href='${ context }admin/notice/${ noticeList.notice_no }/'">수정</button>
                      </a>
                      
                      <!-- Button trigger modal -->
                      <button type="button" class="btn btn-outline-info" 
                        data-bs-toggle="modal" data-bs-target="#Modal-${ noticeList.notice_no }">삭제</button>
                      
                      <!-- Modal -->
                      <div class="modal fade" id="Modal-${ noticeList.notice_no }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h1 class="modal-title fs-5 text-size-bold" id="exampleModalLabel">해당 게시글을 삭제 하시겠습니까 ?</h1>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                              <button type="button" class="btn btn-info" 
                              onclick="location.href='${ context }admin/noticeList/delete/${ noticeList.notice_no }'">삭제</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>