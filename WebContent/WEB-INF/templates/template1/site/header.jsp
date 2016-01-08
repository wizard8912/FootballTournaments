<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${ pageContext.request.contextPath }/"><fmt:message
					key="title.home" /></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">


			<ul class="nav navbar-nav navbar-right">
				<li><a href="?language=en"><img
						src="${ pageContext.request.contextPath }/static/flag_UK.png"
						class="img-rounded" style="width: 30px; height: 20px;" /></a></li>
				<li><a href="?language=pl"><img
						src="${ pageContext.request.contextPath }/static/flag_Poland.png"
						class="img-rounded" style="width: 30px; height: 20px;" /></a></li>

				<sec:authorize access="isAuthenticated()">
					<li>
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								id="menu1" data-toggle="dropdown">
								<fmt:message key="title.appbase" />
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href='<c:url value="/teams"/>'><fmt:message
											key="title.teams" /></a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href='<c:url value="/leagues"/>'><fmt:message
											key="title.leagues" /></a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href='<c:url value="/players"/>'><fmt:message
											key="title.players" /></a></li>
								<li role="presentation" class="divider"></li>
							</ul>
						</div>
					</li>
				</sec:authorize>
				<sec:authorize access="!isAuthenticated()">
					<li><div class="dropdown">
							<a class="btn btn-default dropdown-toggle"
								href="<c:url value='/register' />"><fmt:message
									key="title.register" /></a>
						</div></li>
					<li><div class="dropdown">
							<a class="btn btn-default dropdown-toggle"
								href="<c:url value='/login' />"><fmt:message
									key="title.login" /></a>
						</div></li>

				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li>
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								id="menu1" data-toggle="dropdown">
								<fmt:message key="title.tournaments" />
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href='<c:url value="/tournaments/new"/>'><fmt:message
											key="title.newTournament" /></a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href='<c:url value="/tournaments/myTournaments"/>'><fmt:message
											key="title.myTournaments" /></a></li>
								<li role="presentation" class="divider"></li>
							</ul>
						</div>
					</li>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('ROLE_SuperAdmin', 'ROLE_Admin')">
					<li>
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								id="menu1" data-toggle="dropdown">
								<fmt:message key="title.adminpanel" />
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href='<c:url value="/admin/users"/>'><fmt:message
											key="title.users" /></a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href='<c:url value="/admin/logs"/>'><fmt:message
											key="title.logs" /></a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href='<c:url value="/admin/configure"/>'><fmt:message
											key="title.configuration" /></a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href='<c:url value="/admin/bans"/>'><fmt:message
											key="title.bans" /></a></li>
								<li role="presentation" class="divider"></li>
							</ul>
						</div>
					</li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li>
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								id="menu1" data-toggle="dropdown">
								<fmt:message key="title.account" />
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href='<c:url value="/myAccount"/>'><fmt:message
											key="title.changeAccount" /></a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href='<c:url value="/myAccount/changePassword"/>'><fmt:message
											key="title.changePassword" /></a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href='<c:url value="/myAccount/info"/>'><fmt:message
											key="title.infos" /></a></li>
								<li role="presentation" class="divider"></li>
							</ul>
						</div>
					</li>
					<li><div class="dropdown">
							<a class="btn btn-default dropdown-toggle"
								href="<c:url value='/j_spring_security_logout' />"><fmt:message
									key="title.logout" /></a>
						</div></li>
				</sec:authorize>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>








