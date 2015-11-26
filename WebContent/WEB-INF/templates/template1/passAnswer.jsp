<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<form id="details" method="post"
	action="${pageContext.request.contextPath}/checkFpAnswer">

	<div>
		<c:if test="${error != null}">
			<fmt:message key="${error}" />
		</c:if>
	</div>
	<table class="formtable">
		<tr>
			<td><label><fmt:message key="passAns.question" /> ${ forgotPassQ }
			</label></td>
		</tr>
		<tr>
			<td><fmt:message key="passAns.answer" /></td>
			<td><input type="text" name="forgotPassA"></td>
		</tr>
		<tr>
			<td><fmt:message key="passAns.newPass" /></td>
			<td><input type="password" name="newPass"></td>

		</tr>
		<tr>
			<td><fmt:message key="passAns.confNewPass" /></td>
			<td><input type="password" name="confNewPass"></td>

		</tr>
		<tr>
			<td><input type="text" name="username" value="${ username }"
				hidden="true"></td>
			<td><input class="control"
				value="<fmt:message key="passAns.confirm" />" type="submit" /></td>
		</tr>
	</table>
</form>