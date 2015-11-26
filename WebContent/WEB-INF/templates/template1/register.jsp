<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<h2>
	<fmt:message key="title.register" />
</h2>
<div>
	<spring:hasBindErrors htmlEscape="true" name="user">
		<c:if test="${errors.errorCount gt 0}">
			<font color="red"> <c:forEach items="${errors.allErrors}"
					var="error">
					<fmt:message key="${error.defaultMessage}" />
					<br />
				</c:forEach>
			</font>
		</c:if>
	</spring:hasBindErrors>
</div>

<sf:form id="details" method="post"
	action="${pageContext.request.contextPath}/register" commandName="user">

	<table class="formtable">
		<tr>
			<td><fmt:message key="register.username" /></td>
			<td><sf:input class="control" path="username" name="username"
					type="text" /><br /></td>
		</tr>
		<tr>
			<td><fmt:message key="register.email" /></td>
			<td><sf:input class="control" path="email" name="email"
					type="text" /></td>
		</tr>
		<tr>
			<td><fmt:message key="register.password" /></td>
			<td><sf:input id="password" class="control" path="password"
					name="password" type="password" /></td>
		</tr>
		<tr>
			<td><fmt:message key="register.confPassword" /></td>
			<td><input id="confirmpass" class="control" name="confirmpass"
				type="password" />
				<div id="matchpass"></div></td>
		</tr>
		<tr>
			<td><fmt:message key="register.firstname" /></td>
			<td><sf:input class="control" path="firstname" name="firstname"
					type="text" /><br /></td>
		</tr>
		<tr>
			<td><fmt:message key="register.lastname" /></td>
			<td><sf:input class="control" path="lastname" name="lastname"
					type="text" /><br /></td>
		</tr>
		<tr>
			<td><fmt:message key="register.country" /></td>
			<td><sf:select path="country">
					<sf:options items="${ countryList }" />
				</sf:select></td>
		</tr>
		<tr>
			<td><fmt:message key="register.city" /></td>
			<td><sf:input class="control" path="city" name="city"
					type="text" /><br /></td>
		</tr>
		<tr>
			<td><fmt:message key="register.birthdate" /></td>
			<td><sf:input class="control" path="birthdate" name="birthdate"
					type="text" /><br /></td>
		</tr>
		<tr>
			<td><fmt:message key="register.forgotPassQ" /></td>
			<td><sf:input class="control" path="forgotPassQ"
					name="forgotPassQ" type="text" /><br /></td>
		</tr>
		<tr>
			<td><fmt:message key="register.forgotPassA" /></td>
			<td><sf:input class="control" path="forgotPassA"
					name="forgotPassA" type="text" /><br /></td>
		</tr>
		<tr>
			<td></td>
			<td><input class="control"
				value="<fmt:message key="register.confirm" />" type="submit" /></td>
		</tr>
	</table>

</sf:form>
