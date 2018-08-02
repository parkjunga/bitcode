<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main/main.css">
<script src="//static.codepen.io/assets/editor/live/console_runner-ce3034e6bde3912cc25f83cccb7caa2b0f976196f2f2d52303a462c826d54a73.js"></script>
<script src="//static.codepen.io/assets/editor/live/css_live_reload_init-890dc39bb89183d4642d58b1ae5376a0193342f9aed88ea04330dc14c8d52f55.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta name="robots" content="noindex">
<link rel="canonical" href="https://codepen.io/MohamedElGhandour/pen/GEbwEW">

<link rel="stylesheet prefetch"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet prefetch"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/fancytree/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/fancytree/jquery.fancytree.js"></script>
<script
	src="//cdn.jsdelivr.net/npm/jquery-contextmenu@2.6.4/dist/jquery.contextMenu.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/jquery-contextmenu@2.6.4/dist/jquery.contextMenu.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fancytree/ui.fancytree.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/mainMIC.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/folder.css">
<script src="${pageContext.request.contextPath}/resources/js/folderjs/folder.js"></script>

<!-- 음성 -->
<script src="${pageContext.request.contextPath}/resources/js/folderjs/Speech.js"></script>
<style>
.ellipsis {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	display: block;
}
</style>
<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp93914891');
</script>
</head>
<body>
	<c:if test="${empty sessionScope.user}">
		<div class="wrapp">
			<div class="text">
				<span class="mainText">BIT CODE</span>
			</div>
			<div class="logo">
				<span class="top-left"></span> <span class="bottom-right"></span>
			</div>
		</div>
	</c:if>
<!-- 	<div class="wrap"> -->
<!-- 	    <div id="result" style="display: none;"> -->
<!-- 	      <span class="final" id="final_span"></span> -->
<!-- 	      <span class="interim" id="interim_span"></span> -->
<!-- 	    </div> -->
<!-- 	</div> -->
	<input type="hidden" id="sId" value="${sessionScope.user.id}" />
	<div id="window" class="windows" style="height: 734px;">
		<c:if test="${!empty sessionScope.user }">
			<div class="icon-computer text-center" id="icon-computer"
				ondblclick="folderOpen()">
				<img
					src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg"
					class="img-responsive" style="margin: auto;">
				<p>사용자 폴더</p>
			</div>
			<div class="icon-computer text-center" id="icon-computer-music"
				ondblclick="musicOpen()">
				<img
					src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg"
					class="img-responsive" style="margin: auto;">
				<p>음악 폴더</p>
			</div>
		</c:if>
		<div class="overlay-computer" id="overlay-computer"
			style="transform: scale(0); left: 142px; top: 29px; z-index: 1000; height: 680px; ">
			<div class="fluid-container">
				<div class="first-row-win" id="first-row-win">
					<div class="left">
						<i class="fa fa-folder"></i>
						<span>${sessionScope.user.nickName}님의 Folder</span>
					</div>
					<!-- 닫기, 최소화, 최대화 -->
					<div class="right">
						<i class="fa fa-window-minimize" onclick="closeopencom()"></i> <i
							class="fa fa-window-restore" onclick="returncom()" id="returncam"
							style="display: none;"></i> <i class="fa fa-window-maximize"
							onclick="upercom()" id="upercam"></i>
							<i class="fa fa-times" id='closeMIC' onclick="closecom()"></i>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="second-row-win">
					<div>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a class="home-a"
								href="#home" aria-controls="home" role="tab" data-toggle="tab">File</a></li>
<!-- 							<li role="presentation"><a href="#profile" -->
<!-- 								aria-controls="profile" role="tab" data-toggle="tab">Home</a></li> -->
<!-- 							<li role="presentation"><a href="#messages" -->
<!-- 								aria-controls="messages" role="tab" data-toggle="tab">Share</a></li> -->
<!-- 							<li role="presentation"><a href="#settings" -->
<!-- 								aria-controls="settings" role="tab" data-toggle="tab">View</a></li> -->
						</ul>
					</div>
				</div>
				<div class="third-row-win">
					<!-- 뒤로가기 앞으로가기 화살표  -->
					<div class="col-xs-2">
						<i class="fa fa-long-arrow-left" id="forward"></i>
						<i class="glyphicon glyphicon-home" id="hoomroot"></i>
					</div>
					<div class="col-xs-7">
						<!-- 폴더 경로 -->
						<div class="path-input" id="share-path">
							<span class="path-icon-input">${sessionScope.user.id}</span>
