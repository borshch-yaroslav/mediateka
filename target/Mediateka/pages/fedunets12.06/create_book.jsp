<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="org.apache.log4j.Logger"%>

<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="menu" />
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>create_book</title>
</head>
<body>
	${message}
	<form id="create_book" action="CreateBook" method="post" enctype= "multipart/form-data">
		Book name:<input type="text" name="name" placeholder="book name..." pattern=".{1,45}"><br>
		Book author:<input type="text" name="author" placeholder="book author..." pattern=".{1,45}"><br>
		<p><select size="6" name="type" required>
    		<option disabled>Book type..</option>
    		<c:forEach var="types" items="${book_type}">
    			<option value="${types.getId()}"><c:out value="${types.getName()}"/></option>
    		</c:forEach>
   		</select></p>
   		<p><select size="4" name="meaning" required>
    		<option disabled>Book meaning...</option>
    		<c:forEach var="meanings" items="${book_meaning}">
    			<option value="${meanings.getId()}"><c:out value="${meanings.getName()}"/></option>
    		</c:forEach>
   		</select></p>
   		<p><select size="4" name="language" required>
    		<option disabled>Book language...</option>
    		<c:forEach var="languages" items="${book_language}">
    			<option value="${languages.getId()}"><c:out value="${languages.getName()}"/></option>
    		</c:forEach>
   		</select></p>
   		Book title:<input type="file" name="media" placeholder="book title screenshot..." required><br>
   		<input type="submit" value="Create book">
	</form>
</body>
</html>