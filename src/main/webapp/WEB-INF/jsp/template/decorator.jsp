<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script> -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.7.2/mustache.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/notify/index.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/notify/notify.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/waitme/waitMe.min.js"></script>

<meta charset="UTF-8">

 <%-- 하단메뉴 --%> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/footer.css">

<%-- favicon --%> 
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon" />


<%-- 크롬 팝업 --%>
<link href="https://use.fontawesome.com/releases/v5.0.1/css/all.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/cloud.css">

<%-- 메모장 --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/notepad.css">

<%-- 부트스트랩  --%> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> 

<%-- 알림 --%> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notify/style.css">

<%-- waitme --%> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/waitme/waitMe.min.css" />

<%-- contextmenu --%> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/contextMenu.css" />

<title><sitemesh:write property="title" /></title>
<sitemesh:write property="head" />
<style>
/* .content {
	overflow-y: scroll;
	position: relative;
	bottom: 5px;
} */
#dockContainer #dock{
	width: 100%;
	text-align: center;
	margin: 0 auto;
}
#dockContainer {
  position: fixed;
  bottom: 43px;
  text-align: center;
  left: 40%;
  width: 350px;
  background: rgba(255, 255, 255, 0.2);
  border-radius: 10px 10px 0 0;
}

#dockContainer li {
  list-style-type: none;
  display: inline-block;
  position: relative;
}

#dockContainer li img {
  width: 50px;
  height: 50px;
  -webkit-box-reflect: below 2px -webkit-gradient(linear, left top, left bottom, from(transparent), color-stop(0.7, transparent), to(rgba(255, 255, 255, .5)));
  -webkit-transition: all 0.3s;
  -webkit-transform-origin: 40% 70%;
}

#dockContainer li:hover img {
  -webkit-transform: scale(2);
  margin: 0 2em;
}

#dockContainer li:hover+li img,
#dockContainer li.prev img {
  -webkit-transform: scale(1.5);
  margin: 0 1.5em;
}

#dockContainer li span {
  display: none;
  position: absolute;
  bottom: 100px;
  left: 0;
  width: 100%;
  background-color: #222;
  padding: 4px 0;
  border-radius: 7px;
}

#dockContainer li:hover span {
  display: block;
  color: #fff;
}
</style>
</head>
<body>
		<div class="header">
			<c:import url="/WEB-INF/jsp/decorator/topMenu.jsp" />
		</div>
	
		<div class="content">
			<sitemesh:write property="body" />
			
			<!-- context bitMenu start -->
			<div class="bitMenu">
			    <div class="bitMenu-item">
			        <a href="#" class="bitMenu-btn">
			            <i class="fa fa-folder-open"></i>
			            <span class="bitMenu-text">BIT CODE 배경 설정</span>
			        </a>
			    </div>
			    <div class="bitMenu-separator"></div>
			    <div class="bitMenu-item">
			        <button type="button" class="bitMenu-btn">
			            <i class="fa fa-reply"></i>
			            <span class="bitMenu-text" id="back1">배경1</span>
			        </button>
			    </div>
			    <div class="bitMenu-item">
			        <button type="button" class="bitMenu-btn">
			            <i class="fa fa-star"></i>
			            <span class="bitMenu-text" id="back2">배경2</span>
			        </button>
			    </div>
			    <div class="bitMenu-item">
			        <button type="button" class="bitMenu-btn">
			            <i class="fa fa-users"></i>
			            <span class="bitMenu-text" id="back3">배경3</span>
			        </button>
			    </div>
			    <div class="bitMenu-separator"></div>
			    <!-- 
			    <div class="bitMenu-item">
			        <button type="button" class="bitMenu-btn">
			            <i class="fa fa-download"></i>
			            <span class="bitMenu-text" id="userImgSave">Save</span>
			        </button>
			    </div>
			     -->
			    <div class="bitMenu-item">
			        <button type="button" class="bitMenu-btn">
			            <i class="fa fa-trash"></i>
			            <span class="bitMenu-text" id="userImgDel">Delete</span>
			        </button>
			    </div>
			</div>
			<!-- context bitMenu end -->
		</div>
		
		<div class="footer">
			<c:import url="/WEB-INF/jsp/decorator/footer.jsp" />
			

		</div>
		
		
		
<!-- 메모장 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/note/notepad.js"></script>

		
<!-- 우클릭 컨텍스트 메뉴 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/main/contextMenu.js"></script>
		

<script>
//툴팁출력
$("[data-toggle='tooltip']").tooltip();

//배경화면 변경

if("${sessionScope.user}" != ""){
	if(localStorage.getItem('${sessionScope.user.id}').match('1')){
		$(".content, .windows").css("background", "url(/bitcode/resources/images/userMainImg1.jpg)");
	}
	if(localStorage.getItem('${sessionScope.user.id}').match('2')){
		$(".content, .windows").css("background", "url(/bitcode/resources/images/userMainImg2.jpg)");
	}
	if(localStorage.getItem('${sessionScope.user.id}').match('3')){
		$(".content, .windows").css("background", "url(/bitcode/resources/images/userMainImg3.jpg)");
	}
}

</script>

</body>


</html>