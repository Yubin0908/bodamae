<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<html>
<head>
  <title>보담 愛</title>
  <link rel="stylesheet" href="${ resPath }css/webSettings.css">
  <link href="${ resPath }css/bootstrap.min.css" rel="stylesheet">
  <script src="${ resPath }js/bootstrap.bundle.min.js"></script>
  
  <style type="text/css">
    .content { width: 1200px; margin: 150px auto; }
    .table { margin: 0 auto; }
    #banner { margin: 0 auto; width: 1200px; }
    
    .sub-content { margin-bottom: 300px; text-align: center; }
    .title-content { margin-bottom: 40px; }
    .title { display: inline; font-size: 40px; font-weight: bold; }
    .title-color { color: #599AD2; } 
    .title-two { margin-top: 15px; }
    
    .add { margin-bottom: 30px; }
    
    .cnt { margin: 0 auto; display: inline-block; height: 310px; }
    .cnt_img { height: 300px; }
  </style>
</head>
<body>
  <%-- header --%>
  <jsp:include page="/WEB-INF/views/user/common/navar.jsp" />
  
  <div id="banner" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img alt="banner1" src="${ resPath }img/banner1.png">
      </div>
      <div class="carousel-item">
        <img alt="banner2" src="${ resPath }img/banner2.png">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#banner" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#banner" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>

  <%-- content --%>
  <div class="content">
    <div class="sub-content">
      <div class="title-content">
        <h1 class="title">반려인들의 이야기가 가득한</h1>
        <h1 class="title title-color"> 커뮤니티</h1>
        <h2 class="title-two">반려생활의 모든 이야기를 시작해보세요 !</h2>
      </div>
      
      <div class="add">
        <button type="button" class="btn btn-outline-info btn-lg" onclick="location.href='${ context }community/pets'">더 보기 ></button>
      </div>
      
      <div class="cnt-list">
        <c:forEach var="petList" items="${ petList }" >
          <div class="cnt">
            <div class="card" style="width: 18rem;">
              <img src="${ petList.pet_img }" class="card-img-top cnt_img" alt="${ petList.pet_name }">
              <div class="card-body">
                <h5 class="card-title">${ petList.pet_name  }</h5>
                <p class="card-text">${ petList.user_id }</p>
                <a href="${ context }community/pets/${ petList.pet_no }" class="btn btn-info">상세보기 ></a>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
    
    <div class="sub-content">
      <div class="title-content">
        <h1 class="title">반려동물 동반 장소를 </h1>
        <h1 class="title title-color">한 번에</h1>
        <h2 class="title-two">지도에서 장소 정보를 확인할 수 있어요 !</h2>
      </div>
      
      <div class="add">
        <button type="button" class="btn btn-outline-info btn-lg" onclick="location.href='${ context }place'">더 보기 ></button>
      </div>
      
      <div class="cnt-list">
        <c:forEach var="companyList" items="${ companyList }" varStatus="status">
          <div class="cnt">
            <div class="card" style="width: 18rem;">
              <img src="${ companyUrlList[status.index].cmp_img_url }" class="card-img-top cnt_img" alt="업체_${ companyUrlList[status.index].cmp_img_no }">
              <div class="card-body">
                <h5 class="card-title">${ companyList.cmp_name  }</h5>
                <p class="card-text">서울 특별시 ${ companyList.cmp_address_gu }</p>
                <a href="${ context }place/" class="btn btn-info">상세보기 ></a>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
  
  <%-- footer --%>
  <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</body>
</html>
