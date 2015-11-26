<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script
	src="${ pageContext.request.contextPath }/static/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function onLoad() {
		$("#password").keyup(checkPasswordsMatch);
		$("#confirmpass").keyup(checkPasswordsMatch);

		$("#details").submit(canSubmit);
	}

	function canSubmit() {
		var password = $("#password").val();
		var confirmpass = $("#confirmpass").val();

		if (password != confirmpass) {
			alert("<fmt:message key='UnmatchedPasswords.user.password' />")
			return false;
		} else {
			return true;
		}
	}

	function checkPasswordsMatch() {
		var password = $("#password").val();
		var confirmpass = $("#confirmpass").val();

		if (password.length > 3 || confirmpass.length > 3) {

			if (password == confirmpass) {
				$("#matchpass").text("<fmt:message key='empty' />");
				$("#matchpass").removeClass("error");
			} else {
				$("#matchpass")
						.text(
								"<fmt:message key='UnmatchedPasswords.user.password' />");
				$("#matchpass").addClass("error");
			}
		}
	}

	$(document).ready(onLoad);
</script>
