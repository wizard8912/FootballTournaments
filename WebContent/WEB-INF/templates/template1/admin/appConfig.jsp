<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.2.43/jquery.form-validator.min.js"></script>


<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div id="errorstop" class="alert alert-danger text-center hidden"
				role="alert"></div>
		</div>
	</div>
</div>



<form id="details" method="post"
	action="${pageContext.request.contextPath}/admin/configure">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<br />
				<div class="panel panel-default signup">
					<div class="panel-heading">
						<h1 class="panel-title">
							<fmt:message key="title.appConfig" />
						</h1>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="col-md-4 control-label"><fmt:message
									key="appConfig.banConfig.checkLastTime" /></label>
							<div class="col-md-2">
								<label>D</label><input class="control" name="checkTimeD"
									id="checkTimeD" data-validation="number"
									data-validation-allowing="range[0;1000]" value="${checkTimeD}"
									type="text" />
							</div>
							<div class="col-md-2">
								<label>H</label><input class="control" name="checkTimeH"
									id="checkTimeH" data-validation="number"
									data-validation-allowing="range[0;23]" value="${checkTimeH}"
									type="text" />
							</div>
							<div class="col-md-2">
								<label>M</label><input class="control" name="checkTimeM"
									id="checkTimeM" data-validation="number"
									data-validation-allowing="range[0;59]" value="${checkTimeM}"
									type="text" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"><fmt:message
									key="appConfig.banConfig.banForTime" /></label>
							<div class="col-md-2">
								<label>D</label><input class="control" name="banForTimeD"
									id="banForTimeD" data-validation="number"
									data-validation-allowing="range[0;1000]" value="${banForTimeD}"
									type="text" />
							</div>
							<div class="col-md-2">
								<label>H</label><input class="control" name="banForTimeH"
									id="banForTimeH" data-validation="number"
									data-validation-allowing="range[0;23]" value="${banForTimeH}"
									type="text" />
							</div>
							<div class="col-md-2">
								<label>M</label><input class="control" name="banForTimeM"
									id="banForTimeM" data-validation="number"
									data-validation-allowing="range[1;59]" value="${banForTimeM}"
									type="text" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"><fmt:message
									key="appConfig.banConfig.failedAttemps" /></label>
							<div class="col-md-6">
								<input class="control" name="failedAttemps" id="failedAttemps"
									data-validation="number"
									data-validation-allowing="range[1;100]"
									value="${failedAttemps}" type="text" />
							</div>
						</div>
						<div class="form-group pull-right">
							<input class="btn btn-success"
								value="<fmt:message key="appConfig.banConfig.confirm" />"
								type="submit" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

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
	var $messages = $('#errorstop');
	$.validate({
		language : messages,
		validateOnBlur : false,
		errorMessagePosition : $messages,
		onError : function($form) {
			$('#errorstop').removeClass("hidden");
			$('#successstop').addClass("hidden");

		},
		onSuccess : function($form) {
			$('#errorstop').addClass("hidden");
		}
	});
</script>