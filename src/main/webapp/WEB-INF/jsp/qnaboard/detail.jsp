<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/detail.css"> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/detail.css">
<style>
a {
	color: #333333
}
</style>
</head>
<body>


	<input type="hidden" name="groupNo" value="${list.qna.groupNo}">
	<input type="hidden" name="depth" value="${list.qna.depth}">
	<input type="hidden" name="groupOrder" value="${list.qna.groupOrder}">
	<input type="hidden" name="oriId" value="${list.ori}"> 
	<input type="hidden" name="qnaId" value="${list.qna.id}"> 
	<input type="hidden" name="qnaId" value="${list.qna.stsfcCode}"> 
	
	<div class="detailBody">
	<div id="card1" class="card ten col">
		<div class="topbar blue">
		<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
		<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div> 
		
		<div class="shell-container">
			<!-- <h2 class="shell_title">QnA질문게시판</h2> -->
		<div class="contents_header">
			<div class="titleWrap">
				<c:if test="${empty list.qna}">없습니다.</c:if>
				<div class="title">
				<span class="qnaTitle"><c:out value="${list.qna.title}" /></span>
				<span class="nowrap">|</span>
				<span class="cf"><c:out value="${list.qna.codeName}" /></span>
				</div>
				<span class="day"><fmt:formatDate value="${list.qna.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
			</div>

			<div class="header_info">
				<span class="shell_writer"><c:out value="${list.qna.nickName}"/></span>
				<span class="shell_hits">조회<span><c:out value="${list.qna.viewCnt}" /></span></span>
			</div>
		</div>
		<div class="boardList">
		<div class="contents_body">
			<div class="detail">
			<div class="contents" style="">
			<c:forEach var="qna" items="${list.qna.fileList}">
       		<!-- <span>미리보기 :</span>  -->
       	
						<div>
			<!-- <span>다운로드 링크 : </span>  -->
			<a href="${pageContext.request.contextPath}/fileDown.do?filePath=${qna.filePath}&systemFileName=${qna.systemName}&originalFileName=${qna.oriName}" title="${qna.oriName}">	<img class="imgLink" src="${pageContext.request.contextPath}/fileDown.do?filePath=${qna.filePath}&systemFileName=${qna.systemName}&originalFileName=${qna.oriName}"></a>
       		</div>
			<br>
			</c:forEach>
			${list.qna.content}
			</div>
			<c:if test="${!sessionScope.user.id}">
			<div class="like">
			<a id="qnaLike" class="LikeGood" href="javascript:recommend()">추천 </a>
            <span class="like_count"><c:out value="${list.qna.likeCnt}" /></span>
			</div>
			</c:if>
			</div>
		<!-- 	만족		 -->
<%--  			<c:if test="${list.ori == sessionScope.user.id and list.qna.depth == 1}">   --%>
         <c:if test="${list.ori == sessionScope.user.id and list.qna.depth == 1}">  
            <div class="satisDiv">        
            <span class="satisAn">
            <input type="radio" class="satisGood" id="satisS" name="stsfcCode" value="13"/>
            <label for="satisS"><img src="${pageContext.request.contextPath}/resources/images/vergood.png"></label>
            </span>
            <span class="satisAn">
            <input type="radio" class="satisGood" id="satisJ" name="stsfcCode" value="12"/>
            <label for="satisJ"><img src="${pageContext.request.contextPath}/resources/images/good.png"></label>
            </span>
            <span class="satisAn">
            <input type="radio" class="satisGood" id="satisU" name="stsfcCode" value="11"/>
            <label for="satisU"><img src="${pageContext.request.contextPath}/resources/images/notgood.png"></label>
            </span>
            <a href="#" id="statisBtn">Click</a>
            </div>        
        </c:if>        
			<%-- 댓글 출력 --%>
			<ul class="reBody">
			</ul>
			
			<%-- 댓글 등록 --%>
			<ul class="writeComment">
			<li class="reWrite">
			<form id="commentR" action='' method="post">
				<input type="hidden" name="no" value="${list.qna.no}">
				<input type="hidden" name="groupNo" value="${list.qna.groupNo}">
				<div class="reWriteDiv">
				<input type="text" name="id" value="${sessionScope.user.id}" hidden="hidden"/>
				<table>
					<tbody>
						<tr>
							<td style="width:130px;">${sessionScope.user.nickName}</td>
							<td width="500px"><textarea name="content" style="resize: none;"></textarea></td>
							<td width="100px"><button id="Rbtn" class="resubmit btn btn-default btn-group-xs">등록</button></td>
						</tr>
					</tbody>
				</table>
				</div>
				<!-- 
				<div class="reBtn">
				</div>
				 -->
			</form>
			</li>
			</ul>
			</div>

			<div class="contents_btn">
				<a href='<c:url value="/qnaboard/list.do" />'><input class="editBtn" type="button" value="목록"></a>
				<a id="cBtn" href='<c:url value="/qnaboard/insertReForm.do?no=${list.qna.no}"/>'><input class="editSubmit" type="button" value="답변"/></a>
				<c:if test="${list.qna.id == sessionScope.user.id}">
				<a id="mBtn" href='<c:url value="/qnaboard/updateForm.do?no=${list.qna.no}" />'><input class="editSubmit" type="button" value="수정"/></a>
				<a id="dBtn" href='<c:url value="/qnaboard/delete.do?no=${list.qna.no}"/>' ><input class="editBtn" type="button" value="삭제" /></a>
				</c:if>
				<!-- <a href="#"><button>삭제</button></a> -->
			</div>

			
		</div>
		<!-- qnaList -->
		</div>
		<!-- qna -->
		</div>
		<!-- card1 -->
	</div>
	<!-- qnaBody -->
	
	
	<script>
		$("#statisBtn").click(function () {
        //라디오 버튼 Name 가져오기
        var radio_btn = document.getElementsByName("stsfcCode");
        //라디오 버튼이 체크되었나 확인하기 위한 변수
        var radio_btn_check = 0;
        var radioCheck = null;
        for(var i = 0; i<radio_btn.length; i++){
            //만약 라디오 버튼이 체크가 되어있다면 true
            if(radio_btn[i].checked==true){
                //라디오 버튼 값
                radioCheck = radio_btn[i].value;
            }
        }
    	$.ajax({
    		url: "/bitcode/user/satisAn.json",
    		data: {
    			"id" : "${sessionScope.user.id}",
    			"stsfcCode": radioCheck,
    			"no": "${list.qna.no}",
    			"groupOrder": "${list.qna.groupOrder}",
    			"groupNo": "${list.qna.groupNo}"
    		},
    		dataType: "json",
    		success: function (data) {
    			console.log(data);
    			if(data == true){
    				swal("체크 되었습니다.");
    				setTimeout( function() {
    					location.reload();
    					}, 3000);
    			}else {
    				swal("이미 체크 되었거나, 답변자만 체크가 가능합니다.");
    			}
    		}
    	});      
	});
	
	
	// 추천 
	//var oriWriter = $("input[name='id']").val();
	
	
	var session = '${sessionScope.user.auth}';
	var sessionId = '${sessionScope.user.id}';
	var sessionP = '${sessionScope.user.point}';
	
