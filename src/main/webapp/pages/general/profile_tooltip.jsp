<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	

<div id="div" style="background:white"> <img src="${userCard.path }" style="width: 5em; margin-top:0.5em; border-radius:50%;" />
	<div style="margin-top: -1em">
		<strong>
			<p> <c:out value="${sessionScope.userCard.getFirstName()}"/>
			    <c:out value="${sessionScope.userCard.getLastName()}"/> </p>

			<p> <c:out value="${sessionScope.userCard.getEmail()}"/> </p>

		</strong>
	</div>
</div>