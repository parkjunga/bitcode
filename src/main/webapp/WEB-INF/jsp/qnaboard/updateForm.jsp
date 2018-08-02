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
			<form action='<c:url value="/qnaboard/update.do"/>' method="post"
				enctype="multipart/form-data">
							<input type="hidden" name="no" value="${list.qna.no}"/>
				<table class="editTable">
					<tbody>
						<tr>
							<th>제목</th>
							<td style="text-align: left;"><input class="editTitle" type="text" name="title" value="${list.qna.title}"/> 
							<select class="editSelect" name="code">
									<option>분류</option>
							</select></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td class="editWriter"><input type="text" name="writer" value="${list.qna.nickName}" readonly="readonly"/></td>
						</tr>

						<tr style="height: 90%;">
							<th>내용</th>
							<td><textarea name="content" style="width: 100%; height: 100%; min-height: 232px;"><c:out value="${list.qna.content}"/></textarea></td>
						</tr>
					 	<tr>
							<th>파일첨부</th>
							<c:forEach items="${fileList}" var="i">
							<input type="hidden" name="fileNo" value="${i}">
							</c:forEach>
							<td><input type="file" name="file" multiple="multiple" value="${i.oriName}"></td>
						</tr> 
					</tbody>
				</table>
			<div class="contents_btn">
				<a href='<c:url value="/qnaboard/list.do" />'><input class="editBtn" type="button" value="목록"></a>
				<!-- <button type="submit">수정</button> -->
				<input class="editSubmit" type="submit" value="수정">
				<input class="editBtn" type="button" value="삭제">
				<!-- <button>삭제</button> -->
			</div>
			</form>
		</div>
		</div>
		</div>
	
	<script>
	/* window.onload = function(){
	} */
	code();
	function code(){
		$.ajax({
			url: "<c:url value='/qnaboard/selectLanguage.json' />",
			dataType: "json"
		})
		.done(function (data){
			console.log(data);
			for(var i=0; i<data.length; i++){
				$("select[name='code']").append('<option value="'+data[i].code+'">'+data[i].name+'</option>');
			}
		}).fail(function(result){
			console.log('에러',result)
		})
	}
	
	$(".detailBody").draggable();
	
	</script>
</body>