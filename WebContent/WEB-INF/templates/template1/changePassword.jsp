<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>
	<fmt:message key="title.changePassword" />
</h2>

<form id="details" method="post"
	action="${pageContext.request.contextPath}/myAccount/changePassword">
	<div>
		<label><c:if test="${ alert != null}">${ alert }</c:if></label>
	</div>
	<table class="formtable">
		<tr>
			<td><fmt:message key="changePassword.actualPassword" /></td>
			<td><input class="control" name="actPass" type="password" /><br /></td>
		</tr>
		<tr>
			<td><fmt:message key="changePassword.newPassword" /></td>
			<td><input class="control" name="newPass" type="password" /><br /></td>
		</tr>
		<tr>
			<td><fmt:message key="changePassword.confNewPassword" /></td>
			<td><input class="control" name="confNewPass" type="password" /><br /></td>
		</tr>
		<tr>
			<td></td>
			<td><input class="control"
				value="<fmt:message key="changePassword.confirm" />" type="submit" /></td>
		</tr>
	</table>

</form>
