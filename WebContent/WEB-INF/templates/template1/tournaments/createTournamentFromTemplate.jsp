<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form id="tournamentCreate" method="post"
	action="${pageContext.request.contextPath}/tournaments/create">
	<input type="hidden" id="leagueId" name="leagueId" value="">
</form>
<div class="container">
	<div class="row">
		<div class="col-md-14 col-md-offset-0">
			<br />
			<div class="panel panel-default signup">
				<div class="panel-heading">
					<h1 class="panel-title">
						<fmt:message key="tournaments.chooseFromTemplate" />
					</h1>
				</div>
				<div class="panel-body">
					<div class="container">

						<c:forEach items="${listOfLeagues}" var="league">
							<div class="row btn btn-default"
								style="width: 100%; margin-top: 10px;">
								<div style="width: 15%; text-align: center; float: left;">
									<img src="${ league.logo }" style="height: 35px; width: auto;" />
								</div>
								<div style="width: 55%; text-align: left; float: left;">
									<b>${ league.fullname }</b> (${ league.countryName })
								</div>
								<div style="width: 15%; text-align: right; float: left;">
									<div class="btn btn-info right"
										onclick="document.location.href='${pageContext.request.contextPath}/teams/${league.id }'">
										<span class="glyphicon glyphicon-equalizer"></span>&nbsp;
										<fmt:message key="tournament.showDetails" />
									</div>
								</div>
								<div style="width: 15%; text-align: left; float: left;">
									<div style="margin-left: 15px;" class="btn btn-success right"
										onclick="createTournament(${league.id})">
										<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>&nbsp;
										<fmt:message key="tournament.chooseTemplate" />
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function createTournament(leagueId) {
		$("#leagueId").val(leagueId);
		$("#tournamentCreate").submit();
	};
</script>