<!-- 							<span class="path-icon-input">aaaa/test/test1</span> -->
							<!-- <span class="path-icon-input">programming</span> -->
							<!-- <span class="path-icon-input">Front End</span> -->
						</div>
						<!-- 폴더 경로 부분 아이콘 새로고침 -->
						<i class="fa fa-hdd-o path-icon"></i>
						<span class="fa fa-repeat path-icon-1"></span>
						<i class="path-icon-2">|</i>
					</div>
					<div class="col-xs-3">
<!-- 						<input class="search-input" type="text" placeholder="Search"> -->
<!-- 						<span id="sasa" class="fa fa-search path-icon-1"></span> -->
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="fourd-row-win">
					<div class="col-xs-3" style="border-right: 1px solid #808080;">
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="">
									<!-- 왼쪽 영역  -->
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseThree"
											aria-expanded="false" aria-controls="collapseThree"> <span
											class="fa fa-desktop">This PC</span>
										</a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingThree">
								</div>
							</div>
						</div>
						<div id="tree" style="overflow-x: auto;"></div>
						<!-- 저장 용량 -->
						<div class="saveSize" style="position: fixed; bottom: 20px; width: 154px;" >
							<span>저장용량</span><img src="${pageContext.request.contextPath}/resources/images/cloud.PNG" style="width: 40px; margin-left: 8px;"><br>
							<div class="progress" style="height: 5px;">
								<div class="progress-bar progress-bar-info" id='ppbar' role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
								</div>
							</div>
							<span id='maxSize'>100MB 중 </span><span id='capacity'></span><span><a href="#" onclick="payment()">결제</a></span>
						</div>
					</div> 
					<div class="col-xs-9 ">
						<div class="row main-folders" id="folder-area" style="height: 380px;">
							<!-- 폴더 ajax 추가 -->
							<!-- 공유 폴더 -->
