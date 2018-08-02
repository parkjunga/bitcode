<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/itnews/itnewsdetail.css" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>

<!--   기사 내용부분 -->	
<div class="card-grid-space1">
<div class="topbar red">
	<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
	<div class="maxbtn"><span></span></div>
	<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/itnews/list.do'">x</div>
</div>  
	 <div class="cardITNewsDetail1">  
		<div class="articleall"> 
	 	<h1 id="articleTitle">${article.articleTitle}</h1>
	    <hr>
	    <span id="articleReport">${article.articleReporter}</span><span id="articleReport">${article.articleDate}${article.articleNo}</span>
	    <a href="${article.articleUrl}" id="articleUrl" target="_blank" title="새창으로 열립니다." 
	    onclick="window.open(this.href,'팝업창title','scrollbars=yes, top=90px, left=300px, width=1000px, height=600px'); return false;">
		원본 기사 보기 클릭...</a>
	    <div class="cardITNewsDetail"><img src="${article.articleThumb}"></div>
		<hr>
		<p id="articleContent">
		${fn:replace(article.articleContent, '다.', "다.<br/>")}
		<a href="${article.articleUrl}" id="articleUrl" target="_blank" title="새창으로 열립니다." 
	    onclick="window.open(this.href,'팝업창title','scrollbars=yes, top=180px, left=300px, width=800px, height=600px'); return false;">
		원본 기사 보기 클릭...</a>
		</p>
			<div id="comment">
			<hr>
				<div id="commentList"></div>
				<div>
					<c:if test="${sessionScope.user.id != null}">
					<form id="writeForm">
						<h5>댓글쓰기</h5>
						<div class="commetWrap">
						<textarea name="commentText" class="commentTextarea"></textarea>
<!-- 						<button class="btn3"><div id="q">등록</div></button> -->
						<input type="submit" class="btn3" value="등록">
						</div>
					</form>
					<div class="btnITList"><a href='${pageContext.request.contextPath}/itnews/list.do' class="ITList" role="button" >목록</a></div>	
					</c:if>	
					<div style="text-align: right;">
						<c:if test="${sessionScope.user.id eq newsComment.id && sessionScope.user.id != null}">
							<button class="btn2" onclick="location.href='updateForm.do?articleNo=${user.id}'">수정</button>
							<button class="btn2" onclick="location.href='delete.do?articleNo=${user.id}'">삭제</button>
						</c:if>
						
					</div>
				</div>
			</div>	 
		</div>		 
	  </div> 
</div> 
<!--   댓글부분 -->
<script>
$(".card-grid-space1").draggable();

	function makeCommentList(result) {
		var html = "";
		for (let i = 0; i < result.length; i++) {
			var comment = result[i];
			html += '<div class="comment_box" id="comment'+comment.commentNo+'">';
			html += '  <span id="commentId">'+comment.nickName+ '</span>';
			if ("${sessionScope.user.id}" == comment.id) {
			html += '    <button class="btn2" onclick="commentUpdateForm('+comment.commentNo+');">수정</button>'
			html += '    <button class="btn2" onclick="commentDelete('+comment.commentNo+');">삭제</button>';
			}
			html += '  <br>';
			html += '  <div id="commentTextDiv">'+comment.content+'</div>';
// 			html += '  <br>';
			html += '</div>';
			html += '<hr>';
		}
		if (result.length == 0) {
			html += '<div class="comment_box">댓글이 존재하지 않습니다.</div>'
		}
		$("#commentList").html(html);
	}
	
	function commentList() {
		$.ajax({
			url: "/bitcode/itnews/commentList.json",
			type: "GET",
			data: {articleNo:"${article.articleNo}"},
			dataType: "json",
			success: makeCommentList
		});
	}

	
	$("#writeForm").submit(function (e) {
		e.preventDefault();
		$.ajax({
			url: "/bitcode/itnews/commentWrite.json",
			type: "GET",
			data: {
				id: "${sessionScope.user.id}",
				articleNo: "${article.articleNo}",
				content: $("#writeForm textarea").val()
			},
			dataType: "json"
		})
		.done(function (result) {
			console.log(result)
			$("#writeForm textarea").val("");
			makeCommentList(result);
		});
	});
	
	function commentDelete(commentNo) {
		$.ajax({
			url: "/bitcode/itnews/commentDelete.json",
			data: {
				articleNo: "${article.articleNo}",
				commentNo: commentNo
			},
			dateType: "json",
			success: makeCommentList
		});
	}
	
	function commentUpdateForm(commentNo) {
		var html = '';
		html += '<div id="modComment'+ +comment.nickName+ +'">';
		html += '  <h5>' + $("#comment"+commentNo+"> h5 > #commentName").text();
		html += '  <button class="btn2" onclick="commentUpdate('+ commentNo +');">수정</button>';
		html += '  <button class="btn2" onclick="commentCancel('+ commentNo +');">취소</button></h5>';
		html += '<textarea name="commentText" class="commentTextarea" id="commentText'+ commentNo +'">';
		html += $("#comment"+commentNo+"> #commentTextDiv").text();
		html += '</textarea>';
		html += '</div>';
		$("#comment" + commentNo).after(html);
		$("#comment" + commentNo).hide();
	}
	
	function commentUpdate(commentNo) {
		$.ajax({
			url: "/bitcode/itnews/commentUpdate.json",
			type: "GET",
			data: {
				articleNo: "${article.articleNo}",
				commentNo: commentNo,
				content: $("#commentText" + commentNo).val()
			},
			dateType: "json",
			success: function (result) {
				makeCommentList(result);
			}
		});
	}
	
	function commentCancel(commentNo) {
		$("#comment" + commentNo).show();
		$("#modComment" + commentNo).remove();
	}
	commentList();
</script>


</body>
</html>