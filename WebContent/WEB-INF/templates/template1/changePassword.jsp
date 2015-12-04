<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.2.43/jquery.form-validator.min.js"></script>

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
		<div class="col-md-6 col-md-offset-3">
			<br />
			<div class="panel panel-default signup">
				<div class="panel-heading">
					<h1 class="panel-title">
						<fmt:message key="title.account" />
					</h1>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" method="post"
						action="${pageContext.request.contextPath}/myAccount/changePassword">
						<div class="form-group">
							<label class="col-md-4 control-label"><fmt:message
									key="changePassword.actualPassword" /></label>
							<div class="col-md-8">
								<input name="actPass" data-validation="length"
									data-validation-length="6-40" class="form-control"
									type="password" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"><fmt:message
									key="changePassword.newPassword" /></label>
							<div class="col-md-8">
								<input name="newPass" data-validation="length"
									data-validation-length="6-40" class="form-control"
									type="password" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"><fmt:message
									key="changePassword.confNewPassword" /></label>
							<div class="col-md-8">
								<input class="form-control" name="confNewPass"
									data-validation="confirmation"
									data-validation-confirm="newPass" type="password" />
							</div>
						</div>
						<div class="pull-right">
							<input class="btn btn-success"
								value="<fmt:message key="changePassword.confirm" />"
								type="submit" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	var messages = {
		errorTitle : '<fmt:message key="jquery.validate.errorTitle"/>',
		requiredFields : '<fmt:message key="jquery.validate.requiredFields"/>',
		badTime : '<fmt:message key="jquery.validate.badTime"/>',
		badEmail : '<fmt:message key="jquery.validate.badEmail"/>',
		badTelephone : '<fmt:message key="jquery.validate.badTelephone"/>',
		badSecurityAnswer : '<fmt:message key="jquery.validate.badSecurityAnswer"/>',
		badDate : '<fmt:message key="jquery.validate.badDate"/>',
		lengthBadStart : '<fmt:message key="jquery.validate.lenghtBadStart"/>',
		lengthBadEnd : '<fmt:message key="jquery.validate.lengthBadEnd"/>',
		lengthTooLongStart : '<fmt:message key="jquery.validate.lengthTooLongStart"/>',
		lengthTooShortStart : '<fmt:message key="jquery.validate.lengthTooShortStart"/>',
		notConfirmed : '<fmt:message key="jquery.validate.notConfirmed"/>',
		badDomain : '<fmt:message key="jquery.validate.badDomain"/>',
		badUrl : '<fmt:message key="jquery.validate.badUrl"/>',
		badCustomVal : '<fmt:message key="jquery.validate.badCustomVal"/>',
		andSpaces : '<fmt:message key="jquery.validate.andSpaces"/>',
		badInt : '<fmt:message key="jquery.validate.badInt"/>',
		badSecurityNumber : '<fmt:message key="jquery.validate.badSecurityNumber"/>',
		badUKVatAnswer : '<fmt:message key="jquery.validate.badUKVatAnswer"/>',
		badStrength : '<fmt:message key="jquery.validate.badStrength"/>',
		badNumberOfSelectedOptionsStart : '<fmt:message key="jquery.validate.badNumberOfSelectedOptionsStart"/>',
		badNumberOfSelectedOptionsEnd : '<fmt:message key="jquery.validate.badNumberOfSelectedOptionsEnd"/>',
		badAlphaNumeric : '<fmt:message key="jquery.validate.badAlphaNumeric"/>',
		badAlphaNumericExtra : '<fmt:message key="jquery.validate.badAlphaNumericExtra"/>',
		wrongFileSize : '<fmt:message key="jquery.validate.wrongFileSize"/>',
		wrongFileType : '<fmt:message key="jquery.validate.wrongFileType"/>',
		groupCheckedRangeStart : '<fmt:message key="jquery.validate.groupCheckedRangeStart"/>',
		groupCheckedTooFewStart : '<fmt:message key="jquery.validate.groupCheckedTooFewStart"/>',
		groupCheckedTooManyStart : '<fmt:message key="jquery.validate.groupCheckedTooManyStart"/>',
		groupCheckedEnd : '<fmt:message key="jquery.validate.groupCheckedEnd"/>',
		badCreditCard : '<fmt:message key="jquery.validate.badCreditCard"/>',
		badCVV : '<fmt:message key="jquery.validate.badCVV"/>',
		wrongFileDim : '<fmt:message key="jquery.validate.wrongFileDim"/>',
		imageTooTall : '<fmt:message key="jquery.validate.imageTooTall"/>',
		imageTooWide : '<fmt:message key="jquery.validate.imageTooWide"/>',
		imageTooSmall : '<fmt:message key="jquery.validate.imageTooSmall"/>',
		min : '<fmt:message key="jquery.validate.min"/>',
		max : '<fmt:message key="jquery.validate.max"/>',
		imageRatioNotAccepted : '<fmt:message key="jquery.validate.imageRatioNotAccepted"/>'
	};

	var lang = window['${pageContext.response.locale}'];
	var $messages = $('#errors');
	$.validate({
		language : messages,
		errorElement : 'div',
		modules : 'security'
	});
</script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/jquery.validate.min.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/messages_pl.min.js"></script>