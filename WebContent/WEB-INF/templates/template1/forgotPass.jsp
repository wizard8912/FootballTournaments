<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h2>
	<fmt:message key="title.forgotPass" />
</h2>
<sf:form id="details" method="post"
	action="${pageContext.request.contextPath}/forgotPass">

	<table class="formtable">
		<tr>
			<td><fmt:message key="forgotPass.username" /></td>
			<td><input class="control" name="username" type="text" /><br /></td>
		</tr>
		<tr>
			<td><fmt:message key="forgotPass.email" /></td>
			<td><input class="control" name="email" type="text" /></td>
		</tr>
		<tr>
			<td><c:if test="${error != null}">
					<fmt:message key="${error}" />
				</c:if></td>
		</tr>
		<tr>
			<td></td>
			<td><input class="control"
				value="<fmt:message key="forgotPass.confirm" />" type="submit" /></td>
		</tr>
	</table>
</sf:form>