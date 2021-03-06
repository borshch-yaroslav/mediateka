<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:setLocale value="${cookie.lang.value}" />
<fmt:setBundle basename="translations/admin_clubs" var="msg" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Clubs</title>
<jsp:include page="../general/head.jsp" />
</head>
<body>

	<div class="main">
		<jsp:include page="../general/nav.jsp" />

		<div class="parallax-container my-parallax">
			<div class="parallax">
				<img src="images/parallax1.jpg">
			</div>
			<div class="container section white">

				<div class="row" style="margin-top: -1em">
					<div class="col s12">
						<ul class="tabs">
							<li class="tab col s3"><a href="#requested_clubs"
								style="margin-left: 5em"><fmt:message bundle="${msg}"
										key="requested_clubs" /></a></li>
							<li class="tab col s3"><a href="#all_clubs"><fmt:message
										bundle="${msg}" key="all_clubs" /></a></li>
						</ul>
					</div>
					<jsp:include page="../admin/admin_side_nav.jsp" />
				</div>

				<div id="requested_clubs">
					<c:choose>
						<c:when test="${!(requestedClubs==null)}">
							<ul class="collapsible" data-collapsible="accordion">
								<c:forEach items="${requestedClubs}" var="current">
									<li id="clubNo${current.id}">
										<div class="collapsible-header">
											<a class="button" href="club?clubId=${current.id}"> <c:out
													value="${current.name}" /></a>
										</div>
										<div class="collapsible-body">
											<p>
												<c:out value="${current.description}" />
											</p>
											<p>
												<button class="btn waves-effect green titler" type="submit"
													name="action" style="margin-bottom: 3.5em"
													onclick="activate(${current.id});">
													<fmt:message bundle="${msg}" key="activate_button" />
													<i class="mdi-content-send right"></i>
												</button>

												<button class="btn waves-effect red titler" type="submit"
													name="action" style="margin-bottom: 3.5em"
													onclick="dismiss(${current.id} );">
													<fmt:message bundle="${msg}" key="dismiss_button" />
													<i class="mdi-content-send right"></i>
												</button>
											</p>
										</div>
									</li>
								</c:forEach>
							</ul>
						</c:when>
						<c:otherwise>
							<h2 align="center">
								<fmt:message bundle="${msg}" key="no_clubs" />
							</h2>
						</c:otherwise>
					</c:choose>
				</div>

				<div id="all_clubs">
					<c:choose>
						<c:when test="${!(allClubs==null)}">
							<ul class="collapsible" data-collapsible="accordion">
								<c:forEach items="${allClubs}" var="current">
									<li id="clubNo${current.id}">
										<div class="collapsible-header">
											<a class="button" href="club?clubId=${current.id}"> <c:out
													value="${current.name}" /></a>
										</div>
										<div class="collapsible-body">
											<p>
												<c:out value="${current.description}" />
											</p>
											<p>
												<button class="btn waves-effect red titler" type="submit"
													name="action" style="margin-bottom: 3.5em"
													onclick="dismiss(${current.id} );">
													<fmt:message bundle="${msg}" key="delete_button" />
												</button>
											</p>
										</div>
									</li>
								</c:forEach>
							</ul>
						</c:when>
						<c:otherwise>
							<h2 align="center">
								<fmt:message bundle="${msg}" key="no_clubs" />
							</h2>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	function activate(clubId){

		$.ajax({
			url : 'activateClub',
			type: 'get',
			data : {
				id : clubId
			},
			success : function(data) {
				document.getElementById("clubNo" + clubId).innerHTML = "";					
				}
			}
		);
	}

	
	function dismiss(clubId){

		$.ajax({
			url : 'deleteClub',
			type : 'get', 
			data : {
				id : clubId
			},
			success : function(data) {
				document.getElementById("clubNo" + clubId).innerHTML = "";					
				}
			}
		);
	}

	
		
		
	</script>

	<jsp:include page="../general/footer.jsp" />
</body>
</html>