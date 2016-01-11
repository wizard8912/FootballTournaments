<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<head>
<style>
.tournamentTitle {
	width: 100%;
	background: #FFC1AD;
	text-align: center;
	overflow: hidden;
}

.img {
	max-height: 100px;
	margin: 20px;
}

.tournamentLogo {
	float: left;
	width: 30%;
	text-align: right;
}

.tournamentInfo {
	float: left;
	text-align: left;
	width: 70%;
}

.fullname {
	float: left;
	width: 100%;
	margin-top: 10px;
	margin-bottom: 10px;
	font-size: 30px;
	text-align: center;
	font-weight: bold;
	height: 130px;
	line-height: 130px;
}
</style>
</head>
<div class="container">
	<div class="tournamentTitle">
		<div class="tournamentLogo">
			<img class="img" src="${ tournament.league.logo }" />
		</div>
		<div class="tournamentInfo">
			<div class="fullname">${ tournament.league.fullname }</div>

		</div>
	</div>
</div>