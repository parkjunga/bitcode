<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pattern</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pattern/patternLock.css" />
<script src="${pageContext.request.contextPath}/resources/js/pattern/patternLock.min.js"></script>
</head>
<body>
	<div id="patternContainer" style="    margin-top: 60px; margin-left: 60px;"></div>

	<script>
		lock = new PatternLock('#patternContainer');
	</script>
</body>
</html>