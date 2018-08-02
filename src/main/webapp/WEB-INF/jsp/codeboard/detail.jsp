<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/detail.css">
</head>
<body>
			<input type="hidden" name="groupOrder" value="${cb.groupOrder}" /> 
			<input type="hidden" name="depth" value="${cb.depth}" />
			<input type="hidden" name="groupNo" value="${cb.groupNo}" />
			<input type="hidden" name="oriId" value="${cb.id}" />
<div class="detailBody">
	<div id="card1" class="card ten col">
		<div class="topbar yellow">
		<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
		<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div>

	<div class="shell-container code">
		<div class="contents_header" >
				<div class="titleWrap" >
<%-- 					<c:if test="${empty list.code}">없습니다.</c:if> --%>
					<div class="title">
					<span class="codeTitle" ><c:out value="${cb.title}"/></span>
					<span class="nowrap">|</span>
					<span class="cf" >${cb.languageName}</span> 
				</div>
					<span class="day" ><fmt:formatDate value="${cb.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
				</div>

				<div class="header_info">
					<span class="shell_writer" ><c:out value="${cb.nickName}" /></span>
					<span class="shell_hits" >조회<c:out value="${cb.viewCnt}" /></span>
				</div>
			</div>
			<div class="boardList" >
				<div class="contents_body">
					<div class="detail">
					<div class="contents">
					<c:forEach var="cbFile" items="${cbFileList}">
					<!-- 파일명:  --><a href="${pageContext.request.contextPath}/fileDown.do?filePath=${cbFile.filePath}&systemFileName=${cbFile.systemName}&originalFileName=${cbFile.oriName}">
					 <img class="imgLink" src="${pageContext.request.contextPath}/fileDown.do?filePath=${cbFile.filePath}&systemFileName=${cbFile.systemName}&originalFileName=${cbFile.oriName}">
					<%-- ${cbFile.oriName} --%></a>					
	        		<!-- 미리보기 : --> <br>
					</c:forEach>
					${cb.content}
					</div>
					<div class="like">
					<a id="codeLike" class="LikeGood" href="javascript:recommend()">추천 </a>
					<span class="like_count"><c:out value="${cb.likeCnt}" /></span>
					</div>
					</div>
				
				
