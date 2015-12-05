<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/blocksit.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/w2ui.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
	color: #333;
	font-family: Cambria, Georgia, serif;
	font-size: 15px;
	overflow-x: hidden;
}

header, section, footer, hgroup {
	display: block;
}

a {
	color: #35BFFF;
	text-decoration: none;
}

a:hover, a:active {
	color: #91DCFF;
}

/* Header */
#header {
	width: 100%;
	background: #000;
	background: rgba(0, 0, 0, 0.8);
	padding: 5px 0;
	letter-spacing: 1px;
	margin-bottom: 20px;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 99;
}

#header h1 {
	padding: 0 20px;
	margin: 5px 0;
	text-shadow: 2px 1px 1px #333, 2px 2px 1px #888;
	color: #EAEAEA;
	float: left;
	font-size: 27px;
}

#backlinks {
	float: right;
	padding: 0 20px;
	line-height: 22px;
	font-weight: bold;
	font-size: 13px;
}

#backlinks a {
	text-align: right;
	display: block;
}

/* Footer */
#footer {
	width: 100%;
	position: fixed;
	padding-left: 20px;
	bottom: 0;
	left: 0;
	line-height: 20px;
	color: #888;
	font-size: 13px;
	background: rgb(0, 0, 0);
	background: rgba(0, 0, 0, 0.8);
	z-index: 99;
}

#footer span {
	display: block;
}

/* clearfix */
.clearfix {
	clear: both;
}

/* wrapper css */
#wrapper {
	margin-top: 70px;
	width: 100%;
}

#wrapper hgroup {
	text-align: center;
}

#wrapper h2 {
	margin: 5px 0;
	color: #FF6D99;
	text-shadow: 1px 1px 2px #A50031;
	font-size: 33px;
	font-family: Arial Narrow, Arial, sans-serif;
}

#wrapper h3 {
	font-style: italic;
	font-weight: normal;
	font-size: 18px;
	text-shadow: 1px 1px 0 #fff;
	color: #888;
	margin: 5px 0;
}

#container {
	position: relative;
	width: 1100px;
	margin: 0 auto 25px;
	padding-bottom: 10px;
}

.grid {
	position: relative;
	width: 188px;
	min-height: 330px;
	padding: 15px;
	background: #fff;
	margin: 8px;
	text-align: center;
	font-size: 12px;
	float: left;
	box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
	-moz-box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
	-webkit-box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
	-webkit-transition: top 1s ease, left 1s ease;
	-moz-transition: top 1s ease, left 1s ease;
	-o-transition: top 1s ease, left 1s ease;
	-ms-transition: top 1s ease, left 1s ease;
	font-size: 12px;
}

.grid strong {
	border-bottom: 1px solid #ccc;
	margin: 10px 0;
	display: block;
	padding: 0 0 5px;
	font-size: 17px;
}

.grid .meta {
	text-align: right;
	color: #777;
	font-style: italic;
}

.grid .imgholder img {
	max-width: 100%;
	background: #ccc;
	display: block;
	background: #ccc;
}

@media screen and (max-width : 1240px) {
	body {
		overflow: auto;
	}
}

@media screen and (max-width : 900px) {
	#backlinks {
		float: none;
		clear: both;
	}
	#backlinks a {
		display: inline-block;
		padding-right: 20px;
	}
	#wrapper {
		margin-top: 90px;
	}
}

.toolbar {
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
}

.btn-small {
	position: absolute;
	right: 0;
	width: 25px;
	height: 25px;
	background:
		url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAABT0lEQVRIie2TvUrDUACF8whZOorgG7gGBKEv4BNIJ0cJzRaX0kUnFaUgURQEobj056aUQhshGEXRLkJBWqwl5ormQjYzHoe0qbVpU42LkANnO3wf93Ivx8XppyuKPJWklZnGcAo8bLIMpp6AKi7MnTas3OakfavVmDdqlbwlSXjLbrTDoYw4YARgBKAK8Jwdti/z9+bpGb3dc4uaAV2vw5IkvKTTqXGBXcr40K/9LhiUKsBrHqgmgQMOD/ohipqBO6N23RVFPrqgt+vDB+01j/FhqVvBV/QTQUcGKsIIHNWkdyK7lIkm6MgAWQyGMxJREAaPLKgvTYdHFlzNAecJD14RxuFRBI/aGtT9BeAyATQE7xUF7X8roDfruFdXgSd5+A/+UhD40WLBvxY4YOQC7+UUnAIPM3cEc5tOEYzsJwjKYuiI4zhfRhV3ln2c0HwCvWBCF9N7dEUAAAAASUVORK5CYII=')
		no-repeat;
}

.bottom {
	position: absolute;
	width: 80%;
	align: center;
	bottom: 20px;
}

