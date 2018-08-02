<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class="topbar yellow">
		<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
		<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div> 	
		<div class="shell-container">
		<h2 class="shell_title" >코드공유게시판</h2>
			<form method='post' action='${pageContext.request.contextPath}/codeboard/reply.do'
			enctype="multipart/form-data">
			<input type="hidden" name="id" value="${sessionScope.user.id}" />			
			<input type="hidden" name="no" value="${cb.no}" /> 
			<input type="hidden" name="groupOrder" value="${cb.groupOrder}" /> 
			<input type="hidden" name="depth" value="${cb.depth}" />
			<input type="hidden" name="groupNo" value="${cb.groupNo}" />
			<table class="editTable" >
			<tbody>
			<tr>
			<th>제목</th>
			<td style="text-align:left;"><input class="editTitle" name="title" value="${cb.title}"type="text" />
			<select class="editSelect" id="code" name="languageCode">
				<option value='${cb.languageCode}'>${cb.languageName}</option>
			</select>
			</td>
			</tr>
			<tr>
			<th>작성자</th>
			<td class="editWriter"><input type="text" name="nickname" value='${user.nickName}' readonly="readonly"/>
			</td>
			</tr>
			<tr style="height:90%;">
			<th>내용</th>
			<td>
			<textarea name="content" style="width: 100%; height: 100%; min-height: 232px;"></textarea></td>
			</tr>
			<tr>
			<th>파일첨부</th>
			<td><input type="file" name="file" multiple="multiple" ></td>
			</tr>
			</tbody>			
			</table>
			<div class="contents_btn">
			<button class="editSubmit" type='submit'>답변</button>
			<a href='<c:url value="list.do" />'><button class="editBtn" type="button">목록</button></a>
			</div>
			</form>
		</div>
	</div>
	</div>
	
	<script>$(".detailBody").draggable();</script>

</body>
</html>