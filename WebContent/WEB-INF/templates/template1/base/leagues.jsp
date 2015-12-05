<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/blocksit.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.2.43/jquery.form-validator.min.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
	color: #333;
	font-family: Cambria, Georgia, serif;
	font-size: 15px;
	overflow-x: hidden;
}

header, section, footer, hgroup {
	display: block;
}

a {
	color: #35BFFF;
	text-decoration: none;
}

a:hover, a:active {
	color: #91DCFF;
}

/* Header */
#header {
	width: 100%;
	background: #000;
	background: rgba(0, 0, 0, 0.8);
	padding: 5px 0;
	letter-spacing: 1px;
	margin-bottom: 20px;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 99;
}

#header h1 {
	padding: 0 20px;
	margin: 5px 0;
	text-shadow: 2px 1px 1px #333, 2px 2px 1px #888;
	color: #EAEAEA;
	float: left;
	font-size: 27px;
}

#backlinks {
	float: right;
	padding: 0 20px;
	line-height: 22px;
	font-weight: bold;
	font-size: 13px;
}

#backlinks a {
	text-align: right;
	display: block;
}

/* Footer */
#footer {
	width: 100%;
	position: fixed;
	padding-left: 20px;
	bottom: 0;
	left: 0;
	line-height: 20px;
	color: #888;
	font-size: 13px;
	background: rgb(0, 0, 0);
	background: rgba(0, 0, 0, 0.8);
	z-index: 99;
}

#footer span {
	display: block;
}

/* clearfix */
.clearfix {
	clear: both;
}

/* wrapper css */
#wrapper {
	margin-top: 70px;
	width: 100%;
}

#wrapper hgroup {
	text-align: center;
}

#wrapper h2 {
	margin: 5px 0;
	color: #FF6D99;
	text-shadow: 1px 1px 2px #A50031;
	font-size: 33px;
	font-family: Arial Narrow, Arial, sans-serif;
}

#wrapper h3 {
	font-style: italic;
	font-weight: normal;
	font-size: 18px;
	text-shadow: 1px 1px 0 #fff;
	color: #888;
	margin: 5px 0;
}

#container {
	position: relative;
	width: 1100px;
	margin: 0 auto 25px;
	padding-bottom: 10px;
}

.grid {
	position: relative;
	width: 188px;
	min-height: 360px;
	padding: 15px;
	background: #fff;
	margin: 8px;
	text-align: center;
	font-size: 12px;
	float: left;
	box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
	-moz-box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
	-webkit-box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
	-webkit-transition: top 1s ease, left 1s ease;
	-moz-transition: top 1s ease, left 1s ease;
	-o-transition: top 1s ease, left 1s ease;
	-ms-transition: top 1s ease, left 1s ease;
	font-size: 12px;
}

.grid strong {
	border-bottom: 1px solid #ccc;
	margin: 10px 0;
	display: block;
	padding: 0 0 5px;
	font-size: 17px;
}

.grid .meta {
	text-align: right;
	color: #777;
	font-style: italic;
}

.grid .imgholder img {
	max-width: 100%;
	background: #ccc;
	display: block;
	background: #ccc;
}

@media screen and (max-width : 1240px) {
	body {
		overflow: auto;
	}
}

@media screen and (max-width : 900px) {
	#backlinks {
		float: none;
		clear: both;
	}
	#backlinks a {
		display: inline-block;
		padding-right: 20px;
	}
	#wrapper {
		margin-top: 90px;
	}
}

.toolbar {
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
}

.btn-small {
	position: absolute;
	right: 0;
	width: 25px;
	height: 25px;
	background:
		url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAABT0lEQVRIie2TvUrDUACF8whZOorgG7gGBKEv4BNIJ0cJzRaX0kUnFaUgURQEobj056aUQhshGEXRLkJBWqwl5ormQjYzHoe0qbVpU42LkANnO3wf93Ivx8XppyuKPJWklZnGcAo8bLIMpp6AKi7MnTas3OakfavVmDdqlbwlSXjLbrTDoYw4YARgBKAK8Jwdti/z9+bpGb3dc4uaAV2vw5IkvKTTqXGBXcr40K/9LhiUKsBrHqgmgQMOD/ohipqBO6N23RVFPrqgt+vDB+01j/FhqVvBV/QTQUcGKsIIHNWkdyK7lIkm6MgAWQyGMxJREAaPLKgvTYdHFlzNAecJD14RxuFRBI/aGtT9BeAyATQE7xUF7X8roDfruFdXgSd5+A/+UhD40WLBvxY4YOQC7+UUnAIPM3cEc5tOEYzsJwjKYuiI4zhfRhV3ln2c0HwCvWBCF9N7dEUAAAAASUVORK5CYII=')
		no-repeat;
}

.bottom {
	position: absolute;
	width: 80%;
	align: center;
	bottom: 20px;
}

.form-group {
	background-color: #e3e3e3;
}
</style>
</head>

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
		<div class="toolbar">
			<button type="button" class="btn btn-blue" onClick="addLeague();">
				<fmt:message key="league.addLeague" />
			</button>

			<div class="pull-right">
				<input id="searchengine" type="text" class="form-control"
					placeholder='<fmt:message key="league.searchPlaceHolder" />' />

			</div>
			<div class="pull-right">

				<label for="myLeagues"><fmt:message key="league.onyForMe" /></label>
				<input id="myLeagues" type="checkbox" value="">&nbsp;&nbsp;&nbsp;&nbsp;
			</div>

		</div>
	</div>
</div>
<sf:form id="details" method="post"
	action="${pageContext.request.contextPath}/leagues/add"
	commandName="league">
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
								type="text"
								onChange="if($(this).val() == 1) {$('#grNum').hide();$('#dbCup').hide();$('#dbFinal').hide();} else {$('#grNum').show();$('#dbCup').show();$('#dbFinal').show();};">
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
						<div class='form-group'>
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
								path="numberOfGroups" name="numberOfGroups" type="text" />
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
					value="<fmt:message key="league.confirm" />" type="submit" />
			</div>
		</div>
	</div>
</sf:form>

<div id="container" class="container">
	<c:forEach items="${leagues}" var="league">
		<div class="grid" id="LeagueGrid${league.id }">
			<div class="bottom">
				<div class="imgholder">
					<img src="${ league.logo }" />
				</div>

				<strong>${ league.fullname }</strong>
				<p>${ league.countryName }</p>

				<fmt:message key="league.level" />
				: ${ league.level } <br /> System:
				<c:if test="${ league.system == 1}">
					<fmt:message key="league.league" />
				</c:if>
				<c:if test="${ league.system == 2}">
					<fmt:message key="league.cup" />
				</c:if>
				<c:if test="${ league.system == 3}">
					<fmt:message key="league.leaguecup" />
				</c:if>
				<br />
				<fmt:message key="league.teamsNumber" />
				: ${ league.numberOfTeams	 }
				<div class="hidden">
					<p>OFM${ league.onlyForMe	 }</p>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<script>
	$(document).ready(function() {

		$("#dbCup").hide();
		$("#dbFinal").hide();
		$("#grNum").hide();
		$("#addLeague").hide();
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
					if (recordVal.indexOf('ofm1') >= 0) {
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