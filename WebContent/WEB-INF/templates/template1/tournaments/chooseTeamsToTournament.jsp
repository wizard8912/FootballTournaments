<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<head>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/blocksit.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.2.43/jquery.form-validator.min.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
	color: #333;
	font-family: Cambria, Georgia, serif;
	font-size: 15px;
	overflow-x: hidden;
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
	min-height: 450px;
	padding: 15px;
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
	margin: 8px;
	text-align: center;
	font-size: 12px;
	float: left;
	box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
	-moz-box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
	-webkit-box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
	text-align: center;
	font-size: 12px;
	float: left;
	box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
	-moz-box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
	-webkit-box-shadow: 0 1px 3px rgba(34, 25, 25, 0.4);
}

.grid strong {
	margin: 10px 0;
	display: block;
	padding: 0 0 5px;
	font-size: 17px;
}

.grid .meta {
	text-align: right;
	font-style: italic;
}

.grid .imgholder img {
	position: relative;
	max-width: 100%;
	display: block;
	background: #ccc;
	z-index: 18;
}

.grid strong {
	white-space: normal;
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

.form-group {
	background-color: #e3e3e3;
}

.leagueInfo {
	background-color: red;
	height: 100%;
}

.leagueLeft {
	float: left;
	width: 50%;
	height: 350px;
	text-align: right;
	padding-right: 30px;
	text-align: right;
}

.leagueRight {
	float: left;
	width: 50%;
	height: 220px;
	vertical-align: middle;
	padding-left: 30px;
}

.leagueLeft .leagueLeftimg {
	height: 100%;
	display: block;
}

.left_block {
	display: block;
	float: left;
}

.right_block {
	display: block;
	float: right;
}

.LeagueInfo {
	width: 100%;
	height: 90px;
	background-color: #d4d4d4;
}

.mouseOver {
	left: 0px;
	top: 0px;
	background-color: #000;
	width: 188px;
	height: 100%;
	z-index: 1000;
}

.numberOfTeams {
	position: fixed;
	top: 20%;
	right: 5%;
	background: #fffea1;
	border: 1px solid #fc0;
	width: 200px;
	height: 80px;
	text-align: center;
	font-weight: bold;
	font-size: 24px;
}

.fullWidth {
	width: 90%;
	z-index: 2000;
	left: 5%;
	color: green;
	background: #FFD0A3;
}
</style>
</head>
<form id="addTeamsToTour" method="post" action="addTeamsToTournament">
	<input type="hidden" id="listOfTeams" name="listOfTeams" value="">
	<input type="hidden" id="leagueId" name="leagueId"
		value="${ leagueId }">
</form>
<div id="numberOfTeams" class="numberOfTeams"></div>
<div class="container">
	<div class="row">
		<div class="toolbar">
			<div class="pull-right">
				<input id="searchengine" type="text" class="form-control"
					placeholder='<fmt:message key="team.searchPlaceHolder" />' />

			</div>
			<div class="pull-right">

				<label for="myTeams"><fmt:message key="teams.onlyForMe" /></label>
				<input id="myTeams" type="checkbox" value="">&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</div>
	</div>
</div>
<div id="container" class="container">
	<c:forEach items="${teams}" var="team">
		<div class="btn btn-default grid " id="LeagueGrid${team.id }">
			<div class="bottom">
				<div class="imgholder">
					<img src="${ team.logo }" />
				</div>

				<strong>${ team.fullname }</strong>
				<p>${ team.manager }</p>
				<p>${ team.stadium }</p>
				<p>${ team.countryName }</p>
				<p>${ team.leagueName }</p>


				<div class="hidden">
					<p>OFM${ team.onlyForMe	 }</p>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<script>
	var checked = 0;
	var searchWord = "";

	var checkedTeams = 0;
	var numberOfTeams = '${numberOfTeams}';
	var listOfCheckedTeams = "";

	$("#numberOfTeams").text(
			'<fmt:message key="tournaments.numberOfTeamsIs" />: '
					+ checkedTeams + '/' + numberOfTeams);
	$(".grid")
			.click(
					function(index, element) {

						if ($(this).hasClass("btn-default")) {
							if (checkedTeams == numberOfTeams) {
								alert('<fmt:message key="tournaments.noManyTems" />');
								return false;
							}
							listOfCheckedTeams += ($(this)[0].id.substring(10))
									+ ",";
							console.log(listOfCheckedTeams);
							$(this).removeClass("btn-default");
							$(this).addClass("btn-success");
							checkedTeams += 1;
							$("#numberOfTeams").text(
									'<fmt:message key="tournaments.numberOfTeamsIs" />: '
											+ checkedTeams + '/'
											+ numberOfTeams);
							if (checkedTeams == numberOfTeams) {
								$("#numberOfTeams").addClass("fullWidth");
								var $input = $('<br /><button class="btn btn-success" onclick="saveTournament()"><fmt:message key="tournaments.saveTournament" /></button>');
								$input.appendTo($("#numberOfTeams"));
							}
						} else {
							$(this).addClass("btn-default");
							$(this).removeClass("btn-success");
							listOfCheckedTeams = listOfCheckedTeams.replace(
									$(this)[0].id.substring(10) + ",", "");
							console.log(listOfCheckedTeams);
							checkedTeams -= 1;
							$("#numberOfTeams").text(
									'Liczba druzyn: ' + checkedTeams + '/'
											+ numberOfTeams);
							if (checkedTeams != numberOfTeams
									&& $("#numberOfTeams")
											.hasClass("fullWidth")) {
								$("#numberOfTeams").removeClass("fullWidth");
							}
						}
					});

	$("#myTeams").change(function() {
		if ($(this).is(':checked')) {
			checked = 1;
		} else {
			checked = 0;
		}
		filterRecords();
	});

	$("#searchengine").keyup(function() {
		searchWord = $("#searchengine").val().toLowerCase();
		filterRecords();
	});

	function filterRecords() {

		$(".grid").filter(function(index, element) {
			var recordVal = $(this).text().toLowerCase();
			if (recordVal.indexOf(searchWord.toLowerCase()) >= 0) {
				if (checked == 1) {
					if (recordVal.indexOf('ofmtrue') >= 0) {
						$(this).show("slow");
					} else {
						$(this).hide("slow");
					}
				} else {
					$(this).show("slow");
				}
			} else {
				$(this).hide("slow");
			}
		});
	}

	/*
	jQuery-Rotate-Plugin v0.2 by anatol.at
	http://jsfiddle.net/Anatol/T6kDR/
	 */
	$.fn.rotate = function(options) {
		var $this = $(this), prefixes, opts, wait4css = 0;
		prefixes = [ '-Webkit-', '-Moz-', '-O-', '-ms-', '' ];
		opts = $.extend({
			startDeg : false,
			endDeg : 360,
			duration : 1,
			count : 1,
			easing : 'linear',
			animate : {},
			forceJS : false
		}, options);

		function supports(prop) {
			var can = false, style = document.createElement('div').style;
			$.each(prefixes, function(i, prefix) {
				if (style[prefix.replace(/\-/g, '') + prop] === '') {
					can = true;
				}
			});
			return can;
		}

		function prefixed(prop, value) {
			var css = {};
			if (!supports.transform) {
				return css;
			}
			$.each(prefixes, function(i, prefix) {
				css[prefix.toLowerCase() + prop] = value || '';
			});
			return css;
		}

		function generateFilter(deg) {
			var rot, cos, sin, matrix;
			if (supports.transform) {
				return '';
			}
			rot = deg >= 0 ? Math.PI * deg / 180 : Math.PI * (360 + deg) / 180;
			cos = Math.cos(rot);
			sin = Math.sin(rot);
			matrix = 'M11=' + cos + ',M12=' + (-sin) + ',M21=' + sin + ',M22='
					+ cos + ',SizingMethod="auto expand"';
			return 'progid:DXImageTransform.Microsoft.Matrix(' + matrix + ')';
		}

		supports.transform = supports('Transform');
		supports.transition = supports('Transition');

		opts.endDeg *= opts.count;
		opts.duration *= opts.count;

		if (supports.transition && !opts.forceJS) { // CSS-Transition
			if ((/Firefox/).test(navigator.userAgent)) {
				wait4css = (!options || !options.animate)
						&& (opts.startDeg === false || opts.startDeg >= 0) ? 0
						: 25;
			}
			$this.queue(function(next) {
				if (opts.startDeg !== false) {
					$this.css(prefixed('transform', 'rotate(' + opts.startDeg
							+ 'deg)'));
				}
				setTimeout(function() {
					$this.css(
							prefixed('transition', 'all ' + opts.duration
									+ 's ' + opts.easing)).css(
							prefixed('transform', 'rotate(' + opts.endDeg
									+ 'deg)')).css(opts.animate);
				}, wait4css);

				setTimeout(function() {
					$this.css(prefixed('transition'));
					if (!opts.persist) {
						$this.css(prefixed('transform'));
					}
					next();
				}, (opts.duration * 1000) - wait4css);
			});

		} else { // JavaScript-Animation + filter
			if (opts.startDeg === false) {
				opts.startDeg = $this.data('rotated') || 0;
			}
			opts.animate.perc = 100;

			$this.animate(opts.animate, {
				duration : opts.duration * 1000,
				easing : $.easing[opts.easing] ? opts.easing : '',
				step : function(perc, fx) {
					var deg;
					if (fx.prop === 'perc') {
						deg = opts.startDeg + (opts.endDeg - opts.startDeg)
								* perc / 100;
						$this
								.css(
										prefixed('transform', 'rotate(' + deg
												+ 'deg)')).css('filter',
										generateFilter(deg));
					}
				},
				complete : function() {
					if (opts.persist) {
						while (opts.endDeg >= 360) {
							opts.endDeg -= 360;
						}
					} else {
						opts.endDeg = 0;
						$this.css(prefixed('transform'));
					}
					$this.css('perc', 0).data('rotated', opts.endDeg);
				}
			});
		}

		return $this;
	};

	function saveTournament() {
		$("#listOfTeams").val(
				listOfCheckedTeams.substring(0, listOfCheckedTeams.length - 1));
		$("#addTeamsToTour").submit();
	}
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/jquery.validate.min.js"
	charset="UTF-8"></script>