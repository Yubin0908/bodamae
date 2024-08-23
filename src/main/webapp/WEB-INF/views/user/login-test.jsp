<%@page import="himedia.project.bodamae.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%-- <% 
    String user_id = request.getParameter("user_id");
    String user_password = request.getParameter("user_password");
    User user = (User)session.getAttribute("user");
  %> --%>
  <c:set scope="request" var="user_id" value=""/>
  <%-- <%= user.getUser_id() %>
  <%= user.getUser_password() %> --%>
</body>
</html>