<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1>All Posts</h1>
<c:forEach var="x" items="${list }">
	<p>Title: ${x.title}</p>
	<p>Description: ${x.description}</p>
	<p>Updated: ${x.updated_at}</p>
	<p>Author: ${x.user.firstName } + ${x.user.lastName }</p>
	<p>Image: ${x.user.avatar }</p>
	<p>Post ID: ${x.id }</p>
	<p>User ID: ${x.user.id }</p>
	<br>
</c:forEach>
</body>
</html>