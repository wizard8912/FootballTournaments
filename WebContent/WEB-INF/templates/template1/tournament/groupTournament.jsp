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

.editIcon {
	background:
		url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABtklEQVRoge2Xv0tCURiGv8VcXd0C/wALgoYgh4a2opagOYKG4NJBmyxoqa2lweZw7QoXlRS83kASIi4IOqjpkg4ZCA4hNHwNWYheuT/Sc86t88I7nO154OVwDoCIiMjfSmg7KYe2ksi2KdW5AHP4rwoB1v2/AtnGB/JQIcC6QoB1ZyLgj5TQHymNnZ1WCNgVcP2EXC/g+gm5XsD1E6LZpiT5WoTIbULUl3B4YSoCtCaUqfexRYjcIgQH7VqWYC2QqfdRKVZQyeRrQwLWJVhPRylWMJErYCJXMJTgVkCtdvD1dgPzmvIjMCrRJsT8s09rQoFoeQweY4AYg0kSelOSfFwIBKJlPEm/GcJ/9z51fTckocvqw7wpPO0JTYIfkbAOT1PADH5Qe/CznJCV2YzC4yWYb56GgF34XjyIjuDNBGjMphcPolrt8PcWsgOfbXD2mLMLz5WAE3huBJzCcyPw/HjmCP5XAtMMat4m5ub0qd7ztIIq+FDzImpeNJDgGx4A4OJ48fzpxo8GEvzDAwAcHqzUltc3cUiii2nPlSvgAQB2dtfe9/dW26dHSzKqHuufchEREVv5BJkG9QtIpTpYAAAAAElFTkSuQmCC')
		no-repeat center !important;
	background-size: 25px 25px !important;
	width: 50%;
	height: 100%;
	float: left;
	cursor: pointer;
}

.removeIcon {
	background:
		url('data:image/png;base64,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')
		no-repeat center !important;
	background-size: 25px 25px !important;
	width: 50%;
	height: 100%;
	float: left;
	cursor: pointer;
}

.editMatchPanel {
	position: fixed;
	top: 40%;
	left: 40%;
	background: #fffea1;
	border: 1px solid #fc0;
	width: 500px;
	height: 180px;
	text-align: center;
	font-weight: bold;
	font-size: 24px;
}

.btnCancel {
	display: inline-block;
	margin: 5px;
}

.btnSave {
	display: inline-block;
	margin: 5px;
}

.nav-tabs>li, .nav-pills>li {
	float: none;
	display: inline-block;
	*display: inline; /* ie7 fix */
	zoom: 1; /* hasLayout ie7 trigger */
}

.nav-tabs, .nav-pills {
	text-align: center;
}
</style>
</head>
<div style="width: 80%;">
	<ul class="nav nav-tabs" style="width: 80%;">
		<li class="active"><a data-toggle="tab" href="#tournamentTable">Tabela</a></li>
		<li><a data-toggle="tab" href="#tournamentMatches">Mecze</a></li>
		<li><a data-toggle="tab" href="#addMatch">Dodaj mecz</a></li>
	</ul>
