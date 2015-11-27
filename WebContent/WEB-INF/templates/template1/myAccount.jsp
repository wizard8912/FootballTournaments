<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<h2>
	<fmt:message key="title.account" />
</h2>
<div>
	<c:if test="${!empty errors}">
		<font color="red"> <c:forEach items="${errors}" var="error">
				<fmt:message key="${error}" />
				<br />
			</c:forEach>
		</font>
	</c:if>
</div>
<sf:form id="details" method="post"
	action="${pageContext.request.contextPath}/myAccount"
	commandName="user">
	<div>
		<c:if test="${alert != null}">
			<fmt:message key="${alert}" />
		</c:if>
	</div>
	<table class="formtable">
		<tr>
			<td><fmt:message key="account.username" /></td>
			<td><sf:input class="control" path="username" name="username"
					readonly="true" type="text" /><br /></td>
		</tr>
		<tr>
			<td><fmt:message key="account.email" /></td>
			<td><sf:input class="control" path="email" name="email"
					type="text" /></td>
		</tr>
		<tr>
			<td><fmt:message key="account.firstname" /></td>
			<td><sf:input class="control" path="firstname" name="firstname"
					type="text" /><br /></td>
		</tr>
		<tr>
			<td><fmt:message key="account.lastname" /></td>
			<td><sf:input class="control" path="lastname" name="lastname"
					type="text" /><br /></td>
		</tr>
		<tr>
			<td><fmt:message key="account.country" /></td>
			<td><sf:select path="country">
					<sf:options items="${ countryList }" />
				</sf:select></td>
		</tr>
		<tr>
			<td><fmt:message key="account.city" /></td>
			<td><sf:input class="control" path="city" name="city"
					type="text" /><br /></td>
		</tr>
		<tr>
			<td><fmt:message key="account.birthdate" /></td>
			<td><sf:input class="control" path="birthdate" name="birthdate"
					type="text" /><br /></td>
		</tr>
		<tr>
			<td></td>
			<td><input class="control"
				value="<fmt:message key="account.confirm" />" type="submit" /></td>
		</tr>
	</table>

</sf:form>
<a href="<c:url value='/myAccount/changePassword' />"><fmt:message
		key="title.changePassword" /></a>
<a href="<c:url value='/myAccount/deleteAccount' />"><fmt:message
		key="title.deleteAccount" /></a>
