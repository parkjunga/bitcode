//메모장 드래그
$(".noteBody").draggable();
//기본 숨기기로 시작
$(".noteBody").hide();

//닫기
$("#noteClose").click(function(){
	$(".noteBody").css("margin-top", "2000px");
	$(".noteBody").hide();
});

//실행시 출력/숨기기
function notepad(){
	$(".noteBody").toggle();
	$(".noteBody").css("margin-top", "-600px");
	//$(".noteBody").css("margin-top", "-50%");
};

if(loginId){
//	메모장 내용
//	var myNote = $("#myNoteContent").val();
//	var myNote = "";
	$.ajax({
		url: "/bitcode/main/myNote.json?id=" + loginId,
		success: function(result) {
			var myNote = $("#myNoteContent").html(result.replace(/<br>/g, "&#10;"));
		}
	}); // ajax
}

//내용 변경시 * 표시
$("#myNoteContent").keyup(function(){
	$("#nTitle").html("*BIT NOTE");
});


//new
$("#newNote").click(function(){
	swal({
		title: '메모를 초기화 합니다!',
		text: "확인을 누르시면 메모 내용이 삭제 됩니다.",
		type: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '확인'
	}).then((result) => {
		if (result.value) {
			var noteContent = {"id": loginId, "content": ""};
			$.ajax({
				type: "POST",
				url: "/bitcode/main/modNote.json",
				data: noteContent, 
				success: function(result) {
					var myNote = $("#myNoteContent").val("");
				},
				error:function(e) {
					console.dir(e);
				}
			});	
			$("#nTitle").html("BIT NOTE");
		}
	}); // swal
});

//save
$("#saveNote").click(function(){
	var modNote = $("#myNoteContent").val();
	modNote = modNote.replace(/(?:\r\n|\r|\n)/g, '<br>');
	var noteContent = {"id": loginId, "content": modNote};

	$.ajax({
		type: "POST",
		url: "/bitcode/main/modNote.json",
		data: noteContent, 
		success: function(result) {
			var myNote = $("#myNoteContent").html(result.result.replace(/<br>/g, "&#10;"));
		}
	}); // ajax	

	$("#nTitle").html("BIT NOTE");

	swal({
		title: '메모가 저장되었습니다.',
		type: 'info',
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '확인'
	}); // swal
});

//exit
$("#exitNote").click(function(){
	$(".noteBody").css("margin-top", "2000px");
	$(".noteBody").hide();
});
