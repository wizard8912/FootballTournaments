<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/w2ui.css" />
<link href="/FootballTournaments/static/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link
	href="/FootballTournaments/static/bootstrap/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>


<tiles:insertAttribute name="headIncludes"></tiles:insertAttribute>
<style>
.help-block {
	text-align: right;
	padding-right: 30px;
}
</style>
</head>
<body>
	<script type="text/javascript"
		src="/FootballTournaments/static/jquery/jquery-1.8.3.min.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="/FootballTournaments/static/bootstrap/js/bootstrap.min.js"></script>

	<div class="header">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</div>

	<div class="content">
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</div>

	<hr />
	<div class="footer">
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
	<tiles:insertAttribute name="bodyIncludes"></tiles:insertAttribute>

</body>
</html>