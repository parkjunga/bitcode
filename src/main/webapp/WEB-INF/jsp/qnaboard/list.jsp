<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BIT CODE</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/list.css">
</head>
<style>
.information a:hover {font-weight: 700;}
</style>
<body>

	<div class="listBody">
	
	<%-- 상단 컬러바 --%>
	<div id="card1" class="card ten col">
		<div class="topbar blue">
		<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
		<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div>
		<h1 class="information">QnA게시판</h1>
	
	
	<%-- Q&A 게시판 내용 출력 --%>
	<div class="list">
		<table class="boardList table table-hover" style="margin-bottom: 0;">
		<thead>
		<tr>
			<th style="width:10%; font-size: 14px;">&nbsp;글번호</th>
			<th style="width:10%; font-size: 14px;">분류</th>
			<th style="width:35%; font-size: 14px;">제목</th>
			<th style="width:10%; font-size: 14px;">작성자</th>
			<th style="width:15%; font-size: 14px;"><a href="#" onclick="return searchList(1) " style="color: #2c3e50; font-weight: 700;">등록일 ▼</a></th>
			<th style="width:10%; font-size: 13px;"><a href="#" onclick="return searchList(2) " style="color: #2c3e50; font-weight: 700;">추천수 ▼</a></th>
			<th style="width:10%; font-size: 13px;"><a href="#" onclick="return searchList(3) " style="color: #2c3e50; font-weight: 700;">조회수 ▼</a></th>
		</tr>
		</thead>
		<tbody>
		</tbody>
		</table>
		<!-- qnaList -->
		<nav style="text-align: center;">
			<ul class="pagination"></ul>
		</nav>
		<div class="searchBox">
		<form id="list" action='' onsubmit="return searchList()">
			<select name="type">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">글쓴이</option>
				<option value="code">분류</option>
			</select> <input type="text" id="search" class="searchC" name="keyword">
			<!-- <button id="btn" type="submit">검색</button> -->
			<input id="btn" class="searchSubmit" type="submit" value="검색">
		</form>
		</div>
		<!-- searchBox -->
		<c:if test="${sessionScope.user.id!=null}">
		 <button class="btn btn-default btn-group-xs pull-right order" type="button" onclick="location.href='insertForm.do'">글쓰기</button>		 
		</c:if>
	</div>
	<!-- qna -->
	</div>
	<!-- card1 -->
	</div>
	<!-- qnaBody -->
	<script>

	var session = '${sessionScope.user.id}';
	var sort;
	
	window.onload = function(){
 		searchList();
	} 
	
	 //검색 페이징
	  function makePageLink(sort, data) {
		 console.dir(data +"페이징");
		var html = "";
		if (data.count != 0) {
			var clz = "";
			if (data.prev == false) {
				clz = "disabled";
			}
			html += '<li class="' + clz + '">';
			var fn = "";
			if (data.prev == true) {
				console.log(data.beginPage +"개");
				fn = "javascript:searchList("+ sort + ','+ (data.beginPage - 1) + ");";
			}else{
				fn = "#1"
			}
			html += '<a href="' + fn + '" aria-label="Previous">';
			html += '    <span aria-hidden="true">&laquo;</span>';
			html += '</a>';
		    html += '</li>';
			
		    for (var i = data.beginPage; i <= data.endPage; i++) {
		    	if (i == data.pageNo) {
				    html += '<li class="active"><a href="#1">' + i + '</a></li>';
		    	}
		    	else {
		    		html += '<li><a href="javascript:searchList(' + sort + ',' + i + ');">' + i + '</a></li>';
		    	}
		    }
			clz = "";
			if (data.next == false) {
				clz = "disabled";
			}
			html += '<li class="' + clz + '">';
			fn = "";
			if (data.next == true) {
				fn = "javascript:searchList(" + sort + ','+ (data.endPage + 1) + ");";
			}else{
				fn = "#1";
			}
			html += '<a href="' + fn + '" aria-label="Next">';
			html += '    <span aria-hidden="true">&raquo;</span>';
			html += '</a>';
		    html += '</li>';
		}
		$("nav > ul.pagination").html(html);
	}
	
	// 검색 
	 
	// 검색 
	function searchList(sort, pageNo){
		if(!sort) sort = 0;
		if(!pageNo) pageNo = 1;
		
		$.ajax({
			//type:'POST',
			url:"/bitcode/qnaboard/list.json",
			data:{type: $("select[name='type']").val(), 
				  keyword: $("input[name='keyword']").val(),
				  pageNo: pageNo,
				  sort:sort 
				  },
			dataType: "json"
		})
		.done(function (data){
			makeList(sort,data);
			makePageLink(sort, data.pageResult)
		});
		return false;
		
	}
	
	// Q&A 리스트 출력
	function makeList(sort,data){
		var html="";
		$(".table tbody").html("");
		if(data.list == ""){
			html+= '<tr>';
			html+= '<td colspan="7">게시글이 존재하지않습니다.</td>';
			html+= '</tr>';
		}else{
			for(let qna of data.list){
			console.log(data.list.length);
			if(qna.groupOrder == 0){
				html+= '<tr>';
				html+= '<td>'+qna.no+'</td>';
				html+= '<td>'+qna.codeName+'</td>';
				if( session != ""){
				html+= '<td style="text-align:left;"><a href="detail.do?no='+qna.no+'">'+qna.title+'</a></td>';					
				}else{
				html+= '<td style="text-align:left;">'+qna.title+'</td>';										
				}
				html+= '<td>'+qna.nickName+'</td>';
				var date = new Date(qna.regDate);
				var time = date.getFullYear() + "-" 
				         + (date.getMonth() + 1) + "-" 
				         + date.getDate();
				         /* + date.getHours() + ":"
				         + date.getMinutes() + ":"
				         + date.getSeconds(); */
				html+= '<td>' + time + '</td>'; 
				html+= '<td>'+qna.likeCnt+'</td>';
                html+= '<td>'+qna.viewCnt+'</td>'; 
				html+= '</tr>'	
			}else{
				html+= '<tr>';
				html+= '<td></td>';
				html+= '<td>'+qna.codeName+'</td>';
				html+= '<td style="text-align:left;">';					
				if(session != ""){
					for(var i = 1; i < qna.depth; i++){
						html+= '<span>&nbsp;&nbsp;&nbsp;</span> ';					
					}
						html+= '<span style="color:#2c3e50;">⤷  </span>';
						html+= '<a href="detail.do?no='+qna.no+'">'+qna.title+'</a></td>';
				}else{
					for(var i = 1; i < qna.depth; i++){
						html+= '<span>&nbsp;&nbsp;&nbsp;</span> ';					
						}
						html+= '<span style="color:#000">⤷ RE </span>'+qna.title+'</td>';
				}
				html+= '<td>'+qna.nickName+'</td>';
				var date = new Date(qna.regDate);
				var time = date.getFullYear() + "-" 
				         + (date.getMonth() + 1) + "-" 
				         + date.getDate();
				        /*  + date.getHours() + ":"
				         + date.getMinutes() + ":"
				         + date.getSeconds(); */
				html+= '<td>' + time + '</td>'; 
				html+= '<td>'+qna.likeCnt+'</td>';
                html+= '<td>'+qna.viewCnt+'</td>'; 
				html+= '</tr>'	
			}
 		}	
			
		}
		$(".table tbody").html(html);
	}	
	
	//searchList();
		
	// 글쓰기버튼 로그인 확인
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
	})
	
	$(".listBody").draggable();

	</script>

</body>

</html>