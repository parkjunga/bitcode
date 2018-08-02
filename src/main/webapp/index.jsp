<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>
<script>
	window.onload = function () {
		location.href = '${pageContext.request.contextPath}/main/main.do';
	}
</script>
</head>
<body>
<%-- 	<c:redirect url="/main/main.do"/> --%>
		<!-- 로그인 임시경로 태그만 설정-->
<%-- 		<c:redirect url="/login/loginForm.do" /> --%>
</body>
</html>
