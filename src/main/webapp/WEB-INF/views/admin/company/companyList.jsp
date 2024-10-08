<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>보담 愛-업체목록</title>
  
	<link href="${ resPath }css/webSettings.css" rel="stylesheet">
	<link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
	<link href="${ resPath }css/admin-header.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js" ></script>
	<style type="text/css">
		input::-webkit-search-decoration,
		input::-webkit-search-cancel-button,
		input::-webkit-search-results-button,
		input::-webkit-search-results-decoration {
			display: none;
		}
    .cmp-list {
    	margin: 0 auto;
    	width: 1000px;
    }
    .search-group {
    	margin: 20px 0;
    	display: flex;
    	flex-wrap: no-wrap;
    	line-height: 50px;
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
    button[type="reset"] {
      border: none;
      padding: 3px 30px;
      background-color: #BEDAE2;
      border-radius: 10px;
    }
    .cmp-table {
      text-align: center;
    }
    .link { color: #000 }
	</style>
</head>
<body>
	<div id="container" > 
	  <!-- nav -->
	  <jsp:include page="/WEB-INF/views/admin/common/navar.jsp" />
    <!-- 로고 -->
    <div class="main-content">
      <div class="admin-logo">
        <img class="admin-logo-img" alt="관리자로고이미지" src="${resPath}img/logo_admin.png">
      </div>
			<div class="cmp-list">
				<div>
					<h3>업체 관리 > 전체</h3>
				</div>
				<div class="search-group">
					<a href="${ context }admin/company/companyAdd"><button class="btn-new-company">신규 등록</button></a>
					<!-- searchForm -->
					<form class="category-search-box" action="${ context }admin/company/search" method="get" >
						<label class="cmp-category" for="column"></label>
						<select id="column" name="column">
							<option selected>선택</option>
							<option value="cmp_code">업체코드</option>
							<option value="cmp_name">업체명</option>
							<option value="cmp_address">주소별</option>
							<option value="cmp_tel_no">전화번호</option>
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
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="companyList" items="${ companyList }">
								<tr>
									<td><a class="link" href="${ context }admin/company/companyDetail/${companyList.cmp_code}" >${ companyList.cmp_code }</a></td>
									<td><a class="link" href="${ context }admin/company/companyDetail/${companyList.cmp_code}" >${ companyList.cmp_name }</a></td>
                  <td>${ companyList.cmp_address_gu }</td>
                  <td>${ companyList.cmp_tel_no }</td>
                  <td><button type="reset" onclick="location.href='${ context }admin/company/companyEdit/${ companyList.cmp_code }'" >수정</button> </td>
                </tr>
                </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</body>

</html>