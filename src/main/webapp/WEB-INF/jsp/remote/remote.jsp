<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/remote/remote.css">
<!-- <script src="https://localhost:10001/socket.io/socket.io.js"></script> -->
<script src="https://192.168.0.165:10001/socket.io/socket.io.js"></script>

<%-- 고유 링크 생성 스크립트 --%>
<script>
if(!location.hash.replace('#', '').length) {
    location.href = location.href.split('#')[0] + '#' + (Math.random() * 100).toString().replace('.', '');
    location.reload();
}
</script>

<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.js"></script>

<!-- scripts used for screen-sharing -->
<script src="https://cdn.webrtc-experiment.com/socket.io.js"> </script>
<script src="${pageContext.request.contextPath}/resources/js/remote/detectRTC.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/adapterLatest.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/codecsHandler.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/bandwidthHandler.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/iceServersHandler.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/conference.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/screenCapturing.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/getScreenId.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/screen.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/embed.js"></script>

<link rel="preload" as="script" href="https://c.disquscdn.com/next/embed/common.bundle.5f8e47303ecf1055cd7c6905466d140a.js">
<link rel="preload" as="script" href="https://c.disquscdn.com/next/embed/lounge.bundle.33067ddbd4792de0b384ceb588602715.js">
<link rel="preload" as="script" href="https://disqus.com/next/config.js">

<style>

</style>
</head>

<body>



<div class="remoteBody">
<div id="card1" class="card ten col">
	<div class="topbar green">
	<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
	<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
	</div> 
	
<div class="shareTitle remote">
	<c:if test="${sessionScope.user.auth eq 'U'}">
	<span id="number-of-participants">화면 공유를 해주시면 상담 신청이 완료됩니다.</span>
	<button id="shareScreen" class="screenShare order btn btn-default btn-group-xs">화면 공유</button>
    <button id="endScreen" class="screenShare order btn btn-default btn-group-xs">상담 종료</button>
    </c:if>
    
	<!-- 화면 공유 페이지 링크 주소 -->
	<div class="hide-after-join">
		<input type="text" id="user-name" placeholder="Your Name" hidden="hidden" value="${sessionScope.user.id}">
	    <!-- 문의 주제 -->
	    <form id="qForm">
	    <input type="text" id="id" name="id" value="${sessionScope.user.id}" hidden="hidden">
	    <input type="text" id="nickName" name="nickName" value="${sessionScope.user.nickName}" hidden="hidden">
	    <input type="text" id="question" name="question" value="${sessionScope.question}" hidden="hidden">
	    <input type="text" id="link" name="link" hidden="hidden">
	    </form>
	</div>
	    
	<!-- 화면 공유 대기 리스트 -->
	<c:if test="${sessionScope.user.auth eq 'S'}">
	<div style="width: 100%;" id="roomsList" class="hide-after-join"></div>
    </c:if>
	

	<!-- 상담창 -->
	<div class="embedded-container remoteList">
			<div class="embedded-player-az">
				<div class="media" style="position: relative;">
				<%-- 화면출력창 --%>
				<div class="screen media-left" id="videos-container">
				</div>
				<%-- 채팅창 --%>
				<div class="chat media-right">
<!-- 				<iframe id="chatIframe" src="https://localhost:10001"> -->
				<iframe id="chatIframe" src="https://192.168.0.165:10001">
				</iframe>
				</div>
			</div>
		</div>
	</div>

</div>
<!-- remote -->
</div>
<!-- card1 -->
</div>
<!-- remoteBody -->  

<script src="${pageContext.request.contextPath}/resources/js/remote/remote.js"></script>  

<%-- 화면 공유 --%>
<script>

// 상담종료시 상담신청 List에서 정보 삭제
$("#endScreen").click(function() {
	$("#videos-container").empty();
	$("#shareScreen").toggle();
	$("#endScreen").toggle();
	$.ajax({
		type : "POST",
		url : "/bitcode/remote/remoteDel.json",
		data : {"id" : "${sessionScope.user.id}"}
	}) // ajax
	.always(function() {
		location.href = "/bitcode/main/main.do";
		//location.href = ("/bitcode/remote/list.do");
		//location.href = "list.do";
		//response.sendRedirect(request.getHeader("referer"));
	});
});

// 페이지 이동시 상담신청 List에서 정보 삭제
$(window).on("unload", function(e){
	$.ajax({
		type : "POST",
		url : "/bitcode/remote/remoteDel.json",
		data : {"id" : "${sessionScope.user.id}"},
	})
	.always(function() {
		swal({
			  title: '페이지 이동시 상담이 종료됩니다.',
			  text: "확인을 누르시면 메인 페이지로 이동합니다.",
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '확인'
			}).then((result) => {
			  if (result.value) {
				location.href = "/bitcode/main/main.do";
			  }
			})
		//location.href = "list.do";
		//response.sendRedirect(request.getHeader("referer"));
	}); // ajax
});

// 노드(채팅)서버로 방번호/아이디 보내기
setTimeout(function () {
	document.querySelector("#chatIframe").contentWindow.postMessage(JSON.stringify({"roomId": roomId, "sender": "${sessionScope.user.nickName}"}), "*");	
}, 1000);

$(".remoteBody").draggable();

</script>

</body>
</html>