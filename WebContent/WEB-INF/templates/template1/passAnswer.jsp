<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<form id="details" method="post"
	action="${pageContext.request.contextPath}/checkFpAnswer">

	<table class="formtable">
		<tr>
			<td><label>${ forgotPassQ } </label></td>
		</tr>
		<tr>
			<td><input type="password" name="forgotPassA"></td>
			<td><label>${ error }</label></td>
		</tr>
		<tr>
			<td><input type="password" name="newPass"></td>

		</tr>
		<tr>
			<td><input type="password" name="confNewPass"></td>

		</tr>
		<tr>
			<td><input type="text" name="username" value="${ username }"
				hidden="true"></td>
			<td><input class="control" value="Wyślij" type="submit" /></td>
		</tr>
	</table>
</form>