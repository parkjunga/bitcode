var videosContainer = document.getElementById("videos-container") || document.body;
var roomsList = document.getElementById('roomsList');
var screensharing = new Screen();
var channel = location.href.replace(/\/|:|#|%|\.|\[|\]/g, '');
// 채팅방 번호
var roomId = location.href.split("#")[1];

$(document).ready(function() {
	if(channel){
		var link = document.querySelector('#link');
		link.setAttribute('value', location.href);
	}
	$("#endScreen").hide();
});

var sender = Math.round(Math.random() * 999999999) + 999999999;

var SIGNALING_SERVER = 'https://socketio-over-nodejs2.herokuapp.com:443/';
io.connect(SIGNALING_SERVER).emit('new-channel', {
    channel: channel,
    sender: sender
});

var socket = io.connect(SIGNALING_SERVER + channel);
socket.on('connect', function () {
    // setup peer connection & pass socket object over the constructor!
});

socket.send = function (message) {
    socket.emit('message', {
        sender: sender,
        data: message
    });
};
screensharing.openSignalingChannel = function(callback) {
    return socket.on('message', callback);
};

// 공유된 화면 출력하기
screensharing.onscreen = function(_screen) {
    var alreadyExist = document.getElementById(_screen.userid);
    if (alreadyExist) return;
    if (typeof roomsList === 'undefined') roomsList = document.body;
    /*
    var tr = document.createElement('tr');
    tr.id = _screen.userid;
    //tr.innerHTML = '<td>' + _screen.userid + ' 회원 화면 함께보기</td>' +
    tr.innerHTML = '<span id="number-of-participants">회원 화면 함께 보기. </span><button class="join screenShare order btn btn-default btn-group-xs">출력</button>';
    roomsList.insertBefore(tr, roomsList.firstChild);
    */
    var tr = document.createElement('span');
    tr.id = _screen.userid;
    //tr.innerHTML = '<td>' + _screen.userid + ' 회원 화면 함께보기</td>' +
    tr.innerHTML = '회원 화면 함께 보기. <button class="join screenShare order btn btn-default btn-group-xs">출력</button>';
    roomsList.insertBefore(tr, roomsList.firstChild);
    var button = tr.querySelector('.join');
    button.setAttribute('data-userid', _screen.userid);
    button.setAttribute('data-roomid', _screen.roomid);
    button.onclick = function() {
        var button = this;
        button.disabled = true;
        var _screen = {
            userid: button.getAttribute('data-userid'),
            roomid: button.getAttribute('data-roomid')
        };
        screensharing.view(_screen);
    };
};
// 스크린 출력시 비디오 태그 생성
screensharing.onaddstream = function(media) {
    media.video.id = media.userid;
    var video = media.video;
    video.setAttribute("class", "remoteScreen");
    videosContainer.insertBefore(video, videosContainer.firstChild);
    
    var hideAfterJoin = document.querySelectorAll('.hide-after-join');
    for(var i = 0; i < hideAfterJoin.length; i++) {
        hideAfterJoin[i].style.display = 'none';
    }
    if(media.type === 'local') {
        addStreamStopListener(media.stream, function() {
            location.reload();
        });
    }
};

screensharing.onuserleft = function(userid) {
    var video = document.getElementById(userid);
    if (video && video.parentNode) video.parentNode.removeChild(video);
    // location.reload();
};

// 화면 공유
screensharing.check();
document.getElementById('shareScreen').onclick = function() {
    var username = document.getElementById('user-name');
    //username.disabled = this.disabled = true;
    screensharing.isModerator = true;
    screensharing.userid = username.value;
    screensharing.share();
};

// 공유화면 접속자 수 출력/상담 연결시
screensharing.onNumberOfParticipantsChnaged = function(numberOfParticipants) {
    if(!screensharing.isModerator) return;
    document.title = numberOfParticipants + ' users are viewing your screen!';
    var element = document.getElementById('number-of-participants');
    if (element) {
        //element.innerHTML = numberOfParticipants + ' users are viewing your screen!';
        element.innerHTML = '상담이 연결되었습니다.';
    }
};


// 화면 공유

var isChrome = !!navigator.webkitGetUserMedia;
var DetectRTC = {};
(function () {
    var screenCallback;
    DetectRTC.screen = {
        chromeMediaSource: 'screen',
        getSourceId: function(callback) {
            if(!callback) throw '"callback" parameter is mandatory.';
            screenCallback = callback;
            window.postMessage('get-sourceId', '*');
        },
        isChromeExtensionAvailable: function(callback) {
            if(!callback) return;
            if(DetectRTC.screen.chromeMediaSource == 'desktop') return callback(true);
            // ask extension if it is available
            window.postMessage('are-you-there', '*');
            setTimeout(function() {
                if(DetectRTC.screen.chromeMediaSource == 'screen') {
                    callback(false);
                }
                else callback(true);
            }, 2000);
        },
        onMessageCallback: function(data) {
            if (!(typeof data == 'string' || !!data.sourceId)) return;
            console.log('chrome message', data);
            // "cancel" button is clicked
            if(data == 'PermissionDeniedError') {
                DetectRTC.screen.chromeMediaSource = 'PermissionDeniedError';
                if(screenCallback) return screenCallback('PermissionDeniedError');
                else throw new Error('PermissionDeniedError');
            }
            // extension notified his presence
            if(data == 'rtcmulticonnection-extension-loaded') {
                if(document.getElementById('install-button')) {
                    document.getElementById('install-button').parentNode.innerHTML = '<strong>Great!</strong> <a href="https://chrome.google.com/webstore/detail/screen-capturing/ajhifddimkapgcifgcodmmfdlknahffk" target="_blank">Google chrome extension</a> is installed.';
                }
                DetectRTC.screen.chromeMediaSource = 'desktop';
            }
            // extension shared temp sourceId
            if(data.sourceId) {
                DetectRTC.screen.sourceId = data.sourceId;
                if(screenCallback) screenCallback( DetectRTC.screen.sourceId );
            }
        },
        getChromeExtensionStatus: function (callback) {
            if (!!navigator.mozGetUserMedia) return callback('not-chrome');
            var extensionid = 'ajhifddimkapgcifgcodmmfdlknahffk';
            var image = document.createElement('img');
            image.src = 'chrome-extension://' + extensionid + '/icon.png';
            image.onload = function () {
                DetectRTC.screen.chromeMediaSource = 'screen';
                window.postMessage('are-you-there', '*');
                setTimeout(function () {
                    if (!DetectRTC.screen.notInstalled) {
                        callback('installed-enabled');
                    }
                }, 2000);
            };
            image.onerror = function () {
                DetectRTC.screen.notInstalled = true;
                callback('not-installed');
            };
        }
    };
    // check if desktop-capture extension installed.
    if(window.postMessage && isChrome) {
        DetectRTC.screen.isChromeExtensionAvailable();
    }
})();
DetectRTC.screen.getChromeExtensionStatus(function(status) {
    if(status == 'installed-enabled') {
        if(document.getElementById('install-button')) {
            document.getElementById('install-button').parentNode.innerHTML = '<strong>Great!</strong> <a href="https://chrome.google.com/webstore/detail/screen-capturing/ajhifddimkapgcifgcodmmfdlknahffk" target="_blank">Google chrome extension</a> is installed.';
        }
        DetectRTC.screen.chromeMediaSource = 'desktop';
    }
});
window.addEventListener('message', function (event) {
    if (event.origin != window.location.origin) {
        return;
    }
    DetectRTC.screen.onMessageCallback(event.data);
});
console.log('current chromeMediaSource', DetectRTC.screen.chromeMediaSource);


//화면공유시 상담신청 List에 정보 전달
$("#shareScreen").click(function() {
	var formData = $("#qForm").serialize();
	console.log(formData);
		$.ajax({
			type : "POST",
			url : "/bitcode/remote/remote.do",
			cache : false,
			data : formData,
			success : function() {
				console.log("상담신청 리스트 등록");
			}
	});
	$("#shareScreen").toggle();
	$("#endScreen").toggle();
});


