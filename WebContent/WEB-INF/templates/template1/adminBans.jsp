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
	href="http://w2ui.com/src/w2ui-1.4.3.min.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://w2ui.com/src/w2ui-1.4.3.min.js"></script>
</head>
<body>
	<div id="grid" style="width: 100%; height: 600px;"></div>


</body>
<script>
	$(function() {
		$('#grid').w2grid({
			name : 'grid',
			header : 'List of Bans',
			show : {
				toolbar : true,
				footer : true,
				toolbarAdd : true,
				toolbarDelete : true,
				toolbarSave : true,
				toolbarEdit : true
			},
			columns : [ {
				field : 'recid',
				caption : 'ID',
				size : '50px',
				sortable : true,
				attr : 'align=center'
			}, {
				field : 'username',
				caption : '<fmt:message key="admin.bans.username" />',
				size : '15%',
				sortable : true,
				attr : 'align=center'
			}, {
				field : 'bannedFromDate',
				caption : '<fmt:message key="admin.bans.fromdate" />',
				size : '25%',
				sortable : true,
				resizable : true
			}, {
				field : 'bannedToDate',
				caption : '<fmt:message key="admin.bans.todate" />',
				size : '30%',
				sortable : true,
				resizable : true
			}, {
				field : 'banauthor',
				caption : '<fmt:message key="admin.bans.author" />',
				size : '30%',
				sortable : true,
				resizable : true
			}, {
				field : 'reason',
				caption : '<fmt:message key="admin.bans.reason" />',
				size : '30%',
				sortable : true,
				resizable : true
			} ],

			searches : [ {
				field : 'username',
				caption : '<fmt:message key="admin.bans.username" />',
				type : 'text'
			}, {
				field : 'bannedFromDate',
				caption : '<fmt:message key="admin.bans.fromdate" />',
				type : 'date'
			}, {
				field : 'bannedToDate',
				caption : '<fmt:message key="admin.bans.todate" />',
				type : 'date'
			}, {
				field : 'banauthor',
				caption : '<fmt:message key="admin.bans.author" />',
				type : 'text'
			}, {
				field : 'reason',
				caption : '<fmt:message key="admin.bans.reason" />',
				type : 'text'
			}, ],
			sortData : [ {
				field : 'todate',
				direction : 'ASC'
			} ],
			onAdd : function(event) {
				w2alert('add');
			},
			onEdit : function(event) {
				w2alert('edit');
			},
			onDelete : function(event) {
				console.log('delete has default behaviour');
			},
			onSubmit : function(event) {
				w2alert('save');
			},
			records : []
		});

		w2utils.settings.RESTfull = true;
		w2ui['grid'].load('./bans/json.json');

		w2ui.grid.on('reload', function(event) {
			event.preventDefault();
			w2ui['grid'].load('./bans/json.json');
		});
	});

	w2utils
			.locale('${ pageContext.request.contextPath }/static/w2grid-${pageContext.response.locale}.json');
</script>
</html>