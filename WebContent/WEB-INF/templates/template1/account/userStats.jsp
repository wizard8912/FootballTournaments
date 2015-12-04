<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<div class="row">
		<div class="col-md-8 col-md-offset-3">
			<br />
			<div class="panel panel-default signup">
				<div class="panel-heading">
					<h1 class="panel-title">
						<fmt:message key="title.userStats" />
					</h1>
				</div>
				<div class="panel-body">

					<div class="form-group row">
						<label class="col-md-4 control-label"><fmt:message
								key="userStats.username" /></label>
						<div class="col-md-4">${ userStats.username }</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4 control-label"><fmt:message
								key="userStats.registerDate" /></label>
						<div class="col-md-4">${ userStats.registerDate }</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4 control-label"><fmt:message
								key="userStats.lastSuccessLogin" /></label>
						<div class="col-md-4">${ userStats.lastSuccessLogin }</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4 control-label"><fmt:message
								key="userStats.lastFailedLogin" /></label>
						<div class="col-md-4">${ userStats.lastFailedLogin }</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4 control-label"><fmt:message
								key="userStats.loginCount" /></label>
						<div class="col-md-4">${ userStats.loginCount }</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>