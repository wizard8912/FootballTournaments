<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.2.43/jquery.form-validator.min.js"></script>

<sf:form id="createOwnTournament"
	action="${pageContext.request.contextPath}/tournaments/createOwn"
	method="post" commandName="league">

	<div class="container" id="addLeague">
		<div class="row">
			<div class="col-md-12">
				<div class='row'>
					<div class='col-sm-4'>
						<div class='form-group'>
							<label for="fullname"><fmt:message key="league.fullname" /></label>
							<sf:input data-validation="length" data-validation-length="3-100"
								class="form-control" path="fullname" name="fullname" type="text" />
						</div>
					</div>
					<div class='col-sm-4'>
						<div class='form-group'>
							<label for="shortname"><fmt:message
									key="league.shortname" /></label>
							<sf:input data-validation="length" data-validation-length="3-30"
								class="form-control" path="shortname" name="shortname"
								type="text" />
						</div>
					</div>
					<div class='col-sm-4'>
						<div class='form-group'>
							<label for="country"><fmt:message key="league.country" /></label>
							<sf:select class="form-control" path="country" name="country"
								type="text">
								<sf:options items="${ countryList }" />
							</sf:select>
						</div>
					</div>

					<div class='col-sm-4'>
						<div class='form-group'>
							<label for="logo"><fmt:message key="league.logo" /></label>
							<sf:input data-validation="url" data-validation-length="3-100"
								class="form-control" path="logo" name="logo" type="text" />
						</div>
					</div>
					<div class='col-sm-4'>
						<div class='form-group'>
							<label for="system"><fmt:message key="league.system" /></label>
							<sf:select class="form-control" path="system" name="system"
								id="system" type="text" onChange="changeForm()">
								<sf:option value="1">
									<fmt:message key="league.league" />
								</sf:option>
								<sf:option value="2">
									<fmt:message key="league.cup" />
								</sf:option>
								<sf:option value="3">
									<fmt:message key="league.leaguecup" />
								</sf:option>
							</sf:select>
						</div>
					</div>
					<div class='col-sm-4'>
						<div class='form-group'>
							<label for="level"><fmt:message key="league.level" /></label>
							<sf:input data-validation="number" class="form-control"
								path="level" name="level" type="text" />
						</div>
					</div>


					<div class='col-sm-4'>
						<div class='form-group'>
							<label for="numberOfTeams"><fmt:message
									key="league.teamsNumber" /></label>
							<sf:input data-validation="number" class="form-control"
								path="numberOfTeams" name="numberOfTeams" type="text" />
						</div>
					</div>
					<div class='col-sm-4'>
						<div class='form-group' id="dbGroup">
							<label for="doubleGroupMatches"><fmt:message
									key="league.doubleGroupMatches" /></label>
							<sf:checkbox value="0" class="form-control"
								name="doubleGroupMatches" path="doubleGroupMatches" />
						</div>
					</div>

					<div class='col-sm-4'>
						<div class='form-group'>
							<label for="user_lastname"><fmt:message
									key="league.onlyForMe" /></label>
							<sf:checkbox value="1" class="form-control" name="onlyForMe"
								path="onlyForMe" />
						</div>
					</div>
					<div class='col-sm-4'>
						<div class='form-group' id="dbCup">
							<label for="doubleCupMatches"><fmt:message
									key="league.doubleCupMatches" /></label>
							<sf:checkbox value="0" class="form-control"
								name="doubleCupMatches" path="doubleCupMatches" />
						</div>
					</div>
					<div class='col-sm-4'>
						<div class='form-group' id="grNum">
							<label for=numberOfGroups><fmt:message
									key="league.groupsNumber" /></label>
							<sf:input data-validation="number" class="form-control"
								path="numberOfGroups" name="numberOfGroups" type="text"
								value="1" />
						</div>
					</div>
					<div class='col-sm-4'>
						<div class='form-group' id="dbFinal">
							<label for="doubleFinalMatches"><fmt:message
									key="league.doubleFinalMatches" /></label>
							<sf:checkbox value="1" class="form-control"
								name="doubleFinalMatches" path="doubleFinalMatches" />
						</div>
					</div>

				</div>

			</div>
			<div class="pull-right">
				<input class="btn btn-success"
					value="<fmt:message key="tournament.secondStep" />" type="submit" />
			</div>
		</div>
	</div>
</sf:form>

<script>
	$(document).ready(function() {

		changeForm();
	});

	var checked = 0;
	var searchWord = "";

	$("#myLeagues").change(function() {
		if ($(this).is(':checked')) {
			checked = 1;
		} else {
			checked = 0;
		}
		filterRecords();
	});

	$("#searchengine").keyup(function() {
		searchWord = $("#searchengine").val().toLowerCase();
		filterRecords();
	});

	function filterRecords() {

		$(".grid").filter(function(index, element) {
			var recordVal = $(this).text().toLowerCase();
			if (recordVal.indexOf(searchWord.toLowerCase()) >= 0) {
				if (checked == 1) {
					if (recordVal.indexOf('ofmtrue') >= 0) {
						$(this).show("slow");
					} else {
						$(this).hide("slow");
					}
				} else {
					$(this).show("slow");
				}
			} else {
				$(this).hide("slow");
			}
		});
	}

	var addLeagueVis = 0;

	function addLeague() {
		if (addLeagueVis == 0) {
			$("#addLeague").show("slow");
			addLeagueVis = 1;
		} else {
			$("#addLeague").hide("slow");
			addLeagueVis = 0;
		}
	}

	function changeForm() {
		var id = $("#system").val();
		if (id == 1) {
			$('#grNum').hide();
			$('#dbCup').hide();
			$('#dbFinal').hide();
			$('#dbGroup').show();
		} else if (id == 2) {
			$('#grNum').hide();
			$('#dbCup').show();
			$('#dbFinal').show();
			$('#dbGroup').hide();
		} else {
			$('#grNum').show();
			$('#dbCup').show();
			$('#dbFinal').show();
			$('#dbGroup').show();
		}
	}

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