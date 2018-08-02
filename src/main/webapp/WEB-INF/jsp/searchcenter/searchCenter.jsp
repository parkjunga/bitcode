<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Search Center</title>
<meta name="viewport" 
      content="width=device-width, user-scalable=no, initial-scale=1">
<meta charset="utf-8">
<script src="https://maps.google.com/maps/api/js?sensor=false"></script>
<script src="${pageContext.request.contextPath}/resources/js/searchcenter/searchcenter.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchcenter/searchcenter.css">
</head>
<body>
<div class="mapBody">

	<div id="card1" class="card six col">
		<div class="topbar green">
		<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
		<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div>
		<div class="map" style="margin-bottom:30px">
<!-- <form> -->
<!-- 	<input type="button" id="watch" value="찾기" /> -->
<!-- 	<input type="button" id="clearWatch" value="clearWatch" /> -->
<!-- </form> -->

<!-- <div id="location"> -->
<!-- 당신의 현재 위치 -->
<!-- </div> -->


<div id="map" style="margin-bottom:30px;">
</div>
<span style="color:black;">서울 강남구 테헤란로5길 11 YOO빌딩 3층, 지하철 2호선 강남역 12번 출구(도보 2분)</span>
<div id="distance">
현 위치에서의 거리 : 
</div>

</div>
</div>
</div>
<script>
$(".mapBody").draggable();
</script>
</body>
</html>