<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div style='width: 100%; float: left; text-align: center;'>
	<div>
		<c:if test="${error != null && ban == null}">
			<fmt:message key="${error}" />
		</c:if>
		<c:if test="${ ban != null }">
			<fmt:message key="login.userIsBannedFromDate" /> ${ban.fromDate} <fmt:message
				key="login.userIsBannedToDate" /> ${ban.toDate}. 
				<c:if test="${ ban.reason != null }">
				<fmt:message key="login.userIsBannedReason" /> ${ban.reason}
				</c:if>
		</c:if>
	</div>
	<form name='form_login'
		action='${ pageContext.request.contextPath }/j_spring_security_check'
		method='POST' accept-charset="UTF-8">
		<div>
			<fmt:message key="login.username" />
		</div>
		<div>
			<input type='text' name='j_username' value=''>
		</div>
		<div>
			<fmt:message key="login.password" />
		</div>
		<div>
			<input type='password' name='j_password' value=''>
		</div>
		<div>
			<fmt:message key="login.rememberme" />
		</div>
		<div>
			<input type='checkbox' name='_spring_security_remember_me'
				checked="checked">
		</div>
		<div>
			<input name="submit" type="submit"
				value="<fmt:message key="login.login" />">
		</div>
		<div>
			<a href="<c:url value='/forgotPass' />"><fmt:message
					key="login.forgotyourpass" /></a>
		</div>
	</form>
</div>