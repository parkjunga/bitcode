<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/signup.css" />
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.css" /> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/waitme/waitMe.min.css" /> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/waitme/waitMe.min.js"></script> --%>
</head>
<body>
<div class="signuoForm">
	<form action="${pageContext.request.contextPath}/login/signup.do" method="post" id="userForm">
	  <p id="signuph1">Sign UP! <img src="${pageContext.request.contextPath}/resources/images/signupIcon.png"></p>
	  <p id="commentSignup">더 나은 이용을 위해서는 사용자의 정보가 필요합니다.</p>	
	  <input name="id" placeholder="ID를 입력하세요" type="text" id="userId" data-flag="no" class="inputDetail"  value="${id}" readonly="readonly"/>
	  <p class="innerText"></p>
	  <input name="name" placeholder="이름을 입력하세요" type="text" id="userName" data-flag="no" class="inputDetail" maxlength="15"/>
	  <p class="innerText"></p>
	  <input name="nickName" placeholder="Nick name을 입력하세요" type="text" id="nickName" data-flag="no" class="inputDetail" value="${nickName}"/>
	  <p class="innerText"></p>
	  <input name="password" placeholder="비밀번호를 입력하세요" type="password" id="userPass" data-flag="no" class="inputDetail" maxlength="16"/>
	  <p class="innerText"></p>
	  <input name="conformpass" placeholder="비밀번호를  재입력하세요" type="password" id="userPassCheck" data-flag="no" class="inputDetail" maxlength="16"/>
	  <p class="innerText"></p>	  
	  <input name="email" type="text" id="userconformEmail" data-flag="no" class="inputDetail" value="${email}"/>
	  <p class="innerText"></p>
 
  <div class="birthday">
<!--   	<input type="date" name="birthday" id="userBirth"> -->
    <input type="text" name="year" id="birth1" size="4" data-flag="no" class="inputDetail1" placeholder="Year"/>
    <input type="text" name="month" id="birth2"  size="2" data-flag="no" class="inputDetail1" placeholder="Month" />
    <input type="text" name="date" id="birth3"  size="2" data-flag="no" class="inputDetail1" placeholder="Day"/>  
  	<p class="birthText">Example) 2000 01 01</p>
  </div>
  <input name="birthday" type="hidden" class="inputDetail" id="birthday"/>
<!-- 	  <button class="btn" id="submitBtn">Sign UP</button> -->
	  <div id="submitBox">
	 	 <a href="#1" id="submitBtn"><span class="signupbtn">Sign UP</span></a>
	 </div>
	   <div id="submitBox1">	
	 	 <a href="${pageContext.request.contextPath}/login/loginForm.do" id="submitBtn1"><span class="signupbtn">Cancel</span></a>
	  </div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/resources/js/signUp/socialSignup.js"></script>
<script>

if("${msg}") {
	swal("${msg}")
}
</script>
</body>
</html>