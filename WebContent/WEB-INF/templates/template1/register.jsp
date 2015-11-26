<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h2>Create New Account</h2>

<sf:form id="details" method="post"
	action="${pageContext.request.contextPath}/register" commandName="user">

	<table class="formtable">
		<tr>
			<td>Username:</td>
			<td><sf:input class="control" path="username" name="username"
					type="text" /><br />
				<div class="error">
					<sf:errors path="username"></sf:errors>
				</div></td>
		</tr>
		<tr>
			<td>Email:</td>
			<td><sf:input class="control" path="email" name="email"
					type="text" />
				<div class="error">
					<sf:errors path="email"></sf:errors>
				</div></td>
		</tr>
		<tr>
			<td>Hasło:</td>
			<td><sf:input id="password" class="control" path="password"
					name="password" type="password" />
				<div class="error">
					<sf:errors path="password"></sf:errors>
				</div></td>
		</tr>
		<tr>
			<td>Confirm Password:</td>
			<td><input id="confirmpass" class="control" name="confirmpass"
				type="password" />
				<div id="matchpass"></div></td>
		</tr>
		<tr>
			<td>Firstname:</td>
			<td><sf:input class="control" path="firstname" name="firstname"
					type="text" /><br />
				<div class="error">
					<sf:errors path="firstname"></sf:errors>
				</div></td>
		</tr>
		<tr>
			<td>Lastname:</td>
			<td><sf:input class="control" path="lastname" name="lastname"
					type="text" /><br />
				<div class="error">
					<sf:errors path="lastname"></sf:errors>
				</div></td>
		</tr>
		<tr>
			<td>Country:</td>
			<td><sf:select path="country">
					<sf:options items="${ countryList }" />
				</sf:select></td>
		</tr>
		<tr>
			<td>City:</td>
			<td><sf:input class="control" path="city" name="city"
					type="text" /><br />
				<div class="error">
					<sf:errors path="city"></sf:errors>
				</div></td>
		</tr>
		<tr>
			<td>Birthdate:</td>
			<td><sf:input class="control" path="birthdate" name="birthdate"
					type="text" /><br />
				<div class="error">
					<sf:errors path="birthdate"></sf:errors>
				</div></td>
		</tr>
		<tr>
			<td>Forgot Pass Question:</td>
			<td><sf:input class="control" path="forgotPassQ"
					name="forgotPassQ" type="text" /><br />
				<div class="error">
					<sf:errors path="forgotPassQ"></sf:errors>
				</div></td>
		</tr>
		<tr>
			<td>Forgot Pass Answer:</td>
			<td><sf:input class="control" path="forgotPassA"
					name="forgotPassA" type="text" /><br />
				<div class="error">
					<sf:errors path="forgotPassA"></sf:errors>
				</div></td>
		</tr>
		<tr>
			<td></td>
			<td><input class="control" value="Create account" type="submit" /></td>
		</tr>
	</table>

</sf:form>
