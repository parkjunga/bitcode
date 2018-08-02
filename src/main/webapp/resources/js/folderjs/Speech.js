/*!
*
* WebRTC Lab 
* @author dodortus (codejs.co.kr / dodortus@gmail.com)
*
*/
$(function() {
 if (typeof webkitSpeechRecognition != 'function') {
   alert('크롬에서만 동작 합니다.');
   return false;
 }

var recognition = new webkitSpeechRecognition();
var isRecognizing = false;
var ignoreOnend = false;
var finalTranscript = '';
var audio = document.getElementById('audio');
var $btnMic = $('#btn-mic');
var $folder = $('#icon-computer');
var $player = $('#wmplayer');
var $result = $('#result');
var $iconMusic = $('#icon-music');
var $close = $("#closeMIC");
var $code = $("#coding");
console.dir(recognition)
recognition.continuous = true;
recognition.interimResults = true;

 recognition.onstart = function() {
   console.log('onstart', arguments);
   isRecognizing = true;

   $btnMic.attr('class', 'on');
 };

 recognition.onend = function() {
   console.log('onend', arguments);
	console.dir(event)
   isRecognizing = false;

   if (ignoreOnend) {
     return false;
   }

   // DO end process
   $btnMic.attr('class', 'off');
   if (!finalTranscript) {
     console.log('empty finalTranscript');
     return false;
   }

   if (window.getSelection) {
     window.getSelection().removeAllRanges();
     var range = document.createRange();
     range.selectNode(document.getElementById('final-span'));
     window.getSelection().addRange(range);
   }

 };

 recognition.onresult = function(event) {
   console.log('onresult', event);

   var interimTranscript = '';
   if (typeof(event.results) == 'undefined') {
     recognition.onend = null;
//     recognition.stop();
     return;
   }

   for (var i = event.resultIndex; i < event.results.length; ++i) {
     if (event.results[i].isFinal) {
       finalTranscript += event.results[i][0].transcript;
     } else {
       interimTranscript += event.results[i][0].transcript;
     }
   }

   finalTranscript = capitalize(finalTranscript);
   final_span.innerHTML = linebreak(finalTranscript);
   interim_span.innerHTML = linebreak(interimTranscript);

   console.log('finalTranscript', finalTranscript);
   console.log('interimTranscript', interimTranscript);
   fireCommand(interimTranscript);
 };

 /**
  * changeColor
  *
  */
 /*개덥 쑤지눌 폭력인데 나븐수지
	  .red 		{ background: red; }
		.blue 	{ background: blue; }
		.green 	{ background: green; }
		.yellow { background: yellow; }
		.orange { background: orange; }
		.grey 	{ background: grey; }
		.gold   { background: gold; }
		.white 	{ background: white; }
		.black  { background: black; }
	*/
 function fireCommand(string, opencom) {
 	if (string.endsWith('폴더 열어') || string.endsWith('폴더 열어줘') || string.endsWith('오픈')) {
// 		 opencom();
	     console.log('opencom() 호출');
	     $folder.trigger('dblclick');
	     console.log($folder);
     // opencom() 함수 호출
 	}else if (string.endsWith('닫기') || string.endsWith('다다') || string.endsWith('폴더 다다') || string.endsWith('폴더 닫아') || string.endsWith('폴더 닫아줘') || string.endsWith('닫아')){
	     console.log('closecom() 호출');
	     $close.trigger('click');
	     console.log($close)
//	     closecom();
 	}else if (string.endsWith('음악 켜줘') || string.endsWith('음악 켜 줘') || string.endsWith('음악 틀어 줘') || string.endsWith('음악 틀어줘') || string.endsWith('재생') || string.endsWith('플레이')) {
	     $player.trigger('click');
	     console.log($close)
 	}else if (string.endsWith('음악 꺼줘') || string.endsWith('음악 꺼 줘') || string.endsWith('음악 멈쳐줘') || string.endsWith('중지') || string.endsWith('스탑')) {
		callMain()
 	}else if (string.endsWith('코드 공유') || string.endsWith('공유 게시판 열어줘') || string.endsWith('공유 게시판 열어 줘') || string.endsWith('공유 게시판') || string.endsWith('코드 게시판') || string.endsWith('코드')) {
 		coding.click();
 	}else if (string.endsWith('메인') || string.endsWith('메인으로') || string.endsWith('메인화면') || string.endsWith('처음으로')) {
 		console.dir($("#start-menu"));
 		mainIcon.click();
 	}else if (string.endsWith('채팅방') || string.endsWith('대화방') || string.endsWith('채팅방으로') || string.endsWith('대화방 열어줘') || string.endsWith('채팅방 열어줘')) {
 		console.log("채팅방");
 		chat.click();
 	}else if (string.endsWith('상담실') || string.endsWith('원격 상담') || string.endsWith('원격 대화방') || string.endsWith('상담실 열어줘') || string.endsWith('원격상담 열어줘')) {
 		console.log("상담실");
 		remote.click();
 	}else if (string.endsWith('질문') || string.endsWith('질문 게시판 열어줘') || string.endsWith('질문 게시판 열어 줘') || string.endsWith('질문 게시판')) {
 		console.log("qna");
 		question.click();
 	}else if (string.endsWith('뉴스') || string.endsWith('뉴스 보여줘') || string.endsWith('뉴스 열어줘') || string.endsWith('뉴스 열어 줘')) {
		console.log("news");
		news.click();
 	}else if (string.endsWith('학원') || string.endsWith('학원 위치 알려줘') || string.endsWith('학원 위치 알려 줘') || string.endsWith('학원 보여줘') || string.endsWith('학원 보여 줘')) {
 		console.log("학원센터");
 		search.click();
 	}else if (string.endsWith('메모장') || string.endsWith('메모장 열어줘') || string.endsWith('메모장 열어 줘') || string.endsWith('메모장 보여줘') || string.endsWith('메모장 보여 줘')) {
 		console.log("메모장");
 		notepad.click();
 	}else if (string.endsWith('로그인')){
 		login.click();
 	}else if (string.endsWith('로그아웃') || string.endsWith('나갈래')) {
 		logout.click();
 	}
 	
 }
	
	
 recognition.onerror = function(event) {
   console.log('onerror', event);
	console.dir(event)
   if (event.error == 'no-speech') {
     ignoreOnend = true;
   } else if (event.error == 'audio-capture') {
     ignoreOnend = true;
   } else if (event.error == 'not-allowed') {
     ignoreOnend = true;
   }

   $btnMic.attr('class', 'off');
 };

 var two_line = /\n\n/g;
 var one_line = /\n/g;
 var first_char = /\S/;

 function linebreak(s) {
   return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
 }

 function capitalize(s) {
   return s.replace(first_char, function(m) {
     return m.toUpperCase();
   });
 }

 function start(event) {
   if (isRecognizing) {
     recognition.stop();
     return;
   }
   recognition.lang = 'ko-KR';
   recognition.start();
   ignoreOnend = false;

   finalTranscript = '';
   final_span.innerHTML = '';
   interim_span.innerHTML = '';

 }

 /**
  * textToSpeech
  * 지원: 크롬, 사파리, 오페라, 엣지
  */
 function textToSpeech(text) {
   console.log('textToSpeech', arguments);

   /*
   var u = new SpeechSynthesisUtterance();
   u.text = 'Hello world';
   u.lang = 'en-US';
   u.rate = 1.2;
   u.onend = function(event) {
     log('Finished in ' + event.elapsedTime + ' seconds.');
   };
   speechSynthesis.speak(u);
   */

   // simple version
   speechSynthesis.speak(new SpeechSynthesisUtterance(text));
 }

 /**
  * requestServer
  * key - AIzaSyDiMqfg8frtoZflA_2LPqfGdpjmgTMgWhg
  */
 function requestServer() {
   $.ajax({
     method: 'post',
     url: 'https://www.google.com/speech-api/v2/recognize?output=json&lang=en-us&key=AIzaSyDiMqfg8frtoZflA_2LPqfGdpjmgTMgWhg',
     data: '/examples/speech-recognition/hello.wav',
     contentType: 'audio/l16; rate=16000;', // 'audio/x-flac; rate=44100;',
     success: function(data) {

     },
     error: function(xhr) {

     }
   });
 }

 /**
  * init
  */
 // $btnMic.click(start);
 start();
 $('#btn-tts').click(function() {
   textToSpeech($('#final_span').text() || '전 음성 인식된 글자를 읽습니다.');
 });
});