<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/codeDetail.css">
 --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/detail.css">
<style>
button{
color:#80FF00;
background-color: black;}
</style>
</head>
<body>
	<div class="detailBody" >
	<div id="card1" class="card ten col">
		<div class="topbar yellow">
		<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
		<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div>
		
		<div class="shell-container">
			<form method='post' action='${pageContext.request.contextPath}/codeboard/insert.do'
			enctype="multipart/form-data">
			<input type="hidden" name="id" value="${sessionScope.user.id}" />
		<h2 class="shell_title">코드공유게시판</h2>
			<table class="editTable" >
			<tbody>
			<tr>
			<th>제목</th>
			<td><input class="editTitle" name="title" type="text" />
			<select class="editSelect" id="code" name="languageCode">
			</select>
			</td>
			</tr>
			<tr>
			<th >작성자</th>
			<td class="editWriter"><input type="text" name="nickname" value='${sessionScope.user.nickName}' readonly="readonly" /></td>
			</tr>

			<tr style="height:90%;">
			<th>내용</th>
			<td><div style="width:670px;height:240px;" ><textarea name="content" style="border:1px solid #c5c5c5; width: 100%;
    		height: 230px;"></textarea></div></td>
			</tr>
			<tr>
			<th>파일첨부</th>
			<td><input type="file" name="file" multiple="multiple" ></td>
			</tr>
			</tbody>			
			</table>
			<div class="contents_btn">
			<a href='<c:url value="list.do" />'><input class="editBtn" type="button" value="목록"></a>
			<input class="editSubmit" type="submit" value="등록">	

<%-- 			<a href='<c:url value="list.do" />'><button type="button">목록</button></a>
			<button type='submit'>등록</button> --%>
			</div>
			</form>
		</div>
	</div>
	</div>
	
	<script>
	window.onload = function(){}
	code();
	function code(){
		$.ajax({
			url: `${pageContext.request.contextPath}/qnaboard/selectLanguage.json`,
			dataType: "json"
		})
		.done(function (data){

			for(var count=0; count<data.length; count++){
				var option = $("<option value='"+data[count].code+"'>"+data[count].name+"</option>");
				$('#code').append(option);
			}
		})
	}
	
	$(".detailBody").draggable();
	</script>
</body>
</html>