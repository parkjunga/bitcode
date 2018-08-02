<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/remote/remoteList.css">
</head>
<body>

	<div class="remoteBody">
		<div id="card1" class="card ten col">
			<div class="topbar red">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
			</div> 
			
			<h3 class="userInformation">상담 신청 목록</h3>
			
			<div class="remote">
			<table class="remoteList table table-hover">
				<tr>
					<th width="60%">문의주제</th>
					<th width="20%">신청자</th>
					<th width="20%">상담</th>
				</tr>

				<c:choose>
					<c:when test="${not empty remoteList}">
						<c:forEach var="remote" items="${remoteList}">
							<tr>
								<td>${remote.question}</td>
								<td>${remote.nickName}</td>
								<c:if test="${sessionScope.user.auth eq 'S'}">
									<td><a href="${remote.link}">상담연결</a></td>
								</c:if>
								<c:if test="${sessionScope.user.auth eq 'U'}">
									<td><a href="#" onclick="remoteAlert();">상담연결</a></td>
								</c:if>
								
							</tr>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<tr>
							<td colspan="3">대기중인 상담이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</table>
			<!-- remoteList -->
			</div>
			<!-- remote -->
		<button type="button" class="btn btn-default btn-group-xs pull-right order">상담신청</button>
		</div>
		<!-- card1 -->

	</div>
	<!-- remoteBody -->
	
	<script>
	
	// 로그인 확인창
	$(".order").click(function(){
		if("${sessionScope.user}" == ""){
			swal({
				  title: '로그인이 필요한 서비스 입니다.',
				  text: "확인을 누르시면 로그인 페이지로 이동합니다.",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '확인'
				}).then((result) => {
				  if (result.value) {
					  location.href='/bitcode/login/loginForm.do'
				  }
				})
		} // 로그인알림
		else{
			location.href='/bitcode/remote/insertForm.do';
		}
	})
	
	// 상담 연결 제한 알림 창
	function remoteAlert () {
		swal({
			  title: '상담 연결은 관리자만 가능합니다.',
			  type: 'warning',
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '확인'
			})
	};
	
	$(".remoteBody").draggable();

	</script>
</body>
</html>