<!-- 				댓글 -->
			<ul class="reBody">
				
			</ul>
			
			<%-- 댓글 등록 --%>
			<ul class="writeComment">
			<li class="reWrite">
			<form id="commentR" action='' method="post">
				<input type="hidden" name="no" value="${cb.no}">
				<input type="hidden" name="groupNo" value="${cb.groupNo}">
				<div class="reWriteDiv">
				<input type="text" name="id" value="${sessionScope.user.nickName}" hidden="hidden"/>
				<table>
					<tbody>
						<tr>
							<td width="130px">${sessionScope.user.nickName}</td>
							<td width="500px"><textarea name="content" style="resize: none;"></textarea></td>
							<td width="100px"><button id="Rbtn" class="resubmit btn btn-default btn-group-xs">등록</button></td>
						</tr>
					</tbody>
				</table>
				</div>
			</form>
			</li>
			</ul>
			</div>
			<div class="contents_btn">
    		<a href='<c:url value="list.do" />'><button class="editBtn">목록</button></a>
			<a href='<c:url value="replyForm.do?no=${cb.no}" />'><button class="editSubmit">답변</button></a>
			<c:if test="${cb.id == sessionScope.user.id}">
			<a href='<c:url value="updateForm.do?no=${cb.no}" />'><button class="editSubmit">수정</button></a>
			<a href='<c:url value="delete.do?no=${cb.no}"/>'><button class="editBtn">삭제</button></a>
			</c:if>
			</div>
			</div>
		</div>
		</div>
	</div>
	<script>
	function recommend() {
		$.ajax({
			url: "like.json",
			dataType: "json",
			data: {
				no: '${cb.no}',
				id: '${sessionScope.user.id}',
				oriId:'${cb.id}'
			}
		})
		.done(function (result){
			if(result == '0'){
				alert('이미 추천한 게시글 입니다.')
			}else{
				$(".like_count").html(result)
				alert('추천 완료');
			}
		})
	}

	// 댓글 삭제
 	function commentDelete(commentNo) {
		$.ajax({
			url: "commentDelete.json",
			data: {
				no: "${cb.no}", 
				commentNo: commentNo
			},
			dataType: "json",
			success:  commentList
		});
	} 
	
	//댓글 업데이트 폼
	function commentUpdateForm(commentNo){
		$(".reBody li[id^=cN]").show();
		$(".reBody li[id^=modCN]").remove();
		
		var modId = $("#cN" + commentNo + " > div.reHeader > p.reWriter").text();
		var modContent = $("#cNum" + commentNo).text();
		
		var html = '';
	
		html += '<li id="cN' + commentNo + '" class="commentOr">';
		html += '<div class="reHeader">';
		html += '<p class="reWriter">'+ modId +'</p>';
		html += '<span class="reDay"></span>';
		html += '<a href="javascript:commentUpdate(' + commentNo + ');" id="cu' + commentNo + '" class="btn btn-success btn-sm" role="button">확인</a>';
		html += '<a href="javascript:commentCancel(' + commentNo + ');" id="cu' + commentNo + '" class="btn btn-success btn-sm" role="button">취소</a>';
		html += '<div id="cNum' + commentNo + '" class="comment"><input type="text" name="content" id="modComment' + commentNo + '" value="' + modContent + '"></div>'; 
		html += '</li>';
		
		$("#cN" + commentNo).after(html);
		$("#cN" + commentNo).hide();
	} // 댓글 업데이트 폼
					
	// 댓글 업데이트
	function commentUpdate(commentNo) {
		$.ajax({
		url: "commentUpdate.json",
		type:"POST",
		data :{
			no:"${cb.no}",
			commentNo:commentNo,
			content: $("#modComment" + commentNo).val()
			},
		dataType: "json"
	   })
	.done(function(data){
		commentList(data);
	});
	} // 댓글 업데이트
	
	// 댓글 수정 취소
	function commentCancel(commentNo) {
		$("#cN" + commentNo).show();
		$("#modCN" + commentNo).remove();
	} // 댓글 수정 취소
	
	// 댓글 등록
	$("#Rbtn").click(function(e){
		e.preventDefault();
		var formData = $("#commentR").serialize();	
	$.ajax({
		url: "commentRegist.json",
		type:"POST",
		cache: false,
		data: formData
	}).done(function(data){
		$("#commentR > div.reWriteDiv textarea").val("");
		commentList(data);
	})
	})
	
	// 댓글 리스트 출력
	function  commentList(data){
		var html ="";
		$("ul.reBody").html("");
		for(let i of data){
			html+='<li id="cN' + i.commentNo + '" class="commentOr"><div class="reHeader"><p class="reWriter">'+i.id+'</p>';
			var date = new Date(i.regDate);
			var time = date.getFullYear() + "년" 
			         + (date.getMonth() + 1) + "울" 
			         + date.getDate() + "일"
			         + date.getHours() + ":"
			         + date.getMinutes() + ":"
			         + date.getSeconds();
			html += '<span class="reDay">' + time + '</span>';
 			html += '<a href="javascript:commentUpdateForm(' + i.commentNo + ')" id="cu' + i.commentNo + '" class="btn btn-success btn-sm" role="button">수정</a>';
			html += '<a href="javascript:commentDelete(' + i.commentNo + ')" class="btn btn-success btn-sm" role="button">삭제</a>';
			/* html += '<span class="recomment"><a href="#">답글</a></span></div>';   */
			html += '<div id="cNum' + i.commentNo + '" class="comment">'+i.content+'</div></li>'; 
		}
		if(data.length == 0){
			html += '<div class="comment">리뷰가 존재하지 않습니다.</div></li>';
		}
		$("ul.reBody").html(html);
	
} 
	function selectComment(){
		$.ajax({
			url: "commentList.json",
			data:{no:"${cb.no}"},
			dataType:"json",
		}).done(function(data){
			commentList(data);
		})
	}
	selectComment();
	$(".detailBody").draggable();	
	</script>
<%-- 	<script src="${pageContext.request.contextPath}/resources/js/codeboard/codeBoardDetail.js"></script> --%>
</body>
</html>