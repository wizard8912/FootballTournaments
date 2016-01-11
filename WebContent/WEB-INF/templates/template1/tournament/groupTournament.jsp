<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<head>
<script
	src="${pageContext.request.contextPath}/static/jquery-1.9.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery-latest.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery.tablesorter.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/blue/style.css"
	type="text/css" id="" media="print, projection, screen" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/dd.css" />
<script src="${pageContext.request.contextPath}/static/jquery.dd.min.js"></script>
<style>
input {
	width: 70px;
	height: 70px;
	font-size: 40px;
	text-align: center;
}

.rowOne {
	background: #000;
}
</style>
</head>
<div id="addMatch" style="width: 100%; text-align: center;">
	<div id="addMatchBtn" class="btn btn-success">
		<fmt:message key="tournament.addMatch" />
	</div>
	<div id="cancelSaveMatchBtn" class="btn btn-danger">
		<fmt:message key="tournament.cancel" />
	</div>
	<div id="saveMatchBtn" class="btn btn-success" onclick="saveMatch()">
		<fmt:message key="tournament.saveMatch" />
	</div>
	<br />
	<div id="addMatchPanel"
		style="margin: 15px; width: 100%; height: 100%;">
		<div id="homeTeam" style="display: inline-block;"></div>
		<div id="homeGoals" style="display: inline-block;">
			<input id="homeGoalsVal">
		</div>
		<div style="display: inline-block; font-size: 40px;">:</div>
		<div id="awayGoals" style="display: inline-block;">
			<input id="awayGoalsVal">
		</div>
		<div id="awayTeam" style="display: inline-block;"></div>
	</div>
</div>

<div style="width: 100%; clear: both;">

	<table style="margin: 0px auto;" id="myTable" class="tablesorter">
		<thead>
			<tr>
				<th>P</th>
				<th>Team</th>
				<th>M</th>
				<th>Z</th>
				<th>R</th>
				<th>P</th>
				<th>G+</th>
				<th>G-</th>
				<th>RB</th>
				<th>P</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>Liverpool FC</td>
				<td>10</td>
				<td>9</td>
				<td>1</td>
				<td>0</td>
				<td>32</td>
				<td>4</td>
				<td>28</td>
				<td>27</td>
			</tr>
			<tr>
				<td>2</td>
				<td>Barcelona</td>
				<td>10</td>
				<td>5</td>
				<td>3</td>
				<td>2</td>
				<td>28</td>
				<td>6</td>
				<td>22</td>
				<td>18</td>
			</tr>
		</tbody>
	</table>
</div>

<script>
	function loadHomeTeams() {

		$
				.ajax({
					url : "getHomeTeams",
					type : "post",
					data : {
						tournamentId : '${tournament.id}'
					},
					success : function(response) {
						$("#homeTeam").msDropDown({
							byJson : {
								data : response,
								name : 'homeTeams'
							}
						}).data("dd");

						$("#awayTeam").msDropDown({
							byJson : {
								data : {},
								name : 'awayTeams'
							}
						}).data("dd");

						document.getElementById("msdropdown20_child").style.height = "423px";
						var homeTeamId = $("#homeTeam").msDropdown().data("dd")["value"];
						loadAwayTeams(homeTeamId);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus, errorThrown);
					}

				});
	}

	function loadAwayTeams(homeTeamId) {
		$
				.ajax({
					url : "getAwayTeams.json",
					type : "post",
					data : {
						tournamentId : '${tournament.id}',
						homeTeamId : homeTeamId
					},
					success : function(response) {
						if (response["length"] == 0)
							location.reload();
						var oDropdown = $("#awayTeam").msDropdown().data("dd");
						numberOfElements = oDropdown["options"]["length"];

						for (i = (numberOfElements - 1); i >= 0; i--) {
							oDropdown.remove(i);
						}

						for ( var k in response) {

							oDropdown.add(response[k]);
						}
						oDropdown.set("selectedIndex", 0);
						document.getElementById("msdropdown21_child").style.height = "423px";

					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus, errorThrown);
					}

				});
	}

	$("#awayTeam").on("click", function() {
		console.log($("#homeTeam").msDropdown().data("dd")["value"]);

		var oDropdown = $("#awayTeam").msDropdown().data("dd")["id"];
		console.log(oDropdown);
		console.log($("#msdropdown21_msdd"));
	});

	$("#addMatch").on("click", function() {

	});
	$(document).ready(function() {
		$("#myTable").tablesorter();
		loadHomeTeams();
		refreshTable();
		$("#addMatchPanel").hide();
		$("#saveMatchBtn").hide();
		$("#cancelSaveMatchBtn").hide();
	});

	$("#addMatchBtn").on('click', function() {
		$(this).hide();
		$("#addMatchPanel").show();
		$("#cancelSaveMatchBtn").show();
		$("#saveMatchBtn").show();
	});

	$("#cancelSaveMatchBtn").on('click', function() {
		$("#cancelSaveMatchBtn").hide();
		$("#addMatchPanel").hide();
		$("#saveMatchBtn").hide();
		$("#addMatchBtn").show();
	});

	$(document).on('change', 'select', function(arg) {
		var target = arg["target"]["name"];
		console.log($("#awayTeam").msDropdown().data("dd"));
		if (target == "homeTeams") {
			var homeTeamId = $("#homeTeam").msDropdown().data("dd")["value"];
			loadAwayTeams(homeTeamId);
		}
	});

	function saveMatch() {

		var homeTeamId = $("#homeTeam").msDropdown().data("dd")["value"];
		var awayTeamId = $("#awayTeam").msDropdown().data("dd")["value"];
		var homeTeamGoals = $("#homeGoalsVal").val();
		var awayTeamGoals = $("#awayGoalsVal").val();
		$.ajax({
			url : "saveMatch",
			type : "post",
			data : {
				tournamentId : '${tournament.id}',
				homeTeamId : homeTeamId,
				awayTeamId : awayTeamId,
				homeTeamGoals : homeTeamGoals,
				awayTeamGoals : awayTeamGoals
			},
			success : function(response) {

			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus, errorThrown);
			}

		});
		$("#homeGoalsVal").val();
		$("#awayGoalsVal").val();
		loadHomeTeams();
		setTimeout(refreshTable, 1000);
	}

	function refreshTable() {
		$
				.ajax({
					url : "getTable.json",
					type : "post",
					data : {
						tournamentId : '${tournament.id}'
					},
					success : function(response) {
						$("#myTable").empty();
						var content = "";
						content = "<thead><tr><th>P</th><th>Team</th><th>M</th><th>Z</th><th>R</th><th>P</th><th>G+</th><th>G-</th><th>RB</th><th>P</th></tr></thead><tbody>"

						var pos = 1;
						var style = true;
						for ( var k in response) {
							style = !style;
							console.log(response[k]);
							content = content
									+ "<tr><td>"
									+ pos + "</td><td>"
									+ response[k]["fullname"] + "</td><td>"
									+ response[k]["matches"] + "</td><td>"
									+ response[k]["wins"] + "</td><td>"
									+ response[k]["draws"] + "</td><td>"
									+ response[k]["losts"] + "</td><td>"
									+ response[k]["goalsScored"] + "</td><td>"
									+ response[k]["goalsLost"] + "</td><td>"
									+ response[k]["goalsDifference"]
									+ "</td><td>" + response[k]["points"]
									+ "</td></tr>"

							pos++;
						}

						content = content + "</tbody>";

						$("#myTable").html(content);
						$("#myTable").tablesorter();
						$("tr:even").css("background-color", "#FFF");
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus, errorThrown);
					}

				});
	}
</script>