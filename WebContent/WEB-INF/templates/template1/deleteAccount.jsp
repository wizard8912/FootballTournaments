<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<form id="details" method="post"
	action="${pageContext.request.contextPath}/myAccount/deleteAccount">

	<div>
		<c:if test="${error != null}">
			<fmt:message key="${error}" />
		</c:if>
	</div>
	<table class="formtable">
		<tr>
			<td><fmt:message key="deleteAccount.password" /></td>
			<td><input type="password" name="password" /></td>
		</tr>
		<tr>
			<td><input class="control"
				value="<fmt:message key="deleteAccount.confirm" />" type="submit" /></td>
		</tr>
	</table>
</form>