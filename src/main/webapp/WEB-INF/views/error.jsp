<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />

<head>
  <link href="${ resPath }css/webSettings.css" rel="stylesheet">
  <style type="text/css">
    body { background-color: #ffcf00; }
    .error-cnt { margin: auto; }
    img { height: 700px; }
  </style>
</head>
<body>
  <div class="error-cnt">
    <img class="error" alt="error" src="${ resPath }img/error.png"></img>
  </div>
  
  <p>돌아갑니다 . . .  <strong class="font-orange" id="viewTimer">5초</strong></p>
</body>

<script type="text/javascript">
	var tid;
  var st = 5;
  
  window.onload = function msg_time(){ 
    tid=setInterval('msg_time()', 1000)
  }
  
  function msg_time() {        
    var m = st;                        
    const cnt = document.getElementById('viewTimer');
    cnt.innerText = m;
    st--;              
    
    if (st < 0) { 
    	window.history.back();            
    }
	} 
</script>
