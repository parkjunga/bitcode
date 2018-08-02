if(loginId){


	var bitMenu = document.querySelector('.bitMenu');

	function showMenu(x, y){
		bitMenu.style.left = x + 'px';
		bitMenu.style.top = y + 'px';
		bitMenu.classList.add('show-bitMenu');
	}

	function hideMenu(){
		bitMenu.classList.remove('show-bitMenu');
	}

	function onContextMenua(e){
		e.preventDefault();
		showMenu(e.pageX, e.pageY);
		document.addEventListener('mousedown', onMouseDown, false);
	}

	function onMouseDown(e){
		hideMenu();
		
		// 컨텍스트 메뉴에서 클릭한 항목
		//console.dir(e.path[0].lastElementChild.id);
		if(e.path[0].lastElementChild.id.match("back1")){
			$(".content, .windows").css("background", "url(/bitcode/resources/images/userMainImg1.jpg)");
			localStorage.setItem(loginId, '1');
		}
		if(e.path[0].lastElementChild.id.match("back2")){
			$(".content, .windows").css("background", "url(/bitcode/resources/images/userMainImg2.jpg)");
			localStorage.setItem(loginId, '2');
		}
		if(e.path[0].lastElementChild.id.match("back3")){
			$(".content, .windows").css("background", "url(/bitcode/resources/images/userMainImg3.jpg)");
			localStorage.setItem(loginId, '3');
		}
		/*
		// 배경 이미지를 저장
		if(e.path[0].lastElementChild.id.match("userImgSave")){
			alert("userImgSave");
		}
		 */
		// 사용자 배경 초기화
		if(e.path[0].lastElementChild.id.match("userImgDel")){
			$(".content, .windows").css("background", "url(/bitcode/resources/images/main.jpg)");
			localStorage.clear();

		}


		document.removeEventListener('mousedown', onMouseDown);
	}

	document.addEventListener('contextmenu', onContextMenua, false);

}