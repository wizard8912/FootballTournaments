<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<c:if test="${!empty errors}">
				<div id="errors" class="alert alert-danger text-center" role="alert">
					<c:forEach items="${errors}" var="error">
						<fmt:message key="${error}" />
						<br />
					</c:forEach>
				</div>
			</c:if>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<c:if test="${ban == null && error != null}">
				<div class="alert alert-danger text-center" role="alert">
					<fmt:message key="${error}" />
				</div>
			</c:if>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<c:if test="${alert != null}">
				<div class="alert alert-success text-center" role="alert">
					<fmt:message key="${alert}" />
				</div>
			</c:if>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<c:if test="${ ban != null }">
				<div class="alert alert-danger text-center" role="alert">
					<span class="glyphicon glyphicon-exclamation-sign"
						aria-hidden="true"></span> <span class="sr-only">Error:</span>
					<fmt:message key="login.userIsBannedFromDate" />
					${ban.fromDate}
					<fmt:message key="login.userIsBannedToDate" />
					${ban.toDate}.
					<c:if test="${ ban.reason != null }">
						<fmt:message key="login.userIsBannedReason" /> ${ban.reason}
				</c:if>
				</div>
			</c:if>

		</div>
	</div>
</div>