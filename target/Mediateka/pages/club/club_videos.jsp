<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="org.apache.log4j.Logger"%>

<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="menu" />
<fmt:requestEncoding value="utf-8" />

<head>
<jsp:include page="../general/head.jsp" />
<jsp:include page="add_video.jsp" />
</head>

<body>
	<jsp:include page="../general/nav.jsp" />

	<c:if test="${userRole eq 'admin'}">
		<jsp:include page="../admin/admin_side_nav.jsp" />
	</c:if>

	<c:if test="${userRole eq 'user'}">
		<jsp:include page="../user/user_side_nav.jsp" />
	</c:if>

	<div class="section white">
		<div class="container">
			<h3>Club Name</h3>
			<h4>Videos</h4>
			<div class="row" style="margin-left: -7em">
				<div class="col s3">
					<a title="Add video" href="" data-target="modal9"
						class="modal-trigger">
						<div class="col s12 m8 offset-m2 l6 offset-l3 my-card">
							<div class="my-admin-card card-panel grey lighten-5 z-depth-1">
								<div style="margin-top: 2em">
									<div class="row valign-wrapper">
										<div class="col s9">
											<img src="images/club/add_video.png" alt=""
												class="responsive-img" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div style="min-height: 4em"></div>
	<jsp:include page="../general/footer.jsp" />
</body>