<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<form id="details" method="post"
	action="${pageContext.request.contextPath}/checkFpAnswer">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<br />
				<div class="panel panel-default signup">
					<div class="panel-heading">
						<h1 class="panel-title">
							<fmt:message key="title.forgotPass" />
						</h1>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="col-md-4 control-label"><fmt:message
									key="passAns.question" /></label>
							<div class="col-md-8">
								<label>${ forgotPassQ }</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"><fmt:message
									key="passAns.answer" /></label>
							<div class="col-md-8">
								<input class="form-control" name="forgotPassA" type="text" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"><fmt:message
									key="passAns.newPass" /></label>
							<div class="col-md-8">
								<input class="form-control" name="newPass" type="password" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"><fmt:message
									key="passAns.confNewPass" /></label>
							<div class="col-md-8">
								<input class="form-control" name="confNewPass" type="password" />
							</div>
						</div>
						<input type="text" name="username" value="${ username }"
							hidden="true">
						<div class="pull-right">
							<input class="btn btn-success"
								value="<fmt:message key="passAns.confirm" />" type="submit" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>