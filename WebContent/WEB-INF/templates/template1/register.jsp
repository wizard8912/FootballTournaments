<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<div class="container">
	<div class="row">
		<div class="col-md-12">
			<spring:hasBindErrors htmlEscape="true" name="user">
				<c:if test="${errors.errorCount gt 0}">
					<div id="errors" class="alert alert-danger text-center" role="alert">
						<span class="glyphicon glyphicon-exclamation-sign"
							aria-hidden="true"></span> <span class="sr-only">Error:</span>
						<c:forEach items="${errors.allErrors}" var="error">
							<fmt:message key="${error.defaultMessage}" />
							<br />
						</c:forEach>
					</div>
				</c:if>
			</spring:hasBindErrors>
		</div>
	</div>
</div>

<sf:form id="details" method="post"
	action="${pageContext.request.contextPath}/register" commandName="user">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<br />
				<div class="panel panel-default signup">
					<div class="panel-heading">
						<h1 class="panel-title">
							<fmt:message key="title.register" />
						</h1>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" action="">
							<div class="form-group">
								<label class="col-md-4 control-label"><fmt:message
										key="register.username" /></label>
								<div class="col-md-8">
									<sf:input data-validation="length"
										data-validation-length="3-30" class="form-control"
										path="username" name="username" type="text" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label"><fmt:message
										key="register.password" /></label>
								<div class="col-md-8">
									<sf:input data-validation="length"
										data-validation-length="6-40" class="form-control"
										path="password" name="password" type="password" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label"><fmt:message
										key="register.confPassword" /></label>
								<div class="col-md-8">
									<sf:input data-validation="length"
										data-validation-length="6-40" class="form-control"
										path="confPassword" name="confirmpass" type="password" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label"><fmt:message
										key="register.email" /></label>
								<div class="col-md-8">
									<sf:input data-validation="email" class="form-control"
										path="email" name="email" type="text" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label"><fmt:message
										key="register.firstname" /></label>
								<div class="col-md-8">
									<sf:input data-validation="length"
										data-validation-length="min0" class="form-control"
										path="firstname" name="firstname" type="text" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label"><fmt:message
										key="register.lastname" /></label>
								<div class="col-md-8">
									<sf:input data-validation="length"
										data-validation-length="min0" class="form-control"
										path="lastname" name="lastname" type="text" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label"><fmt:message
										key="register.birthdate" /></label>
								<div class="input-group date form_date col-md-8" data-date=""
									data-date-format="dd MM yyyy" data-link-field="dtp_input2"
									data-link-format="yyyy-mm-dd">
									<sf:input data-validation="date"
										data-validation-format="yyyy-MM-dd" class="form-control"
										path="birthdate" name="birthdate" type="text" />
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-calendar"></span></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label"><fmt:message
										key="register.country" /></label>
								<div class="col-md-8">
									<sf:select data-validation="length"
										data-validation-length="min0" class="form-control"
										path="country" name="country" type="text">
										<sf:options items="${ countryList }" />
									</sf:select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label"><fmt:message
										key="register.city" /></label>
								<div class="col-md-8">
									<sf:input data-validation="length"
										data-validation-length="min0" class="form-control" path="city"
										name="city" type="text" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label"><fmt:message
										key="register.forgotPassQ" /></label>
								<div class="col-md-8">
									<sf:input data-validation="length"
										data-validation-length="10-200" class="form-control"
										path="forgotPassQ" name="forgotPassQ" type="text" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label"><fmt:message
										key="register.forgotPassA" /></label>
								<div class="col-md-8">
									<sf:input data-validation="length"
										data-validation-length="10-100" class="form-control"
										path="forgotPassA" name="forgotPassA" type="text" />
								</div>
							</div>
							<div class="pull-right">
								<input class="btn btn-success"
									value="<fmt:message key="register.confirm" />" type="submit" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</sf:form>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.2.8/jquery.form-validator.min.js"></script>
<script>
	var lang = window['${pageContext.response.locale}'];
	var $messages = $('#errors');
	$.validate({
		language : lang,
		validateOnBlur : false, // disable validation when input looses focus
		errorMessagePosition : 'top',
		scrollToTopOnError : false
	// Set this property to true if you have a long form
	});
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-datetimepicker.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/bootstrap/js/locales/bootstrap-datetimepicker.pl.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/bootstrap/js/locales/bootstrap-datetimepicker.uk.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/jquery.validate.min.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/messages_pl.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.form_date').datetimepicker({
			language : '${pageContext.response.locale}',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0,
			format : 'yyyy-mm-dd'
		});
	});
</script>

