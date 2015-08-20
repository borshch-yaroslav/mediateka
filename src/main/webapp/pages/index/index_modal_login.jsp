<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:setLocale value="${cookie.lang.value}" />
<fmt:setBundle basename="translations/index" var="msg" scope="session" />
<jsp:useBean id="consts" class="com.mediateka.util.RegExps"
	scope="session" />
<script type="text/javascript" src="js/index.js"></script>
<div id="modal1" class="modal">
	<div class="modal-content">
		<form action="login" method="post" id="loginForm"
			onsubmit="return checkSubmit();">
			<div class="container" style="margin-top: 1em; width: 90%">
				<button style="margin-left: 4em" class="btn titler"
					type="submit" name="login">
					<fmt:message bundle="${msg}" key="login_header" />
				</button>
				<label id="message" style="color: red; margin-left:1em"></label>
				<div class="row" style="margin-top: 1em">
					<div class="input-field col s6">
						<i class="mdi-action-account-circle prefix"></i> <input
							id="login_log" class="validate" type="text" name="email"
							pattern="${consts.getEmail() }" required /> <label
							class="active" for="login_log"> <fmt:message
								bundle="${msg}" key="email_field" />
						</label>
					</div>

					<div class="input-field col s6">
						<i class="small mdi-communication-vpn-key prefix"></i><input
							id="password_log" class="validate" type="password"
							name="password" required /> <label for="password_log"> <fmt:message
								bundle="${msg}" key="password_field" />
						</label>
					</div>

					<div class="row">
						<div class="input-field col s6">
							<a href="invalidatePassword"> <fmt:message bundle="${msg}"
									key="forgot_password" />
							</a>
						</div>
						<div class="col s6">
							<a href="vkLogin"><img alt="VK" src="images/vk.png"
								height="40px;"></a> <a href="googleLogin"><img
								alt="Google+" src="images/google.png" height="40px;"></a> <a
								href="facebookLogin"><img alt="Facebook"
								src="images/facebook.png" height="40px;"></a>
						</div>
					</div>

				</div>
			</div>
		</form>
	</div>
</div>