<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h2>
	<fmt:message key="title.userStats" />
</h2>
<table class="formtable">
	<tr>
		<td><fmt:message key="userStats.username" /></td>
		<td>${ userStats.username }</td>
	</tr>
	<tr>
		<td><fmt:message key="userStats.registerDate" /></td>
		<td>${ userStats.registerDate}</td>
	</tr>
	<tr>
		<td><fmt:message key="userStats.lastSuccessLogin" /></td>
		<td>${ userStats.lastSuccessLogin }</td>
	</tr>
	<tr>
		<td><fmt:message key="userStats.lastFailedLogin" /></td>
		<td>${ userStats.lastFailedLogin}</td>
	</tr>
	<tr>
		<td><fmt:message key="userStats.loginCount" /></td>
		<td>${ userStats.loginCount}</td>
	</tr>
</table>
