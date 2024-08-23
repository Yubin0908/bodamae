<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<body>
  <div>
    <div class="header-wrap">
      <div class="admin-info">
        <div class="thumbnail">
          <img src="${resPath}img/user-icon.png" class="admin-icon-img" alt="사이트관리자로고">
        </div>
        <div class="admin">
          <p class="admin-name">홍길동 관리자님</p>
        </div>
      </div>
      <div>
        <ul class="menu-ul">

          <li class="menu-list"><a class="menu-anchor" href="${ context }">사이트로 이동</a></li>
          <li class="menu-list"><a class="menu-anchor" href="${ context }admin/userList">회원 관리</a></li>
          <li class="menu-list"><a class="menu-anchor" href="${ context }admin/adminList">관리자 관리</a></li>
          <li class="menu-list"><a class="menu-anchor" href="${ context }admin/noticeList">공지사항 관리</a></li>
          <li class="menu-list"><a class="menu-anchor" href="${ context }admin/company">업체 관리</a></li>
          <li class="menu-list"><a class="menu-anchor" href="#">로그아웃</a></li>
        </ul>
      </div>
    </div>
  </div>

  <script>
  	const li = document.getElementsByClassName("menu-list");
  	const anchors = document.getElementsByClassName("menu-anchor");
  
  	function clickEvent(e) {
  		const target = e.target;
  
  		if (target.classList.contains("active")) {
  			target.parentElement.classList.remove("active");
  		} else {
  			for (let i = 0; i < li.length; i++) {
  				li[i].classList.remove("active");
  				li[i].parentElement.classList.remove("active");
  			}
  			target.parentElement.classList.add("active");
  		}
  	}
  
  	for (let i = 0; i < anchors.length; i++) {
  		anchors[i].addEventListener("click", clickEvent);
  	}
  </script>
</body>