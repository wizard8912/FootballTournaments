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
	src="${pageContext.request.contextPath}/static/w2ui.js"></script>
</head>
<body>
	<div id="grid" style="width: 100%; height: 600px;"></div>

</body>
<script>
	$(function() {
		$('#grid').w2grid({
			name : 'grid',
			header : 'List of Users',
			url : 'users/delete',
			message : 'aaaaa',
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
				caption : '<fmt:message key="admin.users.username" />',
				size : '15%',
				sortable : true,
				attr : 'align=center'
			}, {
				field : 'firstname',
				caption : '<fmt:message key="admin.users.firstname" />',
				size : '15%',
				sortable : true,
				attr : 'align=center'
			}, {
				field : 'lastname',
				caption : '<fmt:message key="admin.users.lastname" />',
				size : '15%',
				sortable : true,
				attr : 'align=center'
			}, {
				field : 'city',
				caption : '<fmt:message key="admin.users.city" />',
				size : '15%',
				sortable : true,
				attr : 'align=center'
			}, {
				field : 'country',
				caption : '<fmt:message key="admin.users.country" />',
				size : '30%',
				sortable : true,
				resizable : true
			}, {
				field : 'birthdate',
				caption : '<fmt:message key="admin.users.birthdate" />',
				size : '25%',
				sortable : true,
				resizable : true,
				attr : 'align=center',
				render : 'date'
			}, {
				field : 'email',
				caption : '<fmt:message key="admin.users.email" />',
				size : '30%',
				sortable : true,
				resizable : true
			}, {
				field : 'registerdate',
				caption : '<fmt:message key="admin.users.registerdate" />',
				size : '30%',
				sortable : true,
				resizable : true,
				attr : 'align=center',
				render : 'date'
			}, {
				field : 'registertime',
				caption : '<fmt:message key="admin.users.registertime" />',
				size : '30%',
				sortable : true,
				resizable : true,
				attr : 'align=center',
				render : 'time'
			}, {
				field : 'role',
				caption : '<fmt:message key="admin.users.role" />',
				size : '30%',
				sortable : true,
				resizable : true
			} ],

			searches : [ {
				field : 'username',
				caption : '<fmt:message key="admin.users.username" />',
				type : 'text'
			}, {
				field : 'firstname',
				caption : '<fmt:message key="admin.users.firstname" />',
				type : 'text'
			}, {
				field : 'lastname',
				caption : '<fmt:message key="admin.users.lastname" />',
				type : 'text'
			}, {
				field : 'city',
				caption : '<fmt:message key="admin.users.city" />',
				type : 'text'
			}, {
				field : 'birthdate',
				caption : '<fmt:message key="admin.users.birthdate" />',
				type : 'date'
			}, {
				field : 'email',
				caption : '<fmt:message key="admin.users.email" />',
				type : 'text'
			}, {
				field : 'registerdate',
				caption : '<fmt:message key="admin.users.registerdate" />',
				type : 'date'
			}, {
				field : 'registertime',
				caption : '<fmt:message key="admin.users.registertime" />',
				type : 'time'
			}, ],
			sortData : [ {
				field : 'todate',
				direction : 'ASC'
			} ],
			onAdd : function(event) {
				w2alert(event);
				
			},
			onEdit : function(event) {
				w2alert('edit');
			},
			onDelete : function(target,data) {
				console.log(target);
				console.log(data);
			},
			onSubmit : function(event) {
				w2alert('save');
			},
			records : []
		});

		w2utils.settings.RESTfull = false;
		w2ui['grid'].load('./users/json.json');
		w2ui['grid'].searches[0] = {
			field : 'role',
			caption : '<fmt:message key="admin.users.role" />',
			type : 'list'
		};
		w2ui['grid'].searches[1] = {
			field : 'country',
			caption : '<fmt:message key="admin.users.country" />',
			type : 'list'
		};

		w2ui['grid'].searches[0].options = {};
		w2ui['grid'].searches[1].options = {};

		w2ui['grid'].searches[0].options.items = ${usersRoles};
		w2ui['grid'].searches[1].options.items = ${countriesNames};

		w2ui.grid.on('reload', function(event) {
			event.preventDefault();
			w2ui['grid'].load('./users/json.json');
		});
	});

	w2utils
			.locale('${ pageContext.request.contextPath }/static/w2grid-${pageContext.response.locale}.json');
</script>
</html>