.break {
	width: 10px;
}
</style>
</head>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<c:if test="${alert != null}">
				<div class="alert alert-success text-center" role="alert">
					<fmt:message key="${alert}" />
				</div>
			</c:if>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="toolbar">
			<button type="button" class="btn btn-blue" onClick="addLeague();">
				<fmt:message key="league.addLeague" />
			</button>

			<div class="pull-right">
				<input id="searchengine" type="text" class="form-control"
					placeholder='<fmt:message key="league.searchPlaceHolder" />' />

			</div>
			<div class="pull-right">

				<label><fmt:message key="league.onyForMe" /></label> <input
					id="myLeagues" type="checkbox" value="">&nbsp;&nbsp;&nbsp;&nbsp;
			</div>

		</div>
	</div>
</div>

<div id="container" class="container">
	<c:forEach items="${leagues}" var="league">
		<div class="grid" id="LeagueGrid${league.id }">
			<div class="bottom">
				<div class="imgholder">
					<img src="${ league.logo }" />
				</div>

				<strong>${ league.fullname }</strong>
				<p>${ league.countryName }</p>

				<fmt:message key="league.level" />
				: ${ league.level }
				<div class="pull-right">
					<div class="btn btn-primary btn-small"
						title="<fmt:message key='league.clickToEdit' />"
						onclick="alert(${league.id});"></div>
				</div>
				<div class="hidden">
					<p>OFM${ league.onlyForMe	 }</p>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<script>
	$(document).ready(function() {
	});
	
	var config = {
			formAddLeague : {
				name : 'formAddLeague',
				fields : [
					{
						name : 'league.fullname',
						type : 'text',
						required : true,
						html : {
							caption : '<fmt:message key="league.fullname" />',
							attr : 'size="25 maxlength="100"'
						}
					},{
						name : 'league.shortname',
						type : 'text',
						required : true,
						html : {
							caption : '<fmt:message key="league.shortname" />',
							attr : 'size="25 maxlength="10"'
						}
					},    {
						name : 'league.countryName',
						type : 'enum',
						required : true,
						html : {
							caption : '<fmt:message key="league.country" />',
							attr : 'size="25 maxlength="100"'
						},
						options : {
							items : ${countriesNames},
							max : 1
						}
					},    {
						name : 'league.level',
						type : 'int',
						required : true,
						html : {
							caption : '<fmt:message key="league.level" />',
							attr : 'size="25 maxlength="100"'
						}
					},    {
						name : 'league.logo',
						type : 'text',
						required : true,
						html : {
							caption : '<fmt:message key="league.logo" />',
							attr : 'size="25 maxlength="100"'
						}
					},    {
						name : 'league.onlyForMe',
						type : 'checkbox',
						html : {
							caption : '<fmt:message key="league.onlyForMe" />',
							attr : 'size="25 maxlength="100"'
						}
					}
				],
				actions : {
					Save : function() {
						var errors = this.validate();
						if (errors.length > 0)
							return;
							
						var obj = (this.record);
						
							$.ajax({
								url: 'leagues/add',
								dataType: 'text',
								type: 'POST',
								data: this.record,
								success: function(response) { 	
									w2popup.close();
									w2popup
									.open({
										body : '<div class="w2ui-centered">'
												+ response + '</div>',
										buttons : '<button class="btn" onclick="w2popup.close();location.reload();">Close</button> ',
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
									
								},
								error: function(response){
									alert(response);
								}
								
							});	
						}
					
				}
			}
	}
	
	function addLeague() {
		if (!w2ui.formAddLeague) {
			$().w2form(config.formAddLeague);
		}
		$()
				.w2popup(
						'open',
						{
							title : '<fmt:message key="league.addLeague" />',
							body : '<div id="formAddLeague" style="width: 100%; height: 100%;"></div>',
							style : 'padding: 15px 0px 0px 0px',
							width : 500,
							height : 400,
							showMax : true,
							onToggle : function(event) {
								$(w2ui.formAddLeague.box).hide();
								event.onComplete = function() {
									$(w2ui.formAddLeague.box).show();
									w2ui.formAddLeague.resize();
								}
							},
							onOpen : function(event) {
								event.onComplete = function() {
									// specifying an onOpen handler instead is equivalent to specifying an onBeforeOpen handler, which would make this code execute too early and hence not deliver.
									$('#w2ui-popup #formAddLeague').w2render(
											'formAddLeague');
								}
							}
						});
	}
	
	w2utils
	.locale('${ pageContext.request.contextPath }/static/w2grid-${pageContext.response.locale}.json');
	
	var checked = 0;
	var searchWord = "";
	
	$( "#myLeagues" ).change(function(){
		  if($(this).is(':checked')){
		    checked = 1;
		  } else {
		    checked = 0;
		  }
		  filterRecords();
	});
	
	$( "#searchengine" ).keyup(function() {
		searchWord = $( "#searchengine" ).val().toLowerCase();
		filterRecords();
	});
	
	function filterRecords(){
		
		$( ".grid" )  .filter(function( index, element ) {	
			var recordVal = $( this ).text().toLowerCase();
		    if(recordVal.indexOf(searchWord.toLowerCase()) >= 0) {
				if (checked == 1) {
					if (recordVal.indexOf('ofm1') >= 0){
						$(this).show("slow");
					} else {
						$(this).hide("slow");
					}
				}else{
		    	$(this).show("slow");
		    	}
			} else {
				$(this).hide("slow");
			}
		  });
	}
	
	
</script>