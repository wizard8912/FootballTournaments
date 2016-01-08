<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container">
	<div class="row">
		<div class="col-md-14 col-md-offset-0">
			<br />
			<div class="panel panel-default signup">
				<div class="panel-heading">
					<h1 class="panel-title">
						<fmt:message key="title.myTournaments" />
					</h1>
				</div>
				<div class="panel-body">
					<div class="container">

						<c:forEach items="${listOfTournaments}" var="tournament">
							<div class="row btn btn-default"
								style="width: 100%; margin-top: 10px;">
								<div style="width: 5%; text-align: center; float: left;">
									${ tournament.id }.</div>
								<div style="width: 30%; text-align: center; float: left;">
									${ tournament.league.fullname} (${ tournament.league.countryName })</div>
								<div style="width: 20%; text-align: center; float: left;">
									${ tournament.addedTime }</div>
								<div style="width: 15%; text-align: center; float: left;">
									<div class="btn btn-danger"
										onclick="deleteTournament(${tournament.id})">
										<fmt:message key="tournament.delete" />
									</div>
								</div>
								<div style="width: 15%; text-align: center; float: left;">
									<div class="btn btn-primary"
										onclick="document.location.href='${pageContext.request.contextPath}/teams/${tournament.league.id }'">
										<fmt:message key="tournament.showLeague" />
									</div>
								</div>
								<div style="width: 15%; text-align: center; float: left;">
									<div class="btn btn-success">
										<fmt:message key="tournament.open" />
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

<form action="delete" id="formDeleteTournament"
	name="formDeleteTournament" method="post">
	<input type="hidden" id="tournamentId" name="tournamentId" value="">
</form>
<script>
	function deleteTournament(tournamentId) {
		if(confirm('<fmt:message key="tournaments.confirmDelete" />')){
			$("#tournamentId").val(tournamentId);
			$("#formDeleteTournament").submit();
		};
	}
</script>