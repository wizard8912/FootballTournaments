<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${error != null}">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="alert alert-danger text-center" role="alert">
					<span class="glyphicon glyphicon-exclamation-sign"
						aria-hidden="true"></span> <span class="sr-only">Error:</span>
					<fmt:message key="${error}" />
				</div>
			</div>
		</div>
	</div>
</c:if>

<sf:form id="details" method="post"
	action="${pageContext.request.contextPath}/forgotPass">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<br />
				<div class="panel panel-default signup">
					<div class="panel-heading">
						<h1 class="panel-title">
							<fmt:message key="title.forgotPass" />
						</h1>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<div class="text-center">
								<label><fmt:message key="forgotPass.info" /></label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"><fmt:message
									key="forgotPass.username" /></label>
							<div class="col-md-8">
								<input class="form-control" type='text' name='username'>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"><fmt:message
									key="forgotPass.email" /></label>
							<div class="col-md-8">
								<input class="form-control" type='text' name='email'>
							</div>
						</div>
						<div class="form-group">
							<div class="pull-right">
								<div class="col-md-8">
									<input class="btn btn-success"
										value="<fmt:message key="forgotPass.confirm" />" type="submit" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</sf:form>
