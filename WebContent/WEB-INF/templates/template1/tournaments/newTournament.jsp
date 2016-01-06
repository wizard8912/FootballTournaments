<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<div class="row">
		<div class="col-md-8 col-md-offset-3">
			<br />
			<div class="panel panel-default signup">
				<div class="panel-heading">
					<h1 class="panel-title">
						<fmt:message key="title.newTournament" />
					</h1>
				</div>
				<div class="panel-body">

					<div class="form-group row">
						<div class="btn btn-default col-md-4"
							style="text-align: center; margin-left: 5px; margin-right: 5px;"
							onclick="document.location.href='ownTournament'">
							<img class="icon icons8-Create-New"
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABhklEQVRoge3TvUvDQBzG8du6ZhLcXJx1EPwTBAd1Elz8BxQJHnV3cBObLXESEcHtgooghZ4NhGhR6thBcLGVZhE3Oz0uqUhfMC+XuxTvgd8avh+4EKKnp6cneq+mabQpZR1K+Vu5PK+6J9EY50abUtamFNF9TAyCcW643GeXVa/1CzA5CJf7zK35cGs+RiFU940dKsSAQ5h3c3zbBwwiOpTy2B+0Gj3IOjvo4uViBXAI4BBcV68wAtF8N82ZwgEG48cgmowH8eNlAcbF9y96TsnjZQD+io8uXXzegDjx4ekcUCFGqvg8AXHj7aCL1PF5AZLEW41esQBJ4wsFSBNfGEDa+EIAssQrB2SNVwoQEa8MICpeCUBkvHSA6HipgDzipQKC+r7weKmAT28W4d2C0HhpAPshBOoloF4aQmSJlwY4PLHwdDY9hMgaLw2wu7eOxaXVH8SXN4Vnvp05XhpgY3MZWztrODiiOL9/zByt5CfO6zRA9WmA6tMA1acBqu9/A/T09CZn341zKV7T3u9+AAAAAElFTkSuQmCC"
								width="100" height="100"><br /> <label><fmt:message
									key="tournaments.ownTemplate" /></label>
						</div>
						<div class="btn btn-default col-md-4"
							style="text-align: center; margin-left: 5px; margin-right: 5px;"
							onclick="document.location.href='fromTemplate'">
							<img class="icon icons8-Template"
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAY0lEQVRoge3UsQ2AMAxFwazCJMzAcmxCxS5ZgjIFzJCIYAvdk35r6RqXIkl6s7O2O/MAogcQvSHAuh0hAwAA8IXyDSB6Q4Blv7o34wYAAAAAAAAAAAAAwPeATAOI3v8BkqSeHqeHvVeDPYL4AAAAAElFTkSuQmCC"
								width="100" height="100"><br /> <label><fmt:message
									key="tournaments.fromTemplate" /></label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>