<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListBoard</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/list.css">

</head>

<body>
	
	<div class="listBody">
		<%-- 상단 컬러바 --%>
	<div id="card1" class="card ten col">
		<div class="topbar yellow">
		<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
		<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div>
		<h1 class="information">코드공유게시판</h1>
	<div class="list">
                    <table class="boardList table table-hover" style="margin-bottom:0 ">
                        <thead>
                            <tr>
                                <th style="width:10%;font-size:14px;">&nbsp;글번호</th>
                                <th style="width:10%;font-size:14px;">분류</th>
                                <th style="width:35%;font-size:14px;">제목</th>
                                <th style="width:10%;font-size:14px;">작성자</th>
                                <th style="width:15%;font-size:14px;"><a href="#" onclick="pNo(1)" style=" color: #2c3e50; font-weight: 700;">등록일 ▼</a></th>
                                <th style="width:10%;font-size:13px;"><a href="#" onclick="pNo(2)" style=" color: #2c3e50; font-weight: 700;">추천수 ▼</a></th>
                                <th style="width:10%;font-size:13px;"><a href="#" onclick="pNo(3)" style=" color: #2c3e50; font-weight: 700;">조회수 ▼</a></th>
                            </tr>
                        </thead>
                        <tbody id="listTbody">
                        </tbody>
                    </table>
                    <nav style="text-align: center;">
					<ul class="pagination"></ul>
					</nav>
		<div class="searchBox" >
        <form id="list">
        <select id="option" name="searchOption" style="background-color: #fff;">
        	<option value="0">전체</option>
        	<option value="1">이름</option>
        	<option value="2">내용</option>
        	<option value="3">제목</option>
        </select>
        <input name="keyword" id="input" class="searchC">
        <input id="search" class="searchSubmit" type="button" value="조회">
        </form>
		</div>
        <c:if test="${user.id!=null}">
            <button class="btn btn-default btn-group-xs pull-right order" type="button" onclick="location.href='insertForm.do'">글쓰기</button>
        </c:if>
	</div>
	</div>
    </div>
    <script>
    	$(".listBody").draggable();
    	var session = '${sessionScope.user.id}';
    	function pNo(sort) {
    		codeList($("#pNo").val(), sort)
    	}
    </script>
	<script src="${pageContext.request.contextPath}/resources/js/codeboard/codeBoardList.js"></script>
</body>
</html>