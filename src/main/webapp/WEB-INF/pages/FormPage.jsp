<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form:form action="validateForm.html" modelAttribute="user" method="post">
    <label for="nameInput">Name: </label>
    <form:input path="userName" id="nameInput"></form:input>
    <form:errors path="userName" cssclass="error"></form:errors>
    <br />
     <label for="nameInput1">Name: </label>
    <form:input path="passWord" id="nameInput1"></form:input>
    <form:errors path="passWord" cssclass="error"></form:errors>
    <br />
     <label for="nameInput2">Name: </label>
    <form:input path="firstName" id="nameInput2"></form:input>
    <form:errors path="firstName" cssclass="error"></form:errors>
    <br />
     <label for="nameInput3">Name: </label>
    <form:input path="lastName" id="nameInput3"></form:input>
    <form:errors path="lastName" cssclass="error"></form:errors>
    <br />
     
    <label for="emailInput">Email: </label>
    <form:input path="email" id="emailInput"></form:input>
    <form:errors path="email" cssclass="error"></form:errors>
    <br />
     
    <label for="birthdayInput">Birthday: </label>
    <form:input path="birthDate" id="birthdayInput" placeholder="YYYY/MM/DD"></form:input>
    <form:errors path="birthDate" cssclass="error"></form:errors>
    <br />
     
    <label for="genderOptions">Gender: </label>
    <form:select path="gender" id="genderOptions">
        <form:option value="">Select Gender</form:option>
        <form:option value="1">Male</form:option>
        <form:option value="0">Female</form:option>
    </form:select>
    <form:errors path="gender" cssclass="error"></form:errors>
    <br />
     
 	<br />
    <input type="submit" value="Submit" />
</form:form>
</body>
</html>