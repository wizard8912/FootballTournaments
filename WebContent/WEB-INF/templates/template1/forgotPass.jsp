<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<sf:form id="details" method="post"
	action="${pageContext.request.contextPath}/forgotPass">

	<table class="formtable">
		<tr>
			<td>Username:</td>
			<td><input class="control" name="username" type="text" /><br /></td>
		</tr>
		<tr>
			<td>Email:</td>
			<td><input class="control" name="email" type="text" /></td>
		</tr>
		<tr>
			<td>${ error }</td>
		</tr>
		<tr>
			<td></td>
			<td><input class="control" value="Wyślij" type="submit" /></td>
		</tr>
	</table>
</sf:form>