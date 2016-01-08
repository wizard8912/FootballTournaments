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


<sf:form id="details" method="post"
	action="${pageContext.request.contextPath}/myAccount"
	commandName="user">

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
						<form class="form-horizontal" action="">
							<div class="form-group">
								<label class="col-md-4 control-label"><fmt:message
										key="account.username" /></label>
								<div class="col-md-8">
									<sf:input data-validation="length"
										data-validation-length="3-30" class="form-control"
										path="username" name="username" type="text" />
								</div>
							</div>
							<div class="form-group">

								<label class="col-md-4 control-label"><fmt:message
										key="account.email" /></label>
								<div class="col-md-8">

									<sf:input data-validation="email" class="form-control"
										path="email" name="email" type="text" />

								</div>

							</div>
							<div class="form-group">
								<label class="col-md-4 control-label"><fmt:message
										key="account.firstname" /></label>
								<div class="col-md-8">
									<sf:input data-validation="length"
										data-validation-length="3-45" class="form-control"
										path="firstname" name="firstname" type="text" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label"><fmt:message
										key="account.lastname" /></label>
								<div class="col-md-8">
									<sf:input data-validation="length"
										data-validation-length="3-45" class="form-control"
										path="lastname" name="lastname" type="text" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label"><fmt:message
										key="account.birthdate" /></label>
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
										key="account.country" /></label>
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
										key="account.city" /></label>
								<div class="col-md-8">
									<sf:input data-validation="length"
										data-validation-length="3-30" class="form-control" path="city"
										name="city" type="text" />
								</div>
							</div>
							<div class="pull-right">
								<input class="btn btn-success"
									value="<fmt:message key="account.confirm" />" type="submit" />
							</div>
							<div class="form-group">
								<a href="<c:url value='/myAccount/changePassword' />"><fmt:message
										key="title.changePassword" /></a> <a
									href="<c:url value='/myAccount/deleteAccount' />"><fmt:message
										key="title.deleteAccount" /></a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</sf:form>


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
