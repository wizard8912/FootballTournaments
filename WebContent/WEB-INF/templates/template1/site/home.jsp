<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- bxSlider Javascript file -->
<script src="${ pageContext.request.contextPath }/static/jquery.bxslider.min.js"></script>
<!-- bxSlider CSS file -->
<link href="${ pageContext.request.contextPath }/static/jquery.bxslider.css" rel="stylesheet" />
<style>
.bx-caption {
	font-size: 24px;
}
.bx-viewport {
	height: 100%;
}
</style>
<c:if test="${alert != null}">
	<fmt:message key="${alert}" />
</c:if>

<ul class="bxslider">
  <li><img src="${ pageContext.request.contextPath }/static/glownaObr/obr1.png" title="Rejestracja i logowanie, walidacja po stronie klienta i serwera" /></li>
  <li><img src="${ pageContext.request.contextPath }/static/glownaObr/obr2.png" title="Tworzenie turniejów, definiowanie drużyn, szablonów turniejów" /></li>
  <li><img src="${ pageContext.request.contextPath }/static/glownaObr/obr3.png" title="Panel administratora, konta, uprawnienia, blokady użytkowników" /></li>
  <li><img src="${ pageContext.request.contextPath }/static/glownaObr/obr4.png" title="Edycja meczów turniejowych" /></li>
  <li><img src="${ pageContext.request.contextPath }/static/glownaObr/obr5.png" title="Przeglądanie tabel, sortowanie po kilku kolumnach" /></li>
  <li><img src="${ pageContext.request.contextPath }/static/glownaObr/obr6.png" title="Dodawanie meczów, które jeszcze nie zostały rozegrane" /></li>
</ul>

<script>
$(document).ready(function(){
	$('.bxslider').bxSlider({
	  mode: 'fade',
	  captions: true,
	  auto: true,
	  adaptiveHeight: true,
	  slideWidth: 1200,
	  autoControls: true
	});
});
</script>