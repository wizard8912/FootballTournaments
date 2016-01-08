<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
	var selectedUser;
	var selectedUserData;
	
	var config = {
		grid : {
			name : 'gridAdminUsers',
			contentType: "application/json;charset=utf-8",
			url : 'users/delete',			
			load : './users/json.json',
			show : {
				toolbar : true,
				footer : true,
				toolbarAdd : true,
				toolbarEdit : true,
				toolbarDelete : true
			},
			toolbar : {
				items : [ {
					type : 'break'
				}, {
					type : 'button',
					id : 'permissions',
					caption : '<fmt:message key="admin.users.permissions" />',
					img : 'icon-permissions',
					disabled : true
				} ],
				onClick : function(target,data) {
					if(target == "permissions"){
						selectRole();
						var grid = this;
						var formselectRole = w2ui.formselectRole;
						
						formselectRole.recid = selectedUser;
						formselectRole.record = $.extend(true, {}, selectedUserData);
						formselectRole.refresh();
					}
				}
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
				field : 'country',
				caption : '<fmt:message key="admin.users.country" />',
				type : 'list',
				options : {
					items : ${countriesNames}
				}
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
			}, {
				field : 'role',
				caption : '<fmt:message key="admin.users.role" />',
				type : 'list',
				options : {
					items : ${usersRoles}
				}
			} ],
			sortData : [ {
				field : 'todate',
				direction : 'ASC'
			} ],
			onAdd : function(event) {
				addUser();
				var grid = this;
				var formAddUser = w2ui.formAddUser;	
				

			},
			onEdit : function(event) {
				editUser();
				var grid = this;
				var formEditUser = w2ui.formEditUser;
				
				event.onComplete = function () {
					var sel = grid.getSelection();
					if (sel.length == 1) {
						formEditUser.recid = sel[0];
						formEditUser.record = $.extend(true, {}, grid.get(sel[0]));
						formEditUser.refresh();
					} else {
						formEditUser.clear();
					}
				}
			},
			onDelete : function(target, data) {
				console.log(target);
				console.log(data);
			},
			onReload : function(event) {
	 			event.onComplete = function () {var grid = this;
	 			grid.load('./users/json.json');}
	 			
	 		},
	 		onSelect : function(event) {
	 			
	 			event.onComplete = function () {
		 		   if (this.getSelection().length > 0) {
		 			   this.toolbar.enable('permissions');
		 			   selectedUser = this.getSelection()[0];
		 			   selectedUserData = this.get(selectedUser);
		 		   }
	 			}
	 		},
	 		onUnselect : function(event) {
	 			event.onComplete = function () {
	 				if (this.getSelection().length == 0) {
	 					this.toolbar.disable('permissions');
	 				}
	 			} 		   
	 		},
			records : []
		},
		formEditUser : {
			name : 'formEditUser',
			fields : [ {
				name : 'recid',
				type : 'text',
				required : true,
				html : {
					caption : 'ID',
					attr : 'size="25" readonly'
				}
			}, {
				name : 'username',
				type : 'text',
				required : true,
				html : {
					caption : '<fmt:message key="admin.users.username" />',
					attr : 'size="25" maxlength="40"'
				}
			}, {
				name : 'firstname',
				type : 'text',
				required : true,
				html : {
					caption : '<fmt:message key="admin.users.firstname" />',
					attr : 'size="25" maxlength="40"'
				}
			}, {
				name : 'lastname',
				type : 'text',
				required : true,
				html : {
					caption : '<fmt:message key="admin.users.lastname" />',
					attr : 'size="25" maxlength="40"'
				}
			}, {
				name : 'city',
				type : 'text',
				html : {
					caption : '<fmt:message key="admin.users.city" />',
					attr : 'size="25"'
				}
			}, {
				name : 'country',
				type : 'list',
				html : {
					caption : '<fmt:message key="admin.users.country" />',
					attr : 'size="25"'
				},
				options : {
					items : ${countriesNames}
				} 
			}, {
				name : 'birthdate',
				type : 'date',
				html : {
					caption : '<fmt:message key="admin.users.birthdate" />',
					attr : 'size="25"'
				},
				render : 'date'
			}, {
				name : 'email',
				type : 'email',
				html : {
					caption : '<fmt:message key="admin.users.email" />',
					attr : 'size="25"'
				}
			} ],
			actions : {
				Save : function() {
					var errors = this.validate();
					if (errors.length > 0)
						return;
					
						$.ajax({
							url: 'users/edit',
							dataType: 'text',
							type: 'POST',
							data: this.record,
							success: function(response) { 	
								w2popup.open({
						               body      : '<div class="w2ui-centered">' + response + '</div>',
						        buttons   : '<button class="btn" onclick="w2popup.close();">Close</button> ',							                    
						        width     : 500,
						        height    : 300,
						        overflow  : 'hidden',
						        color     : '#dff0d8',
						        speed     : '0.3',
						        opacity   : '0.8',
						        modal     : true,
						        showClose : true,
						        showMax   : true	
						    });	
								w2ui.gridAdminUsers.reload();
								w2popup.close();
							},
							error: function(response){
								w2popup.open({
							               body      : '<div class="w2ui-centered">' + response + '</div>',
							        buttons   : '<button class="btn" onclick="w2popup.close();">Close</button> ',							                    
							        width     : 500,
							        height    : 300,
							        overflow  : 'hidden',
							        color     : '#f2dede',
							        speed     : '0.3',
							        opacity   : '0.8',
							        modal     : true,
							        showClose : true,
							        showMax   : true	
							    });	
								w2ui.gridAdminUsers.reload();
							}
							
						});	
						
						w2ui.gridAdminUsers.selectNone();
						
					}
				
			}
		},
		formselectRole : {
			name : 'formselectRole',
			fields : [ {
				name : 'recid',
				type : 'text',
				required : true,
				html : {
					caption : 'ID',
					attr : 'size="25" readonly'
				}
			}, {
				name : 'username',
				type : 'text',
				required : true,
				html : {
					caption : '<fmt:message key="admin.users.username" />',
					attr : 'size="25" readonly'
				}
			},  {
				name : 'role',
				type : 'list',
				required : true,
				html : {
					caption : '<fmt:message key="admin.users.role" />',
					attr : 'size="25"'
				},
				options : {
					items : ${usersRoles}
				} 
			} ],
			actions : {
				Save : function() {
					var errors = this.validate();
					if (errors.length > 0)
						return;
					
						$.ajax({
							url: 'users/role',
							dataType: 'text',
							type: 'POST',
							data: this.record,
							success: function(response) { 	
								w2popup.open({
						               body      : '<div class="w2ui-centered">' + response + '</div>',
						        buttons   : '<button class="btn" onclick="w2popup.close();">Close</button> ',							                    
						        width     : 500,
						        height    : 300,
						        overflow  : 'hidden',
						        color     : '#dff0d8',
						        speed     : '0.3',
						        opacity   : '0.8',
						        modal     : true,
						        showClose : true,
						        showMax   : true	
						    });	
								w2ui.gridAdminUsers.reload();
								w2popup.close();
							},
							error: function(response){
								w2popup.open({
							               body      : '<div class="w2ui-centered">' + response + '</div>',
							        buttons   : '<button class="btn" onclick="w2popup.close();">Close</button> ',							                    
							        width     : 500,
							        height    : 300,
							        overflow  : 'hidden',
							        color     : '#f2dede',
							        speed     : '0.3',
							        opacity   : '0.8',
							        modal     : true,
							        showClose : true,
							        showMax   : true	
							    });	
								w2ui.gridAdminUsers.reload();
							}
							
						});	
						
						w2ui.gridAdminUsers.selectNone();
						
					}
				
			}
		} ,
		formAddUser : {
			name : 'formAddUser',
			fields : [ {
				name : 'username',
				type : 'text',
				required : true,
				html : {
					caption : '<fmt:message key="admin.users.username" />',
					attr : 'size="25" maxlength="40"'
				}
			},{
				name : 'password',
				type : 'password',
				required : true,
				html : {
					caption : '<fmt:message key="admin.users.password" />',
					attr : 'size="25" maxlength="40"'
				}
			}, {
				name : 'firstname',
				type : 'text',
				required : true,
				html : {
					caption : '<fmt:message key="admin.users.firstname" />',
					attr : 'size="25" maxlength="40"'
				}
			}, {
				name : 'lastname',
				type : 'text',
				required : true,
				html : {
					caption : '<fmt:message key="admin.users.lastname" />',
					attr : 'size="25" maxlength="40"'
				}
			}, {
				name : 'city',
				type : 'text',
				html : {
					caption : '<fmt:message key="admin.users.city" />',
					attr : 'size="25"'
				}
			}, {
				name : 'country',
				type : 'list',
				html : {
					caption : '<fmt:message key="admin.users.country" />',
					attr : 'size="25"'
				},
				options : {
					items : ${countriesNames}
				} 
			}, {
				name : 'birthdate',
				type : 'date',
				html : {
					caption : '<fmt:message key="admin.users.birthdate" />',
					attr : 'size="25"'
				},
				render : 'date'
			}, {
				name : 'email',
				type : 'email',
				html : {
					caption : '<fmt:message key="admin.users.email" />',
					attr : 'size="25"'
				}
			},{
				name : 'forgotPassQ',
				type : 'text',
				html : {
					caption : '<fmt:message key="admin.users.forgotPassQ" />',
					attr : 'size="25"'
				}
			},{
				name : 'forgotPassA',
				type : 'text',
				html : {
					caption : '<fmt:message key="admin.users.forgotPassA" />',
					attr : 'size="25"'
				}
			} ],
			actions : {
				Save : function() {
					
					var errors = this.validate();
					if (errors.length > 0)
						return;
									
						$.ajax({
							url: 'users/add',
							dataType: 'text',
							type: 'POST',
							data: this.record,
							success: function(response) { 	
								w2popup.open({
						               body      : '<div class="w2ui-centered">' + response + '</div>',
						        buttons   : '<button class="btn" onclick="w2popup.close();">Close</button> ',							                    
						        width     : 500,
						        height    : 300,
						        overflow  : 'hidden',
						        color     : '#dff0d8',
						        speed     : '0.3',
						        opacity   : '0.8',
						        modal     : true,
						        showClose : true,
						        showMax   : true	
						    });	
								w2ui.gridAdminUsers.reload();
								w2popup.close();
							},
							error: function(response){
								w2popup.open({
							               body      : '<div class="w2ui-centered">' + response + '</div>',
							        buttons   : '<button class="btn" onclick="w2popup.close();">Close</button> ',							                    
							        width     : 500,
							        height    : 300,
							        overflow  : 'hidden',
							        color     : '#f2dede',
							        speed     : '0.3',
							        opacity   : '0.8',
							        modal     : true,
							        showClose : true,
							        showMax   : true	
							    });	
								w2ui.gridAdminUsers.reload();
							}
							
						});	
						
						w2ui.gridAdminUsers.selectNone();
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

	function editUser () {
	    if (!w2ui.formEditUser) {
	        $().w2form(config.formEditUser);
	    }
	    $().w2popup('open', {
	        title   : '<fmt:message key="admin.users.edituser" />',
	        body    : '<div id="formEditUser" style="width: 100%; height: 100%;"></div>',
	        style   : 'padding: 15px 0px 0px 0px',
	        width   : 500,
	        height  : 400, 
	        showMax : true,
	        onToggle: function (event) {
	            $(w2ui.formEditUser.box).hide();
	            event.onComplete = function () {
	                $(w2ui.formEditUser.box).show();
	                w2ui.formEditUser.resize();
	            }
	        },
	        onOpen: function (event) {
	            event.onComplete = function () {
	                // specifying an onOpen handler instead is equivalent to specifying an onBeforeOpen handler, which would make this code execute too early and hence not deliver.
	                $('#w2ui-popup #formEditUser').w2render('formEditUser');
	            }
	        }
	    });
	}
	
	function addUser () {
	    if (!w2ui.formAddUser) {
	        $().w2form(config.formAddUser);
	    }
	    $().w2popup('open', {
	        title   : '<fmt:message key="admin.users.addUser" />',
	        body    : '<div id="formAddUser" style="width: 100%; height: 100%;"></div>',
	        style   : 'padding: 15px 0px 0px 0px',
	        width   : 500,
	        height  : 500, 
	        showMax : true,
	        onToggle: function (event) {
	            $(w2ui.formAddUser.box).hide();
	            event.onComplete = function () {
	                $(w2ui.formAddUser.box).show();
	                w2ui.formAddUser.resize();
	            }
	        },
	        onOpen: function (event) {
	            event.onComplete = function () {
	                // specifying an onOpen handler instead is equivalent to specifying an onBeforeOpen handler, which would make this code execute too early and hence not deliver.
	                $('#w2ui-popup #formAddUser').w2render('formAddUser');
	            }
	        }
	    });
	}
	
	function selectRole () {
	    if (!w2ui.formselectRole) {
	        $().w2form(config.formselectRole);
	    }
	    $().w2popup('open', {
	        title   : '<fmt:message key="admin.users.selectRole" />',
	        body    : '<div id="formselectRole" style="width: 100%; height: 100%;"></div>',
	        style   : 'padding: 15px 0px 0px 0px',
	        width   : 500,
	        height  : 400, 
	        showMax : true,
	        onToggle: function (event) {
	            $(w2ui.formselectRole.box).hide();
	            event.onComplete = function () {
	                $(w2ui.formselectRole.box).show();
	                w2ui.formselectRole.resize();
	            }
	        },
	        onOpen: function (event) {
	            event.onComplete = function () {
	                // specifying an onOpen handler instead is equivalent to specifying an onBeforeOpen handler, which would make this code execute too early and hence not deliver.
	                $('#w2ui-popup #formselectRole').w2render('formselectRole');
	            }
	        }
	    });
	}
</script>
</html>