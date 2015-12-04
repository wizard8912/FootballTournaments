<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${alert != null}">
	<fmt:message key="${alert}" />
</c:if>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/w2ui.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/w2ui.js"></script>
</head>
<body>
	<div id="grid" style="width: 100%; height: 600px;"></div>


</body>
<script>
	$(function() {
		$('#grid').w2grid({
			name : 'grid',
			header : 'List of Names',
			show : {
				toolbar : true,
				footer : true
			},
			columns : [ {
				field : 'recid',
				caption : 'ID',
				size : '50px',
				sortable : true,
				attr : 'align=center'
			}, {
				field : 'username',
				caption : '<fmt:message key="admin.logs.username" />',
				size : '15%',
				sortable : true,
				attr : 'align=center'
			}, {
				field : 'date',
				caption : '<fmt:message key="admin.logs.date" />',
				size : '100px',
				sortable : true,
				resizable : true,
				render : 'date'
			}, {
				field : 'time',
				caption : '<fmt:message key="admin.logs.time" />',
				size : '100px',
				sortable : true,
				resizable : true,
				render : 'time'
			}, {
				field : 'action',
				caption : '<fmt:message key="admin.logs.action" />',
				size : '30%',
				resizable : true
			}, {
				field : 'ipaddress',
				caption : '<fmt:message key="admin.logs.ipaddress" />',
				size : '30%',
				resizable : true
			}, ],

			searches : [ {
				field : 'username',
				caption : '<fmt:message key="admin.logs.username" />',
				type : 'text'
			}, {
				field : 'date',
				caption : '<fmt:message key="admin.logs.date" />',
				type : 'date'
			}, {
				field : 'time',
				caption : '<fmt:message key="admin.logs.time" />',
				type : 'time'
			}, {
				field : 'ipaddress',
				caption : '<fmt:message key="admin.logs.ipaddress" />',
				type : 'text'
			}, ],
			sortData : [ {
				field : 'date',
				direction : 'ASC'
			} ],
			records : []
		});

		w2utils.settings.RESTfull = true;
		w2ui['grid'].load('./logs/json.json');

		w2ui['grid'].searches[0] = {
			field : 'action',
			caption : '<fmt:message key="admin.logs.action" />',
			type : 'list'
		};

		w2ui['grid'].searches[0].options = {};

		w2ui['grid'].searches[0].options.items = ${actions};

		w2ui.grid.on('reload', function(event) {
			event.preventDefault();
			w2ui['grid'].load('./logs/json.json');
		});
	});

	w2utils
			.locale('${ pageContext.request.contextPath }/static/w2grid-${pageContext.response.locale}.json');
</script>
</html>