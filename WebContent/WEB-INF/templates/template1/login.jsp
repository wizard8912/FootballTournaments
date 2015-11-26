<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div style='width: 100%; float: left; text-align: center;'>
	<div>
		<c:if test="${ error != null}">${ error }</c:if>
	</div>
	<form name='form_login'
		action='${ pageContext.request.contextPath }/j_spring_security_check'
		method='POST' accept-charset="UTF-8">
		<div>Username:</div>
		<div>
			<input type='text' name='j_username' value=''>
		</div>
		<div>Hasło:</div>
		<div>
			<input type='password' name='j_password' value=''>
		</div>
		<div>Remember me:</div>
		<div>
			<input type='checkbox' name='_spring_security_remember_me'
				checked="checked">
		</div>
		<div>
			<input name="submit" type="submit" value="Zaloguj">
		</div>
		<div>
			<a href="<c:url value='/forgotPass' />">Forgot your password?</a>
		</div>
	</form>
</div>