<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="context" value="/" />

<c:if test="${sessionScope.admin == null}">
  <script>
    alert('해당 페이지는 관리자만 이용가능 합니다.');
    location.href="${ context }/admin/login";
  </script>
</c:if>

<body>
  <div>
    <div class="header-wrap">
      <div class="admin-info">
        <div class="thumbnail">
          <img src="${resPath}img/user-icon.png" class="admin-icon-img" alt="사이트관리자로고">
        </div>
        <div class="admin">
          <p class="admin-name">${sessionScope.admin.user_name} 관리자님</p>
        </div>
      </div>
      <div>
        <ul class="menu-ul">
          <li class="menu-list"><a class="menu-anchor" data-menu="menu1" href="${ context }">사이트로 이동</a></li>
          <li class="menu-list"><a class="menu-anchor" data-menu="menu2" href="${ context }admin/userList">회원 관리</a></li>
          <li class="menu-list"><a class="menu-anchor" data-menu="menu3" href="${ context }admin/adminList">관리자 관리</a></li>
          <li class="menu-list"><a class="menu-anchor" data-menu="menu4" href="${ context }admin/noticeList">공지사항 관리</a></li>
          <li class="menu-list"><a class="menu-anchor" data-menu="menu5" href="${ context }admin/company/companyList">업체 관리</a></li>
          <li class="menu-list"><a class="menu-anchor" data-menu="menu6" href="${ context }admin/logout">로그아웃</a></li>
        </ul>
      </div>
    </div>
  </div>

  <script>
    const li = document.getElementsByClassName("menu-list");
    const anchors = document.getElementsByClassName("menu-anchor");

    window.onload = function() {
      const activeMenu = localStorage.getItem("activeMenu");

      if (activeMenu) {
        const activeItem = document.querySelector(`.menu-anchor[data-menu="${activeMenu}"]`);
        if (activeItem) {
          activeItem.parentElement.classList.add('active');
        }
      }
    };

    function clickEvent(e) {
      const target = e.target;

      // if (target.classList.contains("active")) {
      //   target.parentElement.classList.remove("active");
      //   localStorage.removeItem("activeMenu");
      // } else {
      //   for (let i = 0; i < li.length; i++) {
      //     li[i].classList.remove("active");
      //     li[i].parentElement.classList.remove("active");
      //   }
      //   target.parentElement.classList.add("active");
      //   localStorage.setItem("activeMenu", target.dataset.menu);
      // }

      localStorage.setItem('activeMenu', target.dataset.menu);
      console.log(target.dataset.menu)
      if (target.dataset.menu === localStorage.getItem('activeMenu')) {
        target.parentElement.classList.add('active');
        target.parentElement.style.backgroudColor = '#ffffff';
      }
    }

    // 클릭 이벤트 리스너 추가
    for (let i = 0; i < anchors.length; i++) {
      anchors[i].addEventListener("click", clickEvent);
    }



  </script>
</body>