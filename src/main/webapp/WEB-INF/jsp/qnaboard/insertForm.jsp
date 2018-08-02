<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/board/detail.css">
 --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/detail.css">

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
			<form id="insertForm" action='<c:url value="/qnaboard/insert.do"/>' method="post"
				enctype="multipart/form-data" onsubmit="return check()">
				<input type="text" name="id" hidden="hidden" value="${sessionScope.user.id}" />
				<table class="editTable">
					<tbody>
						<tr>
							<th>제목</th>
							<td style="text-align: left;"><input id="insertTitle" class="editTitle" type="text" name="title" /> 
							<select class="editSelect" name="code">
									<!-- <option value="">분류</option> -->
							</select></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td class="editWriter"><c:out value="${sessionScope.user.nickName}" /></td>
							
							
						</tr>

						<tr style="height: 90%;">
							<th>내용</th>
							<td><textarea id="insertContent" name="content" style="width: 100%; height: 100%; min-height: 232px;"></textarea></td>
						</tr>
						<tr>
							<th>파일첨부</th>
							<td><input type="file" name="file" multiple="multiple"></td>
						</tr>
					</tbody>
				</table>
			<div class="contents_btn">
				<a href='<c:url value="/qnaboard/list.do" />'><input class="editBtn" type="button" value="목록"></a>
				<%-- <a href='<c:url value="/qnaboard/list.do" />'><button type="button">목록</button></a> --%>
				<input class="editSubmit" type="submit" value="등록">
				<!-- <button type="submit">등록</button> -->
			</div>
			</form>
		</div>
		</div>
	</div>
	<script>
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
	
	function check() {

		// 제목 null인지 체크 
		if ($("#insertTitle").val() == "") {
			alert("제목을 확인해주세요.")
			return false;
		}

		// 내용 null인지 체크 
		if ($("#insertContent").val() == "") {
			alert("내용을 써주세요.")
			return false;
		}
		;

	};
	
	$(".detailBody").draggable();
	</script>
</body>