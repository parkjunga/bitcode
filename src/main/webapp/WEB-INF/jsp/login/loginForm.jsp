<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/login.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/waitme/waitMe.min.css" /> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/waitme/waitMe.min.js"></script> --%>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pattern/patternLock.css" />
<script src="${pageContext.request.contextPath}/resources/js/pattern/patternLock.js"></script>
</head>
<body>
	<div id="loginUi">
		<form action="${pageContext.request.contextPath}/login/login.do" method="post" id="userForm">
		  <p class="hellotitle">Hello Bit Code !!</p>
		  <input class="inputlogin" name="id" placeholder="UserId" type="text"/>
		  <span id="patternLogin">패턴으로 로그인하기</span>
		  <div class="pattern">
		  <div id="patternContainer"></div>
		  </div>
		  <input class="patternLogin" name="patternPass" hidden="hidden" value="0"/>
		  <input class="inputlogin" name="password" placeholder="Password" type="password"/>
		  <button class="btnL" id="loginBtn">Log in</button>
		</form>
		  <span id="forgetid">ID 찾기</span>
		  <span id="forgetpass">Password찾기</span><br><br>
		  <span id="siciallogin">Social Login ?</span>
		  <span id="signup"><a href="${pageContext.request.contextPath}/login/signupForm.do">회원가입</a></span><br>
	
	<div class="social">
		<div class="na btnL"><a href="${naverurl}">Naver</a></div>
		<div class="btnka"><a id="kakao-login-btnn" href="http://developers.kakao.com/logout"></a></div>
	</div>
    <form name="kakaoForm" id="kakaoForm" method="post" action="${pageContext.request.contextPath}/login/kakaoForm.do">
		<input type="hidden" name="id" id="kakaoId" class="inputlogin"/>
		<input type="hidden" name="email"  id="kakaoEmail" class="inputlogin"/>
		<input type="hidden" name="nickname"  id="kakaoNickname" class="inputlogin"/>
	</form>	
	</div>	
	
	
<script src="${pageContext.request.contextPath}/resources/js/loginform/loginForm.js"></script>

<script> 
//로그인 실패시 alert창 뜸.
if ("${msg}") { 
	swal("${msg}");
} 

var lock = new PatternLock('#patternContainer');
$('#patternContainer').mouseup(function () {
	var patVal = lock.getPattern();
	// 패턴 번호를 input .patternlogin에 입력
	$(".patternLogin").val(patVal);
});
</script> 
</body>
</html>