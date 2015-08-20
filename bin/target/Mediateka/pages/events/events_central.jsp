<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="org.apache.log4j.Logger"%>

<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="menu" />
<fmt:requestEncoding value="utf-8" />


<div class="parallax-container">
	<div class="parallax">
		<img src="images/parallax1.jpg">
	</div>


	<div class="main_poster">

		<div class="row">

			<div class="col s3 offset-s1_5">
				<div class="card">
					<div class="card-image waves-effect waves-block waves-light">
						<img class="activator" src="images/events/event1.jpg">
					</div>
					<div class="card-content">
						<span class="card-title activator grey-text text-darken-4">Event
							1 <i class="mdi-navigation-more-vert right"></i>
						</span>
						<p>
							<a style="display:inline" href="#!">LINK</a>
							<a style="display:inline; margin-left:11em" href="#!">EDIT</a>
						</p>
					</div>
					<div class="card-reveal">
						<span class="card-title grey-text text-darken-4">Event 1 <i
							class="mdi-navigation-close right"></i></span>
						<p>It takes place right now!.</p>
					</div>
				</div>
			</div>

			<div class="col s3">
				<div class="card">
					<div class="card-image waves-effect waves-block waves-light">
						<img class="activator" src="images/events/event1.jpg">
					</div>
					<div class="card-content">
						<span class="card-title activator grey-text text-darken-4">Event
							2 <i class="mdi-navigation-more-vert right"></i>
						</span>
						<p>
							<a style="display:inline" href="#!">LINK</a>
							<a style="display:inline; margin-left:11em" href="#!">EDIT</a>
						</p>
					</div>
					<div class="card-reveal">
						<span class="card-title grey-text text-darken-4">Event 2 <i
							class="mdi-navigation-close right"></i></span>
						<p>It takes place right now!.</p>
					</div>
				</div>
			</div>

			<div class="col s3">
				<div class="card">
					<div class="card-image waves-effect waves-block waves-light">
						<img class="activator" src="images/events/event1.jpg">
					</div>
					<div class="card-content">
						<span class="card-title activator grey-text text-darken-4">Event
							3 <i class="mdi-navigation-more-vert right"></i>
						</span>
						<p>
							<a style="display:inline" href="#!">LINK</a>
							<a style="display:inline; margin-left:11em" href="#!">EDIT</a>
						</p>
					</div>
					<div class="card-reveal">
						<span class="card-title grey-text text-darken-4">Event 3 <i
							class="mdi-navigation-close right"></i></span>
						<p>It takes place right now!.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>