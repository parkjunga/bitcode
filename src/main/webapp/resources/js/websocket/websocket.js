/**
 * 
 */ 
var cnt = 0;	
$(function(){
	if(loginId){
//	ws = new WebSocket("wss://localhost/bitcode/websocket.do");
		ws = new WebSocket("wss://192.168.0.165/bitcode/websocket.do");
		ws.onopen = function(){
			console.log("웹소켓 서버 접속 성공");
			// 웹소켓 서버에 데이터 전송하기
			if(loginId){		    	
				ws.send("notice:" + loginId);
			}
		};
		ws.onerror = function(evt) {
			//$(".details").prepend('웹소켓 에러 발생 : ' + evt.data)
		};

		ws.onmessage = function(evt) {

			// 알림 체크
			if((evt.data).startsWith("noticeA")){	
				var notice = (evt.data).split(":");
				// notice[0] notice[1] notice[2]
				//noticeA : 1번글의 1개의 답글을 읽지않았습니다. : 1
				console.dir(notice);
				var no = notice[1].split(",");

				var html = '';
				//alert(no);

				console.log("no.length", no.length);
				//console.dir(no);
				console.dir($("body > div.notifications.js-notifications.myshow > ul > li.notice1.item.js-item"));
				if(no.length == 1 && no[0].length == 0) {
					//alert("가");
					$(".notice1").remove();
				}
				for(var i=0; i < no.length-1; i++){
					html += '<span class="title"style="color: #7f8c8d !important; width:307px;">' + (i+1) +". "+ no[i] + '</span>';
					/*html += '<span class="date">시간</span>';		*/

				}


				$('li.notice1 div.details').html(html);
				var noticeCnt = notice[2];
				console.dir(no.length);
				//alert(noticeCnt);
				if(no.length == 1){
					$('.notifications-count.js-count').html(0);		        	
				}else{
					$('.notifications-count.js-count').html(noticeCnt);		        			        	
				}
				//$(".notice .details .title").data(id);
				//$("notice").attr('data-fruit','7');
				// $(".notice .details .title").append("<button type='button' class='noticeBtn button-default button-dismiss js-dismiss'>×</button>");

			}

			if((evt.data).startsWith("noticeB")){	
				var notice = (evt.data).split("noticeB:");
				var noticeB = '';
				//alert(notice[1]);
				noticeB += '<span class="title">' + notice[1] + '</span>';
				//noticeB += '<span class="date">시간</span>';
				$('li.notice2 div.details').html(noticeB);
				// $(".notice2 .details .title").append("<button type='button' class='noticeBtn2 button-default button-dismiss js-dismiss'>×</button>");
			}			

			// 유저리스트 체크
			if((evt.data).startsWith("userList")){	
				var subId = (evt.data).split(":");
				$("#entranceUser").html("");
				for(var i=1; i<subId.length; i++){
					$("#entranceUser").append(subId[i] + "<br>");					
				}
				$("#entranceUser").scrollTop($("#entranceUser").height());			
			}

			// 입장 체크
			if((evt.data).startsWith("in")){
				var inmsg = (evt.data).split(":");
				$("#chatResult").append("<p class='them'>"+inmsg[1] + "</p>");
				$("#chatResult").scrollTop($(document).height());
			}

			// 퇴장 체크
			if((evt.data).startsWith("out")){
				var outmsg = (evt.data).split(":");
				$("#chatResult").append("<p class='them'>"+outmsg[1] + "</p>");
				$("#chatResult").scrollTop($(document).height());			
			}						

			// 메시지 체크
			if((evt.data).startsWith("chat")){
				var msg = (evt.data).split(":");
				
				if(msg[1].match(nick)){
					$("#chatResult").append("<p class='me'>" +msg[1]+ " : " + msg[2]+"</p>");
					$("#chatResult").scrollTop($(document).height());								
				}
				else{
					$("#chatResult").append("<p class='them'>" +msg[1]+ " : " + msg[2]+"</p>");
					$("#chatResult").scrollTop($(document).height());													
				}
				
			}
			console.log("메세지 전송")
		};
		ws.onclose = function(){
			console.log("웹소켓 연결이 종료됨");
			// $(".details").prepend("웹소켓 연결이 종료됨");
		};
	} // loginId 체크 if문
}); // 웹소켓 연결

$('#sendBtn').click(function() { 
	var $msg = $("#message");
	// 웹소켓 서버에 데이터 전송하기
	if($msg.val()!=""){
		ws.send("chat:" + nick + ":" + $msg.val());
		$msg.val("");    	
	}
});

$('#message').keypress(function(key) {
	if(key.which == 13){
		var $msg = $("#message");
		// 웹소켓 서버에 데이터 전송하기
		if($msg.val()!=""){
			ws.send("chat:" + nick + ":" + $msg.val());
			$msg.val("");    	
		}
	}
});
