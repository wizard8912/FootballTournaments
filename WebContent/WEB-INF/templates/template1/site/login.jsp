<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<form name='form_login'
	action='${ pageContext.request.contextPath }/j_spring_security_check'
	method='POST' accept-charset="UTF-8">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<br />
				<div class="panel panel-default signup">
					<div class="panel-heading">
						<h1 class="panel-title">
							<fmt:message key="title.login" />
						</h1>
					</div>
					<div class="panel-body">

						<div class="form-group">
							<label class="col-md-4 control-label"><fmt:message
									key="login.username" /></label>
							<div class="col-md-8">
								<input class="form-control" type='text' name='j_username'
									value=''>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"><fmt:message
									key="login.password" /></label>
							<div class="col-md-8">
								<input class="form-control" type='password' name='j_password'
									value=''>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-8">
								<input type='checkbox' name='_spring_security_remember_me'
									checked="checked">
								<fmt:message key="login.rememberme" />
								<div class="pull-right">
									<input class="btn btn-success" name="submit" type="submit"
										value="<fmt:message key="login.login" />">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-8">
								<div class="pull-left">
									<a href="<c:url value='/forgotPass' />"><fmt:message
											key="login.forgotyourpass" /></a>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-8"></div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</form>