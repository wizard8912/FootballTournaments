<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<h2>
	<fmt:message key="title.appConfig" />
</h2>
<div>
	<c:if test="${alert != null}">
		<fmt:message key="${alert}" />
	</c:if>
</div>

<form id="details" method="post"
	action="${pageContext.request.contextPath}/admin/configure">

	<table class="formtable">
		<fmt:message key="appConfig.banConfig" />
		<tr>
			<td><fmt:message key="appConfig.banConfig.checkLastTime" /></td>
			<td><input class="control" name="checkTimeD" id="checkTimeD"
				value="${checkTimeD}" type="text" />D</td>
			<td><input class="control" name="checkTimeH" id="checkTimeH"
				value="${checkTimeH}" type="text" />H</td>
			<td><input class="control" name="checkTimeM" id="checkTimeM"
				value="${checkTimeM}" type="text" />M</td>
		</tr>
		<tr>
			<td><fmt:message key="appConfig.banConfig.banForTime" /></td>
			<td><input class="control" name="banForTimeD" id="banForTimeD"
				value="${banForTimeD}" type="text" />D</td>
			<td><input class="control" name="banForTimeH" id="banForTimeH"
				value="${banForTimeH}" type="text" />H</td>
			<td><input class="control" name="banForTimeM" id="banForTimeM"
				value="${banForTimeM}" type="text" />M</td>
		</tr>
		<tr>
			<td><fmt:message key="appConfig.banConfig.failedAttemps" /></td>
			<td><input class="control" name="failedAttemps"
				id="failedAttemps" value="${failedAttemps}" type="text" /></td>
		</tr>
		<tr>
			<td></td>
			<td><input class="control"
				value="<fmt:message key="appConfig.banConfig.confirm" />"
				type="submit" /></td>
		</tr>

	</table>
</form>