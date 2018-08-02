	var computer = document.getElementById('icon-computer');
	var computerOverlay = document.getElementById('overlay-computer');
	var musicOverlay = document.getElementById('overlay-computer-music');
	var shareOverlay = document.getElementById('overlay-computer-share');
	var isDown = false;
	
	function opencom() {
		computerOverlay.style.transform = "scale(1)";
		document.getElementById('a1').style.display = "block";
	}

	function closecom() {
		computerOverlay.style.transform = "scale(0)";
		document.getElementById('a1').style.display = "none";
//		document.getElementById('folder').style.border = 'none';
	}

	function closeopencom() {
		computerOverlay.style.transform = "scale(0)";
		document.getElementById('a1').style.display = "block";
		document.getElementById('a1').style.borderBottom = '2px solid #76b9ed';
//		document.getElementById('folder').style.borderBottom = '2px solid #76b9ed'
	}
	document.getElementById('a1').onclick = function() {
		if (computerOverlay.style.transform == "scale(1)") {
			computerOverlay.style.transform = "scale(0)";
			this.style.borderBottom = '2px solid #76b9ed';
		} else {
			computerOverlay.style.transform = "scale(1)"
			this.style.border = 'none';
		}
	}
	document.getElementById('folder').onclick = function() {
		if (computerOverlay.style.transform == "scale(1)") {
			computerOverlay.style.transform = "scale(0)";
			this.style.borderBottom = '2px solid #76b9ed';
		} else {
			computerOverlay.style.transform = "scale(1)"
			this.style.border = 'none';
		}
	}
	var div = document.getElementById('overlay-computer'), mouseclick = document
			.getElementById('first-row-win');

	mouseclick.addEventListener('mousedown', function(e) {
		isDown = true;
		offset = [ div.offsetLeft - e.clientX, div.offsetTop - e.clientY ];
	}, true);

	document.addEventListener('mouseup', function() {
		isDown = false;
	}, true);

	document.addEventListener('mousemove', function(event) {
		event.preventDefault();
		if (isDown) {
			mousePosition = {
				x : event.clientX,
				y : event.clientY
			};
			div.style.left = (mousePosition.x + offset[0]) + 'px';
			div.style.top = (mousePosition.y + offset[1]) + 'px';
		}
	}, true);

	var resizer = document.getElementsByClassName('resizer')[0];
	resizer.addEventListener('mousedown', initDrag, false);
	div.onresize = function() {
		resizer.style.bottom = 0;
		resizer.style.right = 0;
	}

	var startX, startY, startWidth, startHeight;

	function initDrag(e) {
		startX = e.clientX;
		startY = e.clientY;
		startWidth = parseInt(document.defaultView.getComputedStyle(div).width,
				10);
		startHeight = parseInt(
				document.defaultView.getComputedStyle(div).height, 10);
		document.documentElement.addEventListener('mousemove', doDrag, false);
		document.documentElement.addEventListener('mouseup', stopDrag, false);
	}

	function doDrag(e) {
		div.style.width = (startWidth + e.clientX - startX) + 'px';
		div.style.height = (startHeight + e.clientY - startY) + 'px';
	}

	function stopDrag(e) {
		document.documentElement
				.removeEventListener('mousemove', doDrag, false);
		document.documentElement
				.removeEventListener('mouseup', stopDrag, false);
	}
	div.onscroll = function() {
		resizer.style.bottom = (0 - div.scrollTop) + "px";
		resizer.style.right = 0;
	}

	function upercom() {
		div.style.width = "100%";
		div.style.top = "0";
		div.style.left = "0";
		div.style.height = "95.3vh";
		document.getElementById('upercam').style.display = "none";
		document.getElementById('returncam').style.display = "inline";
	}

	function returncom() {
		div.style.width = "70%";
		div.style.top = "20%";
		div.style.left = "15%";
		div.style.height = "60%";
		document.getElementById('returncam').style.display = "none";
		document.getElementById('upercam').style.display = "inline";
	}
