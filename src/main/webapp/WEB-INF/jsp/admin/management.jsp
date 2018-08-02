<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css" />
<link href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/waitme/waitMe.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/waitme/waitMe.min.js"></script>

</head>
<body>
<div class="managementBody">
  <div class="row cf">
  
    <div id="card1" class="card six col">
		<div class="topbar red">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div>    
		  <h3 class="userInformation">문의글 통계</h3>
		  
		<%-- 문의율 그래프 --%>
        <div id="donutchart"></div>  
    </div>

    <div id="card2" class="card six col">
		<div class="topbar blue">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div>     
    	<h3 class="userInformation">Q&A 답변률</h3>
    	<!-- <div class="allCnt">총 Q&A 0개</div>
    	<div class="ansCnt">총 Q&A 답변 0개</div> -->
		
		<%-- 답변율 그래프 --%>
        <div id="columnchart_material"></div>
	</div>	

    <div id="card3" class="card six col">
		<div class="topbar yellow">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div>
		<div>
			<h3 class="userInformation">Q&A 답변 만족률</h3>
<%-- 			<canvas id="pieCanvas" width="100%" height="65%"></canvas> --%>
        <div id="donutchart1"></div>
		</div>
    </div>
    
  </div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/userInfo/userInfo.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script>
	// 답변률 통계 스크립트
	cnt();
	function cnt() {
		$.ajax({
			url : "/bitcode/admin/answerCnt.json",
			dataType : "json",
			success : answerCnt
		});
	};

	var allCnt, ansCnt;
	var c, c_ans, java, java_ans;
	var jscript, jscript_ans, python, python_ans;
	var asp, asp_ans, php, php_ans;
	
	// 답변률 통계 카운트출력
	function answerCnt(result) {
		
		result = result[0];
		allCnt = result.qna;
		ansCnt = result.qna_ans;
		c = result.c;
		c_ans = result.c_ans;
		java = result.java;
		java_ans = result.java_ans;
		jscript = result.jscript;
		jscript_ans = result.jscript_ans;
		python = result.python;
		python_ans = result.python_ans;
		asp = result.asp;
		asp_ans = result.asp_ans;
		php = result.php;
		php_ans = result.php_ans;

		//$(".allCnt").html("총 Q&A " + allCnt + "개");
		//$(".ansCnt").html("총 Q&A 답변 " + ansCnt + "개");

		// 문의율 그래프
		google.charts.load("current", {
			packages : [ "corechart" ]
		});
		google.charts.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
					[ 'Task', 'Hours per Day' ], [ 'C', c ],
					[ 'Java', java ], [ 'JavaScript', jscript ],
					[ 'Python', python ], [ 'ASP', asp ],
					[ 'PHP', php ] ]);

			var options = {
				title : 'Q&A 문의 주제',
				pieHole : 0.4,
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('donutchart'));
			chart.draw(data, options);

		} // 문의율 그래프

		// 답변율 그래프
		google.charts.load('current', {
			'packages' : [ 'bar' ]
		});
		google.charts.setOnLoadCallback(barChart);
		function barChart() {
			var data = google.visualization.arrayToDataTable([
					[ '언어', 'Q', 'A' ], [ 'C', c, c_ans ],
					[ 'Java', java, java_ans ], [ 'JavaScript', jscript, jscript_ans ],
					[ 'Python', python, python_ans ], [ 'ASP', asp, asp_ans ],
					[ 'PHP', php, php_ans ] ]);
			var options = {
				chart : {
					title : 'Q&A 답변율'
				}
			};
			var chart = new google.charts.Bar(document
					.getElementById('columnchart_material'));
			chart.draw(data, google.charts.Bar.convertOptions(options));
		} // 답변율 그래프

	}

	$(".managementBody").draggable();


	
//------------------------만족률----------------------------//

	
//-----------------------------------------------------------------



// 	답변률 통계 스크립트
	dou();
	function dou() {
		$.ajax({
			url : "/bitcode/admin/minidou.json",
			dataType : "json",
			success : systisCnt
		});
	};
	// 답변률 통계 카운트출력
	function systisCnt(result) {
	

		unstsfCount = result.unstsfCount; 
		midstsfCount = result.midstsfCount; 
		stsfCount = result.stsfCount;

		// 문의율 그래프
		google.charts.load("current", {
			packages : [ "corechart" ]
		});
		google.charts.setOnLoadCallback(drawChart2);
		function drawChart2() {
			
		 var data = google.visualization.arrayToDataTable([
				[ '답변', '만족율' ],
				[ '만족', stsfCount ],
				[ '보통', midstsfCount ],
				[ '불만', unstsfCount ] ]);

			var options = {
				title : 'Q&A 답변의 만족도',
				pieHole : 0.4,
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('donutchart1'));
			chart.draw(data, options);

		} 
	}	
	
</script>

</body>
</html>