</div>
<div class="tab-content">
	<div class="editMatchPanel" id="editMatchPanel">
		<div class="row" style="margin: 20px;">
			<div id="editHomeLogo" style="display: inline-block;"></div>
			<div id="homeGoals" style="display: inline-block;">
				<input id="homeGoalsValEdit">
			</div>
			<div style="display: inline-block; font-size: 40px;">:</div>
			<div id="awayGoals" style="display: inline-block;">
				<input id="awayGoalsValEdit">
			</div>
			<div id="editAwayLogo" style="display: inline-block;">fasf</div>
		</div>
		<div class="row">
			<div class="btn btn-danger btnCancel" onclick="cancelEdit();">
				<fmt:message key="tournament.cancel" />
			</div>
			<div class="btn btn-success btnSave" onclick="saveEditMatch();">
				<fmt:message key="tournament.saveMatch" />
			</div>
		</div>
	</div>
	<div id="addMatch" class="tab-pane fade"
		style="width: 100%; text-align: center;">
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

	<div id="tournamentTable" class="tab-pane fade in active"
		style="width: 100%; clear: both;">

		<table style="margin: 0px auto;" id="myTable" class="tablesorter">

		</table>
	</div>

	<div id="tournamentMatches" class="tab-pane fade"
		style="margin-top: 30px; width: 100%; clear: both;">

		<table style="margin: 0px auto;" id="tableMatches" class="tablesorter">

		</table>
	</div>
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
		refreshMatches();
		$("#editMatchPanel").hide();
		$("#addMatchBtn").hide();
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
		setTimeout(refreshMatches, 1000);
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
						content = "<thead><tr><th>P</th><th><fmt:message key='tournament.team' /></th><th>M</th><th>Z</th><th>R</th><th>P</th><th>G+</th><th>G-</th><th>RB</th><th>P</th></tr></thead><tbody>"

						var pos = 1;
						var style = true;
						for ( var k in response) {
							style = !style;
							console.log(response[k]);
							content = content + "<tr><td>" + pos + "</td><td>"
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
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus, errorThrown);
					}

				});
	}

	function refreshMatches() {
		$
				.ajax({
					url : "getMatches.json",
					type : "post",
					data : {
						tournamentId : '${tournament.id}'
					},
					success : function(response) {
						$("#tableMatches").empty();
						var content = "";
						content = "<thead><tr><th></th><th><fmt:message key='tournament.home' /></th><th></th><th></th><th></th><th></th><th><fmt:message key='tournament.away' /></th><th><fmt:message key='tournament.stadium' /></th><th><fmt:message key='tournament.date' /></th><th><fmt:message key='tournament.actions' /></th></tr></thead><tbody>"

						for ( var k in response) {
							content = content
									+ "<tr><td style='text-align:center;'><img src='" +response[k]["homeLogo"]
									+ "' style='height:25px;width:auto;'/></td><td>"
									+ response[k]["homeTeam"]
									+ "</td><td>"
									+ response[k]["homeTeamGoals"]
									+ "</td><td>:"
									+ "</td><td>"
									+ response[k]["awayTeamGoals"]
									+ "</td><td style='text-align:center;'><img src='" +response[k]["awayLogo"]
									+ "' style='height:25px;width:auto;'/></td><td>"
									+ response[k]["awayTeam"]
									+ "</td><td>"
									+ response[k]["stadium"]
									+ "</td><td>"
									+ response[k]["date"]
									+ "</td><td>"
									+ "<div onclick=editMatch("
									+ response[k]["id"]
									+ ",'"
									+ response[k]["homeLogo"]
									+ "','"
									+ response[k]["awayLogo"]
									+ "') class='editIcon' title=<fmt:message key='tournament.edit' />>&nbsp;</div>"
									+ "<div onclick='removeMatch("
									+ response[k]["id"]
									+ ")' class='removeIcon' title=<fmt:message key='tournament.delete' />>&nbsp;</div>"
									+ "</td></tr>"

						}

						content = content + "</tbody>";

						$("#tableMatches").html(content);
						$("#tableMatches").tablesorter();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus, errorThrown);
					}

				});
	}

	function removeMatch(matchId) {
		if (!confirm("<fmt:message key='tournament.match.delete.confirm' />"))
			return false;

		$.ajax({
			url : "removeMatch",
			type : "post",
			data : {
				matchId : matchId
			},
			success : function(response) {
				loadHomeTeams();
				setTimeout(refreshTable, 1000);
				setTimeout(refreshMatches, 1000);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus, errorThrown);
			}

		});
	}

	var editMatchId = 0;

	function editMatch(matchId, homeTeam, awayTeam) {
		editMatchId = matchId;
		$("#editMatchPanel").show("slow");
		$("#editHomeLogo").empty();
		$("#editAwayLogo").empty();
		$("#editHomeLogo")
				.html(
						"<img style='width:auto;max-height:70px;margin-right:15px;' src='" + homeTeam + "' />");
		$("#editAwayLogo")
				.html(
						"<img style='width:auto;max-height:70px;margin-left:15px;' src='" + awayTeam + "' />");
		console.log(matchId);
		console.log(homeTeam);
		console.log(awayTeam);
	}

	function cancelEdit() {
		$("#editMatchPanel").hide("slow");
		$("#homeGoalsValEdit").val("");
		$("#awayGoalsValEdit").val("");
	}

	function saveEditMatch() {
		var homeGoalsValEdit = $("#homeGoalsValEdit").val();
		var awayGoalsValEdit = $("#awayGoalsValEdit").val();

		$.ajax({
			url : "editMatch",
			type : "post",
			data : {
				matchId : editMatchId,
				homeGoals : homeGoalsValEdit,
				awayGoals : awayGoalsValEdit
			},
			success : function(response) {
				loadHomeTeams();
				setTimeout(refreshTable, 1000);
				setTimeout(refreshMatches, 1000);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus, errorThrown);
			}

		});
		cancelEdit();
		loadHomeTeams();
		setTimeout(refreshTable, 1000);
		setTimeout(refreshMatches, 1000);
	}
</script>