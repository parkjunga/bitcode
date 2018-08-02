<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a {
		width: 100%;
		display: inline;
	}
	.remoteScale{
		margin: 8px;
		width: 75%;
		height: 750px;
	}
	.chat {
		margin: 8px;
		width: 20%;
		height: 730px;
		bottom: 0px;
	}
</style>
</head>
<body>
	<div class=	"a">
		<div class="remoteScale">
	<%-- 		<img src="${pageContext.request.contextPath}/images/error.PNG" > --%>
			<img src="<c:url value="/resources/images/error.PNG"/>" width="100%">
		</div>
		<div class="chat">
			<input type="text" id="msg" />
			<button id="msgBtn">메세지 전송</button>
		</div>
	</div>
	
	<script>
		$("#msgBtn").click(function () {
			$.notify("Hello World");
		})
	</script>
</body>
</html>