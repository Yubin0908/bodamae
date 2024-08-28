<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />
<html>

<head>
<title>보담 愛 | 장소</title>
<link href="${ resPath }css/webSettings.css" rel="stylesheet">
<link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
<script src="${ resPath }js/bootstrap.bundle.min.js"></script>

<style type="text/css">
      /* input x자 표시 없애기 크롬(https://wazacs.tistory.com/33) */
      input::-webkit-search-decoration,
      input::-webkit-search-cancel-button,
      input::-webkit-search-results-button,
      input::-webkit-search-results-decoration {
        display: none;
      }
      .search-group {
        margin: 20px 0;
        display: flex;
        flex-wrap: no-wrap;
        line-height: 50px;
        justify-content: flex-start;
      }
      .place-list-page {
        width: 1200px;
        margin: 0 auto;
      }
      .place-list {
        width: 1100px;
        margin: 50px;
        margin-top: 100px;
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
        padding: 2.5px 6px;
      }
      input#search {
        width: 206px;
        padding-left: 10px;
      }
      input#submit {
        width: 50px;
        line-height: 30px;
        background-color: #D9D9D9;
      }
      .card {
        margin: 10px;
        
      }
      .card-img-top {
        height: 280px;
        padding: 2px;
        object-fit: cover;
      }
</style>
</head>
<body>
	<div id="container">
		<!--  navar -->
		<jsp:include page="/WEB-INF/views/user/common/navar.jsp" />
    <div class="place-list-page" >
  		<div class="place-list">
  			<div class="place-list-header">
  				<div>
  					<h3>장소</h3>
  				</div>
          <!-- 검색 -->
          <div class="search-group">
            <!-- searchForm -->
            <form class="category-search-box" action="${ context }place/search" method="get" >
              <label class="cmp-category" for="column"></label>
              <select id="column" name="column">
                <option selected>선택</option>
                <option value="cmp_name">장소명</option>
                <option value="cmp_address">주소별</option>
              </select>
              <label for="search"></label>
              <input type="search" name="search" id="search">
              <input type="submit" id="submit" value="검색">
            </form>
          </div>        
  			</div>
        <div class="place-list-content" >
          <div class="row row-cols-1 row-cols-md-4 g-8"  >
            <c:forEach var="placeList" items="${ placeList }" varStatus="status">
              <div class="col">
                <div class="card w-100" style="width: 18rem;">
                  <img src="${ placeList.cmp_img_url }" class="card-img-top cnt_img" alt="업체_${ placeList.cmp_img_no }">
                  <div class="card-body">
                    <h5 class="card-title">${ placeList.cmp_name  }</h5>
                    <p class="card-text">서울특별시 ${ placeList.cmp_address_gu }</p>
                    <a href="${ context }place/${ placeList.cmp_name }" class="btn btn-info">상세보기 ></a>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>
  		</div>
    </div>
	</div>

		<!--  footer -->
	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</body>
</html>