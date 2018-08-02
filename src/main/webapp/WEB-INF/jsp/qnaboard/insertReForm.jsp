<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/board/detail.css">

</head>
<body> 

	<div class="detailBody">
	<div id="card1" class="card ten col">
		<div class="topbar blue">
		<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
		<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div> 

		<div class="shell-container">
			<h2 class="shell_title">QnA질문게시판</h2>
			<form action='<c:url value="/qnaboard/insertRe.do"/>' method="post"
				enctype="multipart/form-data" id="qnaRForm">
				<input type="text" name="no" value="${list.qna.no}" hidden="hidden" />
				<input type="text" name="groupNo" value="${list.qna.groupNo}" hidden="hidden" />
				<input type="text" name="depth" value="${list.qna.depth}" hidden="hidden" />
				<input type="text" name="groupOrder" value="${list.qna.groupOrder}" hidden="hidden" />
				<input type="text" name="id" value="${sessionScope.user.id}" hidden="hidden" />
				<table class="editTable">
					<tbody>
						<tr>
							<th>제목</th>
							<td style="text-align: left;"><input class="editTitle" type="text" name="title" value="${list.qna.nickName}님 문의글에 대한 답변글입니다." readonly="readonly"/> 
							<input type="hidden" name="code" value="${list.qna.code}"/> /${list.qna.codeName}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td class="editWriter"><input type="text" value="${sessionScope.user.nickName}" readonly /></td>
						</tr>

						<tr style="height: 90%;">
							<th>내용</th>
							<td><textarea name="content" style="width: 100%; height: 100%; min-height: 232px;"></textarea></td>
						</tr>
						<tr>
							<th>파일첨부</th>
							<td><input type="file" name="file" multiple="multiple"></td>
						</tr>
					</tbody>
				</table>
			<div class="contents_btn">
<%-- 				<a href='<c:url value="/qnaboard/list.do" />'><button type="button">목록</button></a>--%>
				<a href='<c:url value="/qnaboard/list.do" />'><input class="editBtn" type="button" value="목록"></a>
 				<input class="editSubmit" type="button" value="등록">
<!-- 				<button type="submit">등록</button> -->
			</div>
			</form>
		</div>
	</div>
	</div>
	<script>
	window.onload = function(){
	}
	
	// 답글 등록시 답변 알림 전송
	console.dir("${list.qna.id}");
	
	code();
	function code(){
		$.ajax({
			url: "<c:url value='/qnaboard/selectLanguage.json' />",
			dataType: "json"
		})
		.done(function (data){
			for(var i=0; i<data.length; i++){
				$("select[name='code']").append('<option value="'+data[i].code+'">'+data[i].name+'</option>');
			}
		})
	}
	var sendRId = "${list.qna.id}";
	
	$(".editSubmit").click(function() {
		// 답글알림을 받기 위한 원글 아이디 전송
		if(loginId){
			ws.send("notice:" + sendRId);
		}
		// 서브밋
		$("#qnaRForm").submit();
	});
	
	$(".detailBody").draggable();
	</script>
</body>