/* 	// 수정,삭제 버튼 본인 제한 
	$(function(){
		if(sessionId == nName){
			$("#mBtn").css("display","inline-block");
			$("#dBtn").css("display","inline-block");
		}
	
	
	})
	 */
	
	
	//alert(sessionP);
	 
	// 답글 관리자및 고수로 제한
	$("#cBtn").click(function(){ 
		if(session != 'S' && sessionP <= 250 ){
			alert("관리자 와 고수외에는 답글이 불가능 합니다.")
			return false;
		}
		
	});
	
	// 추천수
	function recommend(){
		$.ajax({
		    url:"<c:url value='/qnaboard/likeUpdate.json'/>",
		   data:{no:"${list.qna.no}",
			     id: $("input[name='id']").val(),
			     oriId:$("input[name='oriId']").val()
		   		 },
		   dataType: "json"
		})
		.done(function(result){
 			if(result == '0'){
				alert("이미 추천한 글입니다.")
		 	} else{
		 		$(".like_count").html(result);				
		 	};
		});
	}
	// 댓글 삭제
 	function commentDelete(commentNo) {
		$.ajax({
			url: "<c:url value='/qnaboard/commentDelete.json'/>",
			data: {
				no: "${list.qna.no}", 
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
		html += '<div>';
		html += '<a href="javascript:commentUpdate(' + commentNo + ');" id="cu' + commentNo + '" class="coBtn" role="button">확인</a>';
/* 		html += '<a href="javascript:commentCancel(' + commentNo + ');" id="cu' + commentNo + '" class="btn btn-success btn-sm" role="button">취소</a>';
 */		html += '</div>';
		html += '<div id="cNum' + commentNo + '" class="comment"><textarea name="content" id="modComment' + commentNo + '">' + modContent + '</textarea></div>'; 
//	    	html += '<div id="cNum' + commentNo + '" class="comment"><input type="text" name="content" id="modComment' + commentNo + '" value="' + modContent + '"></div>'; 
		html += '</li>';
		
		$("#cN" + commentNo).after(html);
		$("#cN" + commentNo).hide();
	} // 댓글 업데이트 폼
					
	// 댓글 업데이트
	function commentUpdate(commentNo) {
		$.ajax({
		url: "<c:url value='/qnaboard/commentUpdate.json'/>",
		type:"POST",
		data :{
			no:"${list.qna.no}",
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
		url: "<c:url value='/qnaboard/commentRegist.json'/>",
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
			html+='<li id="cN' + i.commentNo + '" class="commentOr"><div class="reHeader"><p class="reWriter">'+i.nickName+'</p>';
			var date = new Date();
			var time = date.getFullYear() + "." 
			         + (date.getMonth() + 1) + "." 
			         + date.getDate() + "."
			         + date.getHours() + ":"
			         + date.getMinutes() + ":"
			         + date.getSeconds();
			html += '<span class="reDay">' + time + '</span>';
			if(i.id == sessionId){
			html += '<div class="coWrap">';
 			html += '<a href="javascript:commentUpdateForm(' + i.commentNo + ')" id="cu' + i.commentNo + '" class="coBtn" role="button">수정</a>';
			html += '<a href="javascript:commentDelete(' + i.commentNo + ')" class="coBtn" role="button">삭제</a>';				
			html += '</div>';
			}
			/* html += '<span class="recomment"><a href="#">답글</a></span></div>';   */
			html += '<div id="cNum' + i.commentNo + '" class="comment">'+i.content+'</div></li>'; 
		}
		if(data.length == 0){
			html += '<div class="nonC comment" >리뷰가 존재하지 않습니다.</div></li>';
		}
		$("ul.reBody").html(html);
	
} 
	function selectComment(){
		$.ajax({
			url: "<c:url value='/qnaboard/commentList.json'/>",
			data:{no:"${list.qna.no}"},
			dataType:"json",
		}).done(function(data){
			commentList(data);
		})
	}
	
	selectComment();
	
	
	$(".detailBody").draggable();
	
	
	</script>
</body>
</html>