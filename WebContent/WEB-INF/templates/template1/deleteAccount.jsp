<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<c:if test="${error != null}">
				<div class="alert alert-danger text-center" role="alert">
					<fmt:message key="${error}" />
				</div>
			</c:if>
		</div>
	</div>
</div>
<form id="details" method="post"
	action="${pageContext.request.contextPath}/myAccount/deleteAccount">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<br />
				<div class="panel panel-default signup">
					<div class="panel-heading">
						<h1 class="panel-title">
							<fmt:message key="title.account" />
						</h1>
					</div>
					<div class="panel-body">

						<div class="form-group">
							<label class="col-md-4 control-label"><fmt:message
									key="deleteAccount.password" /></label>
							<div class="col-md-8">
								<input name="password" data-validation="length"
									data-validation-length="6-40" class="form-control"
									type="password" />
							</div>
						</div>
						<div class="pull-right">
							<input class="btn btn-danger"
								value="<fmt:message key="deleteAccount.confirm" />"
								type="submit" />
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</form>