<!-- 							<div class="col-xs-2 folders text-center" id="99999" data-path="" data-title="shareFolder" ondblclick='test(9999)'> -->
<!-- 								<p class="contain"> -->
<!-- 									<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" -->
<!-- 										class="img-responsive  center-block" style="height: 64px;" -->
<!-- 										alt=""> -->
<!-- 								</p> -->
<!-- 								<span class="ellipsis">Share Folder</span> -->
<!-- 							</div> -->
<!-- 							<div class="col-xs-2 folders text-center"> -->
<!-- 								<p class="contain"> -->
<!-- 									<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500505134/if_sticky-note_299111_px7waa.png" -->
<!-- 										class="img-responsive  center-block" style="height: 64px;" > -->
<!-- 								</p> -->
<!-- 								<span class="ellipsis">Folder</span> -->
<!-- 							</div> -->
<!-- 							<div class="col-xs-2 folders text-center"> -->
<!-- 								<p class="contain"> -->
<!-- 									<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-powerpoint-2013.png" -->
<!-- 										class="img-responsive  center-block" style="height: 64px;" > -->
<!-- 								</p> -->
<!-- 								<span class="ellipsis">pptx</span> -->
<!-- 							</div> -->
<!-- 							<div class="col-xs-2 folders text-center"> -->
<!-- 								<p class="contain"> -->
<!-- 									<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-excel-20132.png" -->
<!-- 										class="img-responsive  center-block" style="height: 64px;" > -->
<!-- 								</p> -->
<!-- 								<span class="ellipsis">exel</span> -->
<!-- 							</div> -->
<!-- 							<div class="col-xs-2 folders text-center"> -->
<!-- 								<p class="contain"> -->
<!-- 									<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-word-20132.png" -->
<!-- 										class="img-responsive  center-block" style="height: 64px;" > -->
<!-- 								</p> -->
<!-- 								<span class="ellipsis">word</span> -->
<!-- 							</div> -->
							<!--                         <div class="clearfix"></div> -->
						</div>
					</div>
				</div>
				<div class="fived-row-win"></div>
			</div>
			<div class="resizer"></div>
		</div>
		<div class="clearfix"></div>




		<footer
			class="nav navbar-inverse navbar-fixed-bottom footer text-center"
			style="display: none;">
			<div class="fluid-container">
				<div class="row">
					<div class="left">
						<div class="col-xs-1-me" id="a1" style="display: none;">
							<div class="icon-bottom">
								<i class="fa fa-folder fa-2x"></i>
							</div>
						</div>
						<span class=".clearfix"></span>
					</div>
				</div>
			</div>
		</footer>
	</div>
	
	<script>
	// fancyTree
	$(function() {
		$.contextMenu({
			selector: "#folder-area div, #folder-area",
			items: {
				"add": {name: "AddFolder", icon: "add" },
				"delete": {name: "Delete", icon: "delete" }
			},
			callback: function (itemKey, opt) {
				var node = $.ui.fancytree.getNode(opt.$trigger);
				var selPath = $("#share-path").data("root");
				var fileName = '';
				var deleteFileName = this[0].dataset.title;
				console.log(opt);
				console.dir(this[0].dataset.title);
				console.dir(typeof(this[0].dataset));
// 				alert("select " + itemKey + " on " + opt);
				// 마우스 우클릭 > 폴더 생성 선택
				if(itemKey == 'add'){
					swal.mixin({
							input: 'text',
							confirmButtonText: 'confirm',
							showCancelButton: true,
							progressSteps: ['1']
						}).queue([
							{
								title: '폴더 생성',
								text: '폴더명을 입력하세요'
							}
						]).then((result) => {
							console.dir(result)
							if (result.value != '') {
								fileName = result.value[0]
							}else{
								fileName = '새 폴더';
							}
							$.ajax({
								url: "contextFolder.json",
								data: {
									path: selPath,
									name: fileName,
									id: $("#sId").val()
								},
								dataType: "json",
								type: "POST"
							})
							.done(function (result) {
								swal({
									title: 'Success',
									confirmButtonText: 'Success!'
								})
								$('#tree').fancytree('option', 'source', result.fancyList);
								Refresh(result.path);
							})
						})
				}
				if(itemKey == 'delete'){
					console.dir(node);
					$.ajax({
						url: "delete.json",
						dataType: "json",
						type: "POST",
						data: {
							path: selPath,
							name: deleteFileName,
							id: $("#sId").val()
						}
					})
					.done(function (result) {
						console.dir(result);
						$('#tree').fancytree('option', 'source', result.fancyList);
						Refresh(result.path);
						swal('warning', '파일 삭제', 'question');
					})
				}
			}
		});
		
		// fancyTree ContextMenu
//         $.contextMenu({
//           selector: "#tree span.fancytree-title",
//           items: {
//             "cut": {name: "Cut", icon: "cut",
//                 callback: function(key, opt){
//                   var node = $.ui.fancytree.getNode(opt.$trigger);
//                   // alert("Clicked on " + key + " on " + node);
//                 }
//               },
//             "copy": {name: "Copy", icon: "copy"},
//             "paste": {name: "Paste", icon: "paste", disabled: false },
//             "sep1": "----",
//             "edit": {name: "Edit", icon: "edit", disabled: false },
//             "delete": {name: "Delete", icon: "delete", disabled: true },
//             "more": {name: "More", items: {
//               "sub1": {name: "Sub 1"},
//               "sub1": {name: "Sub 2"}
//               }}
//             },
//           callback: function(itemKey, opt) {
//            var node = $.ui.fancytree.getNode(opt.$trigger);
//            console.dir(node)
//             alert("select " + itemKey + " on " + node);
//           }
//         });
    });
	
	//Setup the dnd listeners.
	var dropZone = document.getElementById('overlay-computer');
	dropZone.addEventListener('dragover', handleDragOver, false);
	dropZone.addEventListener('drop', handleFileSelect, false);
	
	var rootFolderName = '';
	var fDiv = $("#folder-area");
	var fileList;
	var id;
	var maxSize = 100;
	function folderOpen(){
		opencom();
		$("#folder-area").html('');
		if($("#sId").val() == ''){
			swal({
				position: 'center',
				type: 'error',
				title: '로그인 후 이용 가능합니다.',
				showConfirmButton: false,
				timer: 1500
			});
		}
		$.ajax({
			url: "selectFolder.json",
			data: {id: $("#sId").val()},
			dataType: "json",
			type: "POST"
		})
		.done(function (data) {
			console.log(data.size)
			var size = Number(data.size);
			$("#maxSize").html(maxSize + 'MB 중')
			size = (size / 1024) / 1024;
			var progress = (size.toFixed(0) / 100) * 100;
			$("#ppbar").css("width", progress+"%")
			size = size.toFixed(2) + 'MB 사용';
			console.log("size :" + size)
			$("#capacity").html(size)
			console.dir(data.list)
			fileList = data.list;
			id = Number(data.list.length);
// 			console.log(data);
			for(var f of data.list){
				var appendFile = '';
				if(f.folder){
// 					console.log("폴더")
					appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.path+'" data-title="'+f.title+'" ondblclick="test('+f.key+')">';
					appendFile += '<p class="contain">';
					appendFile += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg"';
					appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
					appendFile += '		alt="">';
// 					appendFile += '	<img src="download.do?filePath='+f.parentPath+'&systemFileName=attach&originalFileName='+f.title+'" style="height: 64px;">';
					appendFile += '	</p>';
					appendFile += '	<span class="ellipsis">' + f.title + '</span>';
					appendFile += '</div>';
					$("#folder-area").append(appendFile);
				}else{
					console.dir(f)
					appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.path+'" data-title="'+f.title+'" ondblclick="test1('+f.key+')">';
					appendFile += '<p class="contain">';
					if(f.type == 'img'){
						appendFile += '	<img src=download.do?path='+encodeURI(f.path)+'&fileName='+f.title;
// 						appendFile += `	<img src="${pageContext.request.contextPath}/resources/images/imageicon.png"`;
					}else if(f.title.split('.')[1] == 'mp3') {
						appendFile += `	<img src="${pageContext.request.contextPath}/resources/images/mp3image.png"`;
					}else if(f.title.split('.')[1] == 'xlsx') {
						appendFile += `	<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-excel-20132.png"`;
					}else if(f.title.split('.')[1] == 'pdf') {
						appendFile += `	<img src="${pageContext.request.contextPath}/resources/images/pdfimage.png"`;
					}else if(f.title.split('.')[1] == 'pptx') {
						appendFile += `	<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-powerpoint-2013.png"`;
					}else{
						appendFile += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500505134/if_sticky-note_299111_px7waa.png"';
					}
					appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
					appendFile += '		alt="">';
// 					appendFile += '	<img src="download.do?filePath='+f.parentPath+'&systemFileName=attach&originalFileName='+f.title+'" style="height: 64px;">';
					appendFile += '	</p>';
					appendFile += '	<span class="ellipsis">' + f.title + '</span>';
					appendFile += '</div>';
					$("#folder-area").append(appendFile);
				}
			}
			loadFancytree(data.list);
			$('#tree').fancytree('option', 'source', data.list);
			$("#share-path").data("root","c:/java-lec/upload/"+$("#sId").val());
		})
	}
	
	//새로고침
	function Refresh(path){
		$.ajax({
			url: "enterDirectory.json",
			data: {
				path: path,
				key: 1
			},
			dataType: "json"
		})
		.done(function (data) {
			fileList = data
			$("#folder-area").html('');
			if(data.length == 0){
				return;
			}
			for(var f of data){
				var appendFile = '';
				if(f.folder){
					appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.path+'" data-title="'+f.title+'" ondblclick="test('+f.key+')">';
					appendFile += '<p class="contain">';
					appendFile += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg"';
					appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
					appendFile += '		alt="">';
					appendFile += '	</p>';
					appendFile += '	<span class="ellipsis">' + f.title + '</span>';
					appendFile += '</div>';
					$("#folder-area").append(appendFile);
				}else{
					appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.path+'" data-title="'+f.title+'" ondblclick="test1('+f.key+')">';
					appendFile += '<p class="contain">';
					if(f.type == 'img'){
						appendFile += '	<img src=download.do?path='+encodeURI(f.path)+'&fileName='+f.title;
// 						appendFile += `	<img src="${pageContext.request.contextPath}/resources/images/imageicon.png"`;
					}else if(f.title.split('.')[1] == 'mp3') {
						appendFile += `	<img src="${pageContext.request.contextPath}/resources/images/mp3image.png"`;
					}else if(f.title.split('.')[1] == 'xlsx') {
						appendFile += `	<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-excel-20132.png"`;
					}else if(f.title.split('.')[1] == 'pdf') {
						appendFile += `	<img src="${pageContext.request.contextPath}/resources/images/pdfimage.png"`;
					}else if(f.title.split('.')[1] == 'pptx') {
						appendFile += `	<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-powerpoint-2013.png"`;
					}else{
						appendFile += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500505134/if_sticky-note_299111_px7waa.png"';
					}
					appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
					appendFile += '		alt="">';
					appendFile += '	</p>';
					appendFile += '	<span class="ellipsis">' + f.title + '</span>';
					appendFile += '</div>';
					$("#folder-area").append(appendFile);
				}
			}
		})
	}
	
	
	
	// file 더블클릭 -> 다운
	function test1 (key) {
// 		alert("더블 클릭 파일");
		var fileName = $("#"+key).data("title");
		console.log(fileName)
		var path = $("#share-path").data("root");
		location.href = "download.do?path="+encodeURI(path)+"&fileName="+fileName;
	}
	
	var backPath = '';
	var backTitle = '';
	
	function loadFancytree(data) {
		$("#tree").fancytree({
			extensions: [],
			autoScroll: true,
			source: data,
			click: function(event, data) {
				var node = data.node,
					targetType = data.targetType;
				if(node.folder){
					console.log("폴더 선택");
					console.log(node);
					backPath = node.data.path;
					backTitle = node.title;
// 					node.setExpanded(true); // 폴더 확장
					fancyTreeClick(node)
				}
			},
			lazyLoad: function (e, data) {
				console.dir(data);
			    var dfd = new $.Deferred();
			    data.result = dfd.promise();
		        $.ajax({
					url: "lazyLoad.json",
					data: {
						path: data.node.data.path,
						key: data.node.key,
						name: data.node.title
					},
					dataType: "json"
				})
				.done(function (result){
					dfd.resolve(result);
				});
			}
		});
	}
	// fancyTree 폴더 선택
	function fancyTreeClick(node){
		var path = node.data.path + '\\' + node.title;
		var selectInfo = {
				parentPath: path,
				title: node.title
		}
		$.ajax({
			url: "enterDirectory.json",
			data: {
				path: path,
				key: node.key
			},
			dataType: "json"
		})
		.done(function (result) {
			console.dir(result)
			reload(result, selectInfo)
		})
	}
	
	
	
	// folder 더블클릭 -> enter 후 리스트 노출
	function test(key) {
// 		console.log(key)
		var $div = $("#"+key);
// 		$div.data("parent", "path");
		console.log("아이디 찾기 : " + $div.data("title"));
// 		console.log($div.data("parent"));
		var parentPath = $div.data("path")+'\\'+$div.data("title");
		console.log("경로 : " + parentPath);
		var selectInfo = {
				parentPath: parentPath,
				title: $div.data("title")
		}
		$.ajax({
			url: "enterDirectory.json",
			data: {
				path: parentPath,
				key: key
			},
			dataType: "json"
		})
		.done(function (result) {
			console.log(result)
			reload(result, selectInfo)
			console.log($div.data("path"));
			backPath = $div.data("path");
			backTitle = $div.data("title")
			console.log($div.data("title"));
		})
	}
	
	function reload(data, selectInfo){
		console.dir(selectInfo)
		fileList = data
		console.dir(fileList)
		
		$("#share-path").data("root", selectInfo.parentPath)
//		alert($("#share-path").data("root"))
		var r = $("#share-path").data("root").split($("#sId").val()+'\\')[1].split('\\');
		$("#share-path").html('');
		$("#share-path").append("<span class='path-icon-input'>"+$("#sId").val()+"</span>");
		for(let path of r){
			$("#share-path").append("<span class='path-icon-input'>"+path+"</span>");
		}
		$("#folder-area").html('');
		if(data.length == 0){
// 			$("#share-path").data("root", selectInfo.parentPath)
// // 			alert($("#share-path").data("root"))
// 			$("#share-path").append("<span class='path-icon-input'>"+selectInfo.title+"</span>")
			return;
		}
		for(var f of data){
			var appendFile = '';
			if(f.folder){
				console.log("폴더")
				appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.path+'" data-title="'+f.title+'" ondblclick="test('+f.key+')">';
				appendFile += '<p class="contain">';
				appendFile += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg"';
				appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
				appendFile += '		alt="">';
				appendFile += '	</p>';
				appendFile += '	<span class="ellipsis">' + f.title + '</span>';
				appendFile += '</div>';
				$("#folder-area").append(appendFile);
			}else{
				appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.path+'" data-title="'+f.title+'" ondblclick="test1('+f.key+')">';
				appendFile += '<p class="contain">';
				if(f.type == 'img'){
					appendFile += '	<img src=download.do?path='+encodeURI(f.path)+'&fileName='+f.title;
// 					appendFile += `	<img src="${pageContext.request.contextPath}/resources/images/imageicon.png"`;
				}else if(f.title.split('.') == 'mp3') {
					appendFile += `	<img src="${pageContext.request.contextPath}/resources/images/mp3image.png"`;
				}else if(f.title.split('.')[1] == 'xlsx') {
					appendFile += `	<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-excel-20132.png"`;
				}else if(f.title.split('.')[1] == 'pdf') {
					appendFile += `	<img src="${pageContext.request.contextPath}/resources/images/pdfimage.png"`;
				}else if(f.title.split('.')[1] == 'pptx') {
					appendFile += `	<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-powerpoint-2013.png"`;
				}else if(f.title.split('.')[1] == 'ppt') {
					appendFile += `	<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-powerpoint-2013.png"`;
				}else{
					appendFile += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500505134/if_sticky-note_299111_px7waa.png"';
				}
				appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
				appendFile += '		alt="">';
				appendFile += '	</p>';
				appendFile += '	<span class="ellipsis">' + f.title + '</span>';
				appendFile += '</div>';
				$("#folder-area").append(appendFile);
			}
		}
// 		$("#share-path").data("root", selectInfo.parentPath)
// 		alert($("#share-path").data("root"))
// 		$("#share-path").append("<span class='path-icon-input'>"+selectInfo.title+"</span>");
	}
	
	function error(e) {
		console.log('error');
		console.log(e);
	}
	
	function error_from_readentries(e) {
	    console.log('error_from_readentries');
	    console.log(e);
	}
	
	function traverseFileTree(item, path) {
		path = path || "";
		console.dir(item)
		console.log($("#share-path").data("root"));
		if (item.isFile) {
			// Get file
			item.file(function(file) {
				var html = '';
				if(path == ''){
					if($("#share-path").data("root") == 'c:/java-lec/upload/'+$("#sId").val()+'_music' && file.type.split('/')[0] != 'audio'){
						swal(	'warning',
								'음악 파일만 업로드 가능합니다.',
								'question');
						return;
					}
					console.log("파일만 올림")
					console.log("File: " + file.name);
					console.log("path: " + path);
					console.log("확장자: " + file.type.split('/')[1]);
					console.dir(file);
					html += '<div class="col-xs-2 folders text-center" id="'+ ++id +'" data-path="'+$("#share-path").data("root")+'" data-title="'+file.name+'" ondblclick="test1()">';
					html += '	<p class="contain">';
					if(file.type.split('/')[0] == 'image'){
						html += "	<img src='" + URL.createObjectURL(file) + "'"; // file 객체를 이용하여 데이터 활용
// 						html += `	<img src="${pageContext.request.contextPath}/resources/images/imageicon.png"`;
					}else if(file.type.split('/')[0] == 'audio'){
						html += `	<img src="${pageContext.request.contextPath}/resources/images/mp3image.png"`;
					}else if(file.name.split('.')[1] == 'xlsx') {
						html += `	<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-excel-20132.png"`;
					}else if(file.name.split('.')[1] == 'pdf') {
						html += `	<img src="${pageContext.request.contextPath}/resources/images/pdfimage.png"`;
					}else if(file.name.split('.')[1] == 'pptx') {
						html += `	<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-powerpoint-2013.png"`;
					}else{
						html += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500505134/if_sticky-note_299111_px7waa.png"';
					}
					html += 'class="img-responsive  center-block" style="height: 64px;" alt="">';
					html += '	</p>';
					html += '	<span class="ellipsis">'+file.name+'</span>';
					html += '</div>';
					if(file.type.split('/')[0] == 'audio' && $("#share-path").data("root") != ('c:/java-lec/upload/'+$("#sId").val()+'_music') ){
// 						$("#share-path").data("root", 'c:/java-lec/upload/'+$("#sId").val()+'_music');
// 						sendFile(file);
						swal(	'warning',
								'음악 폴더에 업로드 합니다.',
								'question');
						return;
					}
					fDiv.append(html);
					sendFile(file);
				}else{
					// 폴더 형태에 파일이 온경우
// 					console.log("File: " + file.name);
// 					console.log("path: " + path);
// 					console.dir("폴더에 파일객체: " + file);
// 					html += '<div class="col-xs-2 folders text-center">';
// 					html += '	<p class="contain"><img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive  center-block" style="height: 64px;" alt=""></p>';
// 					html += '	<span class="ellipsis">Folder</span>';
// 					html += '</div>';
// 					fDiv.append(html);
					console.log("디렉토리 path : " + path)
					sendFile(file, path);
				}
			}, error);
		} else if (item.isDirectory) {
			console.log("최상위 폴더 이름 : " + item.fullPath.split('/')[1])
			console.dir(item)
			rootFolderName = item.fullPath.split('/')[1];
			// Get folder contents
			var dirReader = item.createReader();
			dirReader.readEntries(function(entries) {
				console.dir(entries)
				if(entries.length == 0){
					console.log('빈폴더')
					console.dir(item)
					createFolder(item);
				}else{
					console.log("빈폴더 아님")
					for (var i=0; i<entries.length; i++) {
						console.dir(entries[i])
						traverseFileTree(entries[i], path + item.name + "/")
					}
				}
			}, error_from_readentries); 
		}
	}
	
	
	// 파일 업로드 후 fancyTree 갱신
	function sendFile(file, path) {
		console.log("넘어온 path : ");
		console.log(path);
		console.log("넘어온 file : ");
		console.log(file);
		console.log(file.type.split('/')[0]);
		console.log("sendfile root : ");
		console.log($("#share-path").data("root"));
		if(path){
			path = $("#share-path").data("root") + '\\' + path;
		}else if(file.type.split('/')[0] == 'audio'){
			path = "c:\\java-lec\\upload\\" + $("#sId").val() + "_music";
		}else{
			path = $("#share-path").data("root");
		}
		console.log("send path : ");
		console.log(path);
		var fd = new FormData();
		fd.append("attach", file);
		fd.append("id", $("#sId").val());
		fd.append("path", path);
		$.ajax({
			url: "upload.json",
			data: fd,
			type: "POST",
			contentType: false,
			processData: false
		})
		.done(function (result) {
			console.log("업로드 후 result : ")
			console.dir(result)
			var size = Number(result.size);
			$("#maxSize").html(maxSize + 'MB 중')
			size = (size / 1024) / 1024;
			console.log("size :" + size)
			var progress = (size.toFixed(0) / 100) * 100;
			console.log("progress:" + progress)
			$("#ppbar").css("width", "0%")
			$("#ppbar").css("width", progress+"%")
			size = size.toFixed(2) + 'MB 사용';
			$("#capacity").html(size);
// 			console.dir(result)
// 			console.dir(file)
// 			폴더 새로고침
			$('#tree').fancytree('option', 'source', result.list);
		})
	}
	
	function createFolder(item){
		console.dir(item)
		$.ajax({
			url: "createFolder.json",
			data: {
				path: item.fullPath,
				id: $("#sId").val()
			},
			dataType: "json"
		})
		.done(function (result) {
			$('#tree').fancytree('option', 'source', result);
		})
	}
	
	function handleFileSelect(evt) {
		console.log("언제들어오나")
		evt.stopPropagation();
		evt.preventDefault();
		var items = evt.dataTransfer.items;
		console.dir(items[0].webkitGetAsEntry());
		console.dir(fileList);
		for(let checkFile of fileList){
			if(checkFile.title == items[0].webkitGetAsEntry().name){
				swal(	'warning',
						'이 위치에 이름이 같은 파일이 존재합니다.',
						'question');
				return;
			}
		}
		if(items[0].webkitGetAsEntry().isDirectory){
			createFolder(items[0].webkitGetAsEntry());
			var html = '';
			html += '<div class="col-xs-2 folders text-center" id="'+ ++id +'" data-path="'+$("#share-path").data("root")+'" data-title="'+items[0].webkitGetAsEntry().name+'" ondblclick="test('+id+')">';
			html += '	<p class="contain"><img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive  center-block" style="height: 64px;" alt=""></p>';
			html += '	<span>'+items[0].webkitGetAsEntry().name+'</span>';
			html += '</div>';
			fDiv.append(html);
	    }
	    for (var i = 0; i < items.length; i++) {
	        var item = items[i].webkitGetAsEntry();
	        if (item) { traverseFileTree(item); }
	    }
	}
	
	function handleDragOver(evt) {
	    evt.stopPropagation();
	    evt.preventDefault();
	    evt.dataTransfer.dropEffect = 'copy';
	}
	
	// 뒤로가기 기능
	$("#forward").click(function () {
		console.log($("#share-path").data("root"))
		if($("#share-path").data("root").split($("#sId").val())[1] == ''){
			return;
		}else{
// 			alert('루트 존재');
			console.log(backPath)
// 			var path = {parentPath: backPath}
// 			$.ajax({
// 				url: "enterDirectory.json",
// 				data: {
// 					parentPath: backPath,
// 					key: 1
// 				},
// 				dataType: "json"
// 			})
// 			.done(function (result) {
// 				console.dir(result)
// 				reload(result, path)
// 			})
		}
	})
	
// 	//용량 체크
// 	function cloudSize() {
		
// 	}
	
	// 홈으로 이동
	$("#hoomroot").click(function () {
		if($("#share-path").data("root")){
			
		} 
		$.ajax({
			url: "selectFolder.json",
			data: {id: $("#sId").val()},
			dataType: "json"
		})
		.done(function (data) {
			console.dir(data)
			$("#folder-area").html('');
			fileList = data.list;
			id = Number(data.list.length);
			for(var f of data.list){
				console.dir(f);
				var appendFile = '';
				if(f.folder){
					appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.path+'" data-title="'+f.title+'" ondblclick="test('+f.key+')">';
					appendFile += '<p class="contain">';
					appendFile += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg"';
					appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
					appendFile += '		alt="">';
					appendFile += '	</p>';
					appendFile += '	<span class="ellipsis">' + f.title + '</span>';
					appendFile += '</div>';
					$("#folder-area").append(appendFile);
				}else{
					appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.path+'" data-title="'+f.title+'" ondblclick="test1()">';
					appendFile += '<p class="contain">';
					if(f.type == 'img'){
						appendFile += '	<img src=download.do?path='+encodeURI(f.path)+'&fileName='+f.title;
// 						appendFile += `	<img src="${pageContext.request.contextPath}/resources/images/imageicon.png"`;
					}else if(f.title.split('.')[1] == 'mp3') {
						appendFile += `	<img src="${pageContext.request.contextPath}/resources/images/mp3image.png"`;
					}else if(f.title.split('.')[1] == 'xlsx') {
						appendFile += `	<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-excel-20132.png"`;
					}else if(f.title.split('.')[1] == 'pdf') {
						appendFile += `	<img src="${pageContext.request.contextPath}/resources/images/pdfimage.png"`;
					}else if(f.title.split('.')[1] == 'pptx') {
						appendFile += `	<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-powerpoint-2013.png"`;
					} else{
						appendFile += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500505134/if_sticky-note_299111_px7waa.png"';
					}
					appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
					appendFile += '		alt="">';
					appendFile += '	</p>';
					appendFile += '	<span class="ellipsis">' + f.title + '</span>';
					appendFile += '</div>';
					$("#folder-area").append(appendFile);
				}
			}
// 			$('#tree').fancytree('option', 'source', data.list);
			$("#share-path").data("root","c:/java-lec/upload/"+$("#sId").val());
			$("#share-path").html('<span class="path-icon-input">Share:</span><span class="path-icon-input">${sessionScope.user.id}</span>');
			
		});
	})
	
	
	//**************************************************************************************
	// 음악폴더 관리

	function musicOpen() {
		opencom();
		if($("#sId").val() != ''){
			$.ajax({
				url: "musicFolder.json",
				data: {
					id: $("#sId").val()
					},
				dataType: "json",
				type: "POST"
			})
			.done(function (data) {
				$("#folder-area").html('');
				console.dir(data)
				for(var f of data){
					console.dir(f);
					var appendFile = '';
					if(f.folder){
	// 					console.log("폴더")
						appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.path+'" data-title="'+f.title+'" ondblclick="test('+f.key+')">';
						appendFile += '<p class="contain">';
						appendFile += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg"';
						appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
						appendFile += '		alt="">';
	// 					appendFile += '	<img src="download.do?filePath='+f.parentPath+'&systemFileName=attach&originalFileName='+f.title+'" style="height: 64px;">';
						appendFile += '	</p>';
						appendFile += '	<span class="ellipsis">' + f.title + '</span>';
						appendFile += '</div>';
						$("#folder-area").append(appendFile);
					}else{
						appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.path+'" data-title="'+f.title+'" ondblclick="test1('+f.key+')">';
						appendFile += '<p class="contain">';
						appendFile += `	<img src="${pageContext.request.contextPath}/resources/images/mp3image.png"`;
						appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
						appendFile += '		alt="">';
	// 					appendFile += '	<img src="download.do?filePath='+f.parentPath+'&systemFileName=attach&originalFileName='+f.title+'" style="height: 64px;">';
						appendFile += '	</p>';
						appendFile += '	<span class="ellipsis">' + f.title + '</span>';
						appendFile += '</div>';
						$("#folder-area").append(appendFile);
					}
				}
				fileList = data;
				loadFancytree(data)
				$('#tree').fancytree('option', 'source', data);
				$("#share-path").data("root","c:/java-lec/upload/"+$("#sId").val() + "_music");
			})
		}
	}
	
	/*
		결체 import
	*/
	function payment(){
		IMP.request_pay({
		    pg : 'kakao', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 100,
		    buyer_email : 'wjdgns1155@naver.com',
		    buyer_name : '이정훈',
		    buyer_tel : '010-2082-8237',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'main/main.do'
		}, function(rsp) {
			if ( rsp.success ) {
				maxSize = maxSize + 100;
				$("#maxSize").html(maxSize + "MB 중")
				var msg = '결제가 완료되었습니다.';
				swal({
					position: 'center',
					type: 'success',
					title: msg,
					showConfirmButton: false,
					timer: 1500
					});
					
			} else {
				var msg = '결제에 실패하였습니다.';
				swal({
					position: 'center',
					type: 'error',
					title: msg,
					showConfirmButton: false,
					timer: 1500
		        });
		    }
		});
	}
</script>
</body>
</html>