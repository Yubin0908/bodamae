<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<html>
<head>
	
  <title>보담 愛</title>
  <link href="${ resPath }css/webSettings.css" rel="stylesheet">
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  <style>
  
    #content {
    	width: 1200px;
    	margin: 0 auto 50px;
    }
    
    #community_text {
      font-size: 36px;
      margin: 10px 0 20px;
    }

    .content_img {
      width: 50%;
      height: 400px;
    }
    
    table {
    	width: 100%;
    	table-layout: fixed;
    	border-collapse: collapse;
    	border: 1px solid black;
    }
    
    .upper_tr {
    	width: 300px;
    	height: 50px;
    	font-size: 20px;
    }
    
    .upper_tr > th {
    	background-color: #ddd;
    	vertical-align: middle;
    	text-align: center;
    	border: 1px solid black;
    }
    
    .upper_tr > td {
    	background-color: #fff;
    	vertical-align: middle;
    	padding-left: 10px;
    	border: 1px solid black;
    }
    
    .middle_tr {
    	border: 1px solid black;
    }
    
    .div_img {
      display: block;
      width: 100%;
      text-align: center;
    }
    
    .under_tr {
    	height: 50px;
    	border: 1px solid black;
      font-size: 20px
    }
    
    .under_tr > th {
    	background-color: #ddd;
    	border: 1px solid black;
    	text-align: center;
    	vertical-align: middle;
    }
    
    .under_tr > td {
      padding-left: 10px;
      vertical-align: middle;
    }
    
    .to_list_btn {
      width: 160px;
      height: 60px;
      border: 1px solid black;
      border-radius: 15px;
      background-color: #599AD2;
      font-size: 20px;
      color: whitesmoke;
      margin-top: 50px;
    }
    
  </style>
</head>
<body>
  <!-- nav -->
  <jsp:include page="/WEB-INF/views/user/common/navar.jsp" />
	<div id="content">
		<div id="community_text">커뮤니티 > 반려동물 자랑</div>
		<div id="content_table">
			<table>
				<tbody>
					<tr class="upper_tr">
						<th id="title_th">제목</th>
						<td id="title_td">${pet.pet_title}</td>
						<th id="pet_name_th">반려동물 이름</th>
						<td id="pet_name_td">${pet.pet_name}</td>
					</tr>
					<tr class="upper_tr">
						<th id="author_th">작성자</th>
						<td id="author_td">${pet.user_id}</td>
						<th id="date_th">등록일</th>
						<td id="date_td"><fmt:formatDate value="${pet.pet_date}" pattern="YYYY년 MM월 dd일 hh:mm a" /></td>
					</tr>
					<tr class="middle_tr">
						<td colspan="4">
              <div class="div_img">
                <c:set var="images" value="${fn:split(pet.pet_detail_img, ',')}" />
                <c:forEach var="image" items="${images}" varStatus="varStatus">
                  <img src="${image}" alt="${pet.pet_name}" class="content_img">
                </c:forEach>
                <p>
                  ${pet.pet_info}
                </p>
              </div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
    <button class="to_list_btn" onclick="location.href='${context}community/pets'">목록으로</button>
    <c:if test="${sessionScope.user.user_id.equals(pet.user_id)}">
      <button class="to_list_btn" onclick="location.href='${context}community/pets/modify/${pet.pet_no}'">수정하기</button>
      <button class="to_list_btn" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제하기</button>

      <!-- Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-body">
              해당 게시물을 삭제하시겠습니까?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
              <button type="button" class="btn btn-primary" onclick="location.href='${context}community/pets/delete/${pet.pet_no}'">삭제</button>
            </div>
          </div>
        </div>
      </div>
    </c:if>
	</div>
  <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</body>
</html>