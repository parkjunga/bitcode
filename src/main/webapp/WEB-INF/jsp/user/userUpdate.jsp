<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/userupdate.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/waitme/waitMe.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/waitme/waitMe.min.js"></script>
</head>
<body>
<div class="updateUserform">
	<form action="${pageContext.request.contextPath}/user/updateUser.do" method="post" id="userForm">
		<h1 id="#signup">나의 정보 수정 <img src="${pageContext.request.contextPath}/resources/images/signupIcon.png"></h1>
		<p id="pName">ID</p>	  
		<input name="id" type="text" id="userId" data-flag="no" class="inputDetail" readonly="readonly" value="${sessionScope.user.id}"/>
		<p id="pName">이름</p>
		<input name="name" type="text" id="userName" data-flag="no" class="inputDetail" readonly="readonly" value="${user.name}"/>
		<p id="pName">별명</p>	 
		<input name="nickName" type="text" id="nickName" data-flag="no" class="inputDetail" placeholder="변경할 닉네임을 입력하세요" />
		<p id="pName">Email</p>
		<input name="email" type="text" id="userEmail" data-flag="no" class="emailDetail" placeholder="변경할 이메일을 입력하세요"/>
	    <p class="innerText"></p>
		<p id="pName">Birthday</p>
		<div class="birthday">
			<input type="text" name="year" id="birth1" size="4" class="inputDetail1" value="${yearId1}" readonly="readonly"/>
			<input type="text" name="month" id="birth2"  size="2" class="inputDetail1" value="${monthId1}" readonly="readonly"/>
			<input type="text" name="date" id="birth3"  size="2" class="inputDetail1" value="${dateId1}" readonly="readonly"/>  
		</div>
		   <input name="birthday" type="hidden" class="inputDetail" id="birthday"/>
		<hr>
		<div id="submitBox1">
			 <a href="#1" id="submitBtn">Update Click</a>
		</div>
	</form>
		<div id="submitBox">	 
			 <a href="${pageContext.request.contextPath}/user/userInfo.do?id=${sessionScope.user.id}" id="submitBtn1" role="button">Cancel</a>
		</div>
</div>	
<script src="${pageContext.request.contextPath}/resources/js/userInfo/userUpdate.js"></script>
	
<script>
if("${msg}") {
	swal("${msg}")
}
</script>
</body>
</html>