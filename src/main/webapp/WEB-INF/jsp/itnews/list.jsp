<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/itnews/itnews.css" />
</head>
<body><br>
<span id="h1ITNews">IT News BIT CODE</span>
<span id="adminIT">
<c:if test="${sessionScope.user.auth == 'S'}">
<a href="${pageContext.request.contextPath}/crawling.do" class="crawlingBtn">
<img src="${pageContext.request.contextPath}/resources/images/crawinfNews.png"></a>
</c:if>
</span>

<section class="cards-wrapper">
<%-- 	<c:forEach var="newList" items="${newList}"> --%>
<!-- 	  <div class="card-grid-space"> -->
<%-- 	    <a class="cardITNews" href="${pageContext.request.contextPath}/itnews/itnewsDetail.do?articleNo=${newList.articleNo}" style="--bg-img: url(https://images1-focus-opensocial.googleusercontent.com/gadgets/proxy?container=focus&resize_w=1500&url=https://codetheweb.blog/assets/img/posts/html-syntax/cover.jpg)"> --%>
<%-- 	      <div><h3>IT News</h3><p>${newList.articleReporter}</p><p>${newList.articleTitle}</p></div> --%>
<!-- 	    </a> -->
<!-- 	  </div> -->
<%--   </c:forEach> --%>
</section>

<nav style="text-align: center;">
	<ul class="pagination"></ul>
</nav>  
<script>
window.onload = function(){
		pageList();
		$("body").waitMe({
			effect: "ios",
			text: "Loding.. :D",
			bg: 'rgba(255,255,255, 0.7)',
			color: '#000'
			
		});
} 
// 페이징 처리 
function makePageLink(data) {
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
			fn = "javascript:pageList(" + (data.beginPage - 1) + ");";
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
	    		html += '<li><a href="javascript:pageList(' + i + ');">' + i + '</a></li>';
	    	}
	    }
		clz = "";
		if (data.next == false) {
			clz = "disabled";
		}
		html += '<li class="' + clz + '">';
		fn = "";
		if (data.next == true) {
			fn = "javascript:pageList(" + (data.endPage + 1) + ");";
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
// 리스트 출력
function pageList(pageNo){
	if (pageNo === undefined) {
		pageNo = 1;
	}
	$.ajax({
		url: "/bitcode/itnews/list.json",
		data: {pageNo: pageNo},
		dataType: "json"
	})
	.done(function (data){
// 		console.log(data);
		makeList(data)
		makePageLink(data.PageResultITNews)
		$("body").waitMe("hide");

	});
	return false;
}
// ITNew 리스트 출력
function makeList(data){
	var html="";
	$(".cards-wrapper").html("");
	for (let i = 0; i < data.list.length; i++) {
		var news = data.list[i];
		console.log(news);
			html+='<div class="card-grid-space">';
			html+='	<a class="cardITNews" href="${pageContext.request.contextPath}/itnews/itnewsDetail.do?articleNo='+news.articleNo+'" style="--bg-img: url(https://images1-focus-opensocial.googleusercontent.com/gadgets/proxy?container=focus&resize_w=1500&url=https://codetheweb.blog/assets/img/posts/html-syntax/cover.jpg)">';
			html+='		<div><h3>IT News</h3><p>'+news.articleReporter+'</p><p>'+news.articleTitle+'</p></div>';
			html+='	</a>';
			html+='</div>';
		}	
	$(".cards-wrapper").html(html);
}


</script>  
</body>
</html>