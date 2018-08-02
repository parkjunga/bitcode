<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class=" -webkit-">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//static.codepen.io/assets/editor/live/console_runner-ce3034e6bde3912cc25f83cccb7caa2b0f976196f2f2d52303a462c826d54a73.js"></script>
<script	src="//static.codepen.io/assets/editor/live/css_live_reload_init-890dc39bb89183d4642d58b1ae5376a0193342f9aed88ea04330dc14c8d52f55.js"></script>
<link rel="canonical" href="https://codepen.io/boylett/pen/uCkms">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<link rel="stylesheet prefetch" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet prefetch" href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/player.css" />

<style>

</style>
</head>
<body>

	<%-- 재생 파일 등록 --%>
	<audio id="myaudio" autoplay="autoplay" loop="loop">
		<source src="${pageContext.request.contextPath}/images/album.png" type="audio/mpeg">
	</audio>
	
		
	<div class="music-player">
	<img src="" class="album">
	<div class="dash">
		<a href="#mute" class="fa fa-volume-up"></a>
		<span class="volume-level"><em style="width: 75%"></em></span>
		<%-- 
		<a href="#share" class="fa fa-share"></a>
		<a href="#love" class="fa fa-heart"></a>
		 --%>
		<div class="seeker">
			<div class="wheel">
				<div class="progress" style="transform: rotate(-233.217deg);"></div>
			</div>
		</div>
		<a href="#seek" style="transform: rotate(-233.217deg);" id="seek"></a>
		
		<%-- 재생 컨트롤바 --%>
		<div class="controls">
			<a href="#back" class="fa fa-fast-backward"></a>
			<a href="#play" class="fa fa-pause"></a>
			<a href="#forward" class="fa fa-fast-forward"></a>
		</div>
		
		<%-- 시간, 제목, 가수 출력 --%>
		<div class="info">
			<i><span name="current">0:00</span> / <span name="duration">0:00</span></i>
			<label id="title"></label><small id="singer"></small>
		</div>
	</div>
	</div>
		
	<script src="//static.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js"></script>
	<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
	<script>
		
		var playList = JSON.parse('${detailListGson}');
		
		<%-- 재생리스트 음악 갯수 --%>
		var max = playList.length;
		var pos = 0;
		
		<%-- 재생정보 설정 --%>
		function nowPlay () {
			if(pos >= max){ pos = 0; };
			if(pos <= -1){ pos = max; };
			var musicPath = playList[pos].musicPath;
			var imageLink = playList[pos].imageLink;
			var title = playList[pos].title;
			var singer  = playList[pos].singer;

			$("#myaudio")[0].src = "${pageContext.request.contextPath}" + musicPath;
			$(".album")[0].src = "${pageContext.request.contextPath}" + imageLink;
			//$(".album").attr("src", '${pageContext.request.contextPath}'' + imageLink);
			$("#title").text(title);
			$("#singer").text(singer);
		};
		
		<%-- 음악 재생 --%>
		nowPlay();
		
		var Player = {
			isMuted : false,
			isPlaying : false,
	
			duration : 0,
			current : 0,
		
			targetAudio: null,
			
			mute : function() {
				this.isMuted = this.isMuted ? false : true;
				this.targetAudio.muted = this.isMuted;
				return this
			},
	
			play : function(val) {
				if (val) { 
					this.targetAudio.play();
					return this;
				}
				this.isPlaying = this.isPlaying ? false : true;
				
				if (this.isPlaying) this.targetAudio.play();
				else                this.targetAudio.pause();
	
				return this
			},
	
			<%-- 다음곡 --%>
			skip : function(d) {
				nowPlay();
				/* 	
				if (window.console) console.log('Skipping', d == 'l' ? 'Backwards' : 'Forwards')
	
				if (d == 'l') {
					this.targetAudio.src = "${pageContext.request.contextPath}/music/001 김하온 (HAON), 이병재 (Vinxen) - 바코드 (Prod. GroovyRoom).mp3";
				} 
				else {
					this.targetAudio.src = "${pageContext.request.contextPath}/music/002 BIGBANG - 꽃 길.mp3";
				}
				 */
				
				this.targetAudio.addEventListener('loadedmetadata', function() {
// 					this.targetAudio.load();
					Player.setCurrent(0);
					Player.play(true);
					Player.setDuration(parseInt(Player.targetAudio.duration));
				});
				return this
			},
	
			vol : function(v) {
				this.targetAudio.volume = v / 100;
	
				return this
			},
	
			setDuration : function(s) {
				this.duration = s;
				var m = 0;
				while (s > 60) {
					m++;
					s -= 60
				}
				while (String(s).length == 1) s = '0' + s;
				// 재생중인 음악에 시간 정보 출력
				$('.music-player > .dash > .info > i > [name="duration"]').html(m + ':' + s);
				return this
			},
	
			setCurrent : function(s) {
				this.current = s;
	
				var m = 0,
					pct = this.current / this.duration;
				while (s > 60) {
					m++;
					s -= 60
				}
				while (String(s).length == 1) s = '0' + s;
	
				$('.music-player > .dash > .info > i > [name="current"]').html(m + ':' + s);
	
				$('.music-player > .dash > a[href="#seek"]:not(:active)').each(function() {
					var rotate = 'rotate(-' + ((pct * 180) + 90) + 'deg)';
	
					$(this).add('.music-player > .dash > .seeker > .wheel > .progress').css(
						{
							'-webkit-transform' : rotate,
							'-moz-transform' : rotate,
							'-ms-transform' : rotate,
							'-o-transform' : rotate,
							'transform' : rotate
						});
				});
				return this
			},
	
			playing : function() {
				if (!this.isPlaying)
					return this;
				
				this.setCurrent(parseInt(Player.targetAudio.currentTime));

				return this
			}
		};
	
		$(function() {
			<%-- 오디오 객체 --%>
			Player.targetAudio = $("#myaudio")[pos];
			
			Player.targetAudio.addEventListener("timeupdate", function () {
				<%-- 오디오객체 재생 --%>
				Player.playing();
			});
			
			<%-- 재생중인 음악에 재생 출력 --%>
			setTimeout(function() {
				Player.setDuration(parseInt(Player.targetAudio.duration));
				Player.setCurrent(0);
			}, 1000);
		
			Player.play();
	
			<%-- 뮤트버튼 클릭시 음소거 --%>
			$('.music-player > .dash > a[href="#mute"]').click(function() {
				$(this).toggleClass('fa-volume-up fa-volume-off');
				Player.mute();
	
				return !1;
			});
	
			<%-- 재생버튼 클릭시 오디오 플레이 --%>
			$('.music-player > .dash > .controls > a[href="#play"]').click(function() {
				$(this).toggleClass('fa-play fa-pause');
				Player.play();
				return !1;
			});
	
			<%-- 이전곡 --%>
			$('.music-player > .dash > .controls > a[href="#back"]').click(function() {
				--pos;
				Player.skip('l'); return !1
			});
			<%-- 다음곡 --%>
			$('.music-player > .dash > .controls > a[href="#forward"]').click(function() {
				++pos;
				Player.skip('r'); return !1
			});
	
			<%-- 볼륨 컨트롤 --%>
			$('.music-player > .dash > .volume-level').bind('mousemove', function(e) {
				if ($(this).is(':active')) {
					$(this).find('em').css('width', e.pageX - $(this).offset().left);
					var vol = $(this).find('em').width() / $(this).width() * 100;
	
					Player.vol(vol > 100 ? 100 : vol);
				}
			});
	
			$('.music-player').on('mousemove', function(e) {
				//http://jsfiddle.net/sandeeprajoria/x5APH/11/
	
				var wheel = $(this).find('.dash > .seeker > .wheel'),
					rotate,
					x = (e.pageX - 20) - wheel.offset().left - wheel.width() / 2,
					y = -1 * ((e.pageY - 20) - wheel.offset().top - wheel.height() / 2),
					deg = (90 - Math.atan2(y, x) * (180 / Math.PI)),
					pct,
					nc,
					nm = 0;
				if (deg > 270)
					deg = 270;
				else if (deg < 90)
					deg = 90;
				rotate = 'rotate(' + deg + 'deg)';
				pct = deg;
				pct = 270 - pct;
				pct = pct / 180;
				nc = Math.round(Player.duration * pct);
	
				$(this).find('.dash > a[href="#seek"]:active').each(function() {
					Player.current = nc;
					Player.targetAudio.currentTime = nc; 
					while (nc > 60) {
						nm++;
						nc -= 60
					}
					while (String(nc).length == 1) nc = '0' + nc;
	
					$('.music-player > .dash > .info > i > [name="current"]').html(nm + ':' + nc);
	
					$(this).add('.music-player > .dash > .seeker > .wheel > .progress').css(
						{
							'transform' : rotate
						});
				});
			});
		});


	</script>
</body>
</html>