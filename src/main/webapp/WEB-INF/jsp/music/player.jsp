<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>
<%-- favicon --%>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon" />

<%-- jquery  --%> 
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%-- 부트스트랩  --%> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/music/player.css">
</head>
<body>
	<div class="wrapBody">
	
	<div class="wrap">
		<div id="result" style="display: none;">
			<span class="final" id="final_span"></span>
			<span class="interim" id="interim_span"></span>
		</div>
	</div>

	<div class="musicBody">
		<!-- <audio src='download.do?path=" + encodeURI(path) + "&fileName="+fileName'> -->
		<!-- <audio id="myMusic" autoplay="autoplay" controls="controls" loop> -->
		<audio id="myMusic" autoplay="autoplay"></audio>
		<div class="musicList">
			<div id="playstation">
				<div id="controlpanel">
					<div id="backward" class="inlineblo">
						<!-- 이전곡 -->
						<i class="fa fa-backward glyphicon glyphicon-backward" id="prevPlay"></i>
					</div>
					<div id="songpro" class="inlineblo"></div>
					<div id="forward" class="inlineblo">
						<!-- 다음곡 -->
						<i class="fa fa-forward glyphicon glyphicon-forward" id="nextPlay"></i>
					</div>
					<h2 id="title"></h2>
				</div>
				<progress max="100" value="100"></progress>
				<%-- 음악리스트 --%>
				<ol class="fList">
				</ol>
			</div>
		</div>
	</div>
	
	</div>

<script src="${pageContext.request.contextPath}/resources/js/folderjs/Speech.js"></script>
<script>
	// 노래 재생 인덱스 관리
	var mPos = 0;
	var mMax;
	var mList = new Array();
	
	window.onload = function () {
		$(".musicBody").draggable();
		console.dir($("#myMusic"))
		$.ajax({
			url: "musicList.json",
			dataType: "json",
			data: {
				id: `${sessionScope.user.id}`
			}
		})
		.done(function (result) {
			var html = '';
			if(result.length == 0){
				$(".fList").html('<li>음악 폴더에 파일이 없습니다.</li>');
				return;
			}
			
			for(let f of result){
				mList.push({"title":f.title, "path":f.path});
				html += '<li>' + f.title.split(".mp3")[0] + '</li>'
			}
			// 첫 로딩시 출력되는 제목
			$("#title").text(result[mPos].title.split(".mp3")[0]);
			
			// 노래 인덱스 관리 (최대갯수)
			mMax = result.length;
			
			$(".fList").html(html);
			$("#myMusic").attr('src',
					'${pageContext.request.contextPath}/main/download.do?path=' + encodeURI(`c:/java-lec/upload/${sessionScope.user.id}_music`) + '&fileName=' + result[mPos].title + '')
			$("#myMusic").attr('autoplay', 'autoplay');
	// 		$("#myMusic")[mPos].onloadstart=function(){$("#myMusic")[mPos].play();};
			
			console.dir($(".fList li"));
			$(".fList li").dblclick(function () {
// 				alert(this.innerHTML);
				$("#myMusic").attr('src',
						'${pageContext.request.contextPath}/main/download.do?path=' + encodeURI(`c:/java-lec/upload/${sessionScope.user.id}_music`) + '&fileName=' + this.innerHTML + '.mp3')
				// 더블클릭시 타이틀 변경되게..						
				$("#title").html(this.innerHTML);		
			})
		})
	}
// 	console.dir($(".musicList"));
// 	$(".musicList").dblclick(function () {
// 		console.dir(this)
// 		for(let f of this.children){
// 			f.innerHTML;
// 		}
// 	})
	
	// 이전곡 재생
	$("#prevPlay").click(function() {
		mPos--;
		nowPlay ();
		
	});
	// 다음곡 재생
	$("#nextPlay").click(function() {
		mPos++;
		nowPlay ();
	});
	
	// 오디오 플레이어
	function nowPlay () {
		if(mPos >= mMax){ mPos = 0; };
		if(mPos <= -1){ mPos = mMax; };
		var mPath = mList[mPos].path;
		var title = mList[mPos].title;

		$("#myMusic")[0].src = '${pageContext.request.contextPath}/main/download.do?path=' + encodeURI(`c:/java-lec/upload/${sessionScope.user.id}_music`) + '&fileName=' + title;
		//$(".album").attr("src", '${pageContext.request.contextPath}'' + imageLink);
		$("#title").html(title.split(".mp3")[0]);
	}; // nowPlay
	
	// 창 종료 함수
	function callMain() {
		opener.parent.location="${pageContext.request.contextPath}/main/main.do";
		self.close();
	} // callMain
</script>
</body>
</html>