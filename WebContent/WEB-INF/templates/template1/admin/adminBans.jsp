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
	var config = {
		grid : {
			name : 'gridAdminBans',
			header : 'List of Bans',
			url : 'bans/delete',
			show : {
				toolbar : true,
				footer : true,
				toolbarAdd : true,
				toolbarDelete : true
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
				size : '200px',
				sortable : true,
				attr : 'align=center'
			}, {
				field : 'bannedFromDate',
				caption : '<fmt:message key="admin.bans.fromdate" />',
				size : '100px',
				attr : 'align=center',
				sortable : true,
				resizable : true,
				render : 'date'
			}, {
				field : 'bannedFromTime',
				caption : '<fmt:message key="admin.bans.fromtime" />',
				size : '100px',
				attr : 'align=center',
				sortable : true,
				resizable : true,
				render : 'time'
			}, {
				field : 'bannedToDate',
				caption : '<fmt:message key="admin.bans.todate" />',
				size : '100px',
				attr : 'align=center',
				sortable : true,
				resizable : true,
				render : 'date'
			}, {
				field : 'bannedToTime',
				caption : '<fmt:message key="admin.bans.totime" />',
				size : '100px',
				attr : 'align=center',
				sortable : true,
				resizable : true,
				render : 'time'
			}, {
				field : 'banauthor',
				caption : '<fmt:message key="admin.bans.author" />',
				size : '200px',
				attr : 'align=center',
				sortable : true,
				resizable : true
			}, {
				field : 'reason',
				caption : '<fmt:message key="admin.bans.reason" />',
				size : '40%',
				sortable : true,
				resizable : true
			}, {
				field : 'active',
				caption : '<fmt:message key="admin.bans.active" />',
				size : '50px',
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
				field : 'bannedFromTime',
				caption : '<fmt:message key="admin.bans.fromtime" />',
				type : 'time'
			}, {
				field : 'bannedToTime',
				caption : '<fmt:message key="admin.bans.totime" />',
				type : 'time'
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
				addBan();
				var grid = this;
				var formAddBan = w2ui.formAddBan;
			},
			onDelete : function(event) {

			},
			onSubmit : function(event) {
				w2alert('save');
			},
			onReload : function(event) {
				event.onComplete = function() {
					var grid = this;
					grid.load('./bans/json.json');
				}

			},
			records : []
		},
		formAddBan : {
			name : 'formAddBan',
			fields : [ {
				name : 'username',
				type : 'list',
				required : true,
				html : {
					caption : '<fmt:message key="admin.bans.username" />',
					attr : 'size="25" maxlength="40"'
				},
				options : {
					items : ${usersList}
				}
			}, {
				name : 'todate',
				type : 'date',
				required : true,
				html : {
					caption : '<fmt:message key="admin.bans.todate" />',
					attr : 'size="25" maxlength="40"'
				}
			}, {
				name : 'totime',
				type : 'time',
				required : true,
				html : {
					caption : '<fmt:message key="admin.bans.totime" />',
					attr : 'size="25"'
				}
			}, {
				name : 'reason',
				type : 'text',
				required : true,
				html : {
					caption : '<fmt:message key="admin.bans.reason" />',
					attr : 'size="25"'
				}
			} ],
			actions : {
				Save : function() {

					var errors = this.validate();
					if (errors.length > 0)
						return;

					$
							.ajax({
								url : 'bans/add',
								dataType : 'text',
								type : 'POST',
								data : this.record,
								success : function(response) {
									w2popup
											.open({
												body : '<div class="w2ui-centered">'
														+ response + '</div>',
												buttons : '<button class="btn" onclick="w2popup.close();">Close</button> ',
												width : 500,
												height : 300,
												overflow : 'hidden',
												color : '#dff0d8',
												speed : '0.3',
												opacity : '0.8',
												modal : true,
												showClose : true,
												showMax : true
											});
									w2ui.gridAdminBans.reload();
									w2popup.close();
								},
								error : function(response) {
									w2popup
											.open({
												body : '<div class="w2ui-centered">'
														+ response + '</div>',
												buttons : '<button class="btn" onclick="w2popup.close();">Close</button> ',
												width : 500,
												height : 300,
												overflow : 'hidden',
												color : '#f2dede',
												speed : '0.3',
												opacity : '0.8',
												modal : true,
												showClose : true,
												showMax : true
											});
									w2ui.gridAdminBans.reload();
								}

							});

					w2ui.gridAdminBans.selectNone();
					w2popup.close();

				}
			}
		}

	}

	$(function() {
		$('#grid').w2grid(config.grid);

		w2utils.settings.RESTfull = true;
	});

	w2utils
			.locale('${ pageContext.request.contextPath }/static/w2grid-${pageContext.response.locale}.json');

	function addBan() {
		if (!w2ui.formAddBan) {
			$().w2form(config.formAddBan);
		}
		$()
				.w2popup(
						'open',
						{
							title : '<fmt:message key="admin.bans.addban" />',
							body : '<div id="formAddBan" style="width: 100%; height: 100%;"></div>',
							style : 'padding: 15px 0px 0px 0px',
							width : 500,
							height : 400,
							showMax : true,
							onToggle : function(event) {
								$(w2ui.formAddBan.box).hide();
								event.onComplete = function() {
									$(w2ui.formAddBan.box).show();
									w2ui.formAddBan.resize();
								}
							},
							onOpen : function(event) {
								event.onComplete = function() {
									// specifying an onOpen handler instead is equivalent to specifying an onBeforeOpen handler, which would make this code execute too early and hence not deliver.
									$('#w2ui-popup #formAddBan').w2render(
											'formAddBan');
								}
							}
						});
	}
</script>
</html>