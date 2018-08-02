$(".inputDetail, #userEmail, #emailResult" ).focus(function(){
		$(this).prev().addClass("show");
});
$(".inputDetail, #userEmail").blur(function(){
	if(!$(this).val()){
		$(this).prev().removeClass("show");
	}
});

$("#submitBtn1").click(function() {
	
});
//ID 중복 체크

//$("#userId").focus(function () {
//	if($(this).val() == ""){
//		$("#userId").next().text("영문/숫자를 조합하여 입력");
//		return;
//	}
//	console.log("아이디 중복 체크 작동중..");
//	$.ajax({
//		url: "/bitcode/login/signUpIdCheck.json",
//		data: {
//			"id" : $(this).val()	
//		},
//		dataType: "json",
//		success: function (data) {
//			console.log(data);
//			var	result = "";
//			if (data == false) {
//				result = "사용가능한 아이디입니다.";
//				$("#userId").data("flag","yes");
//				$(".innerText").css("color","blue");
//				
//			}else{
//				result = "사용이 불가능한 아이디입니다.";
//				$("#userId").data("flag","no");
//				$(".innerText").css("color","red");
//			}
//			$("#userId").next().text(result);
//		}
//	});
//});
//email 중복 체크
$("#userconformEmail").focus(function () {
	$.ajax({
		url: "/bitcode/login/emailCheck.json",
		data: {
			"email" : $("#userconformEmail").val()
		},
		dataType: "json",
		success: function (data) {
			console.log(data);
			
			if (data == false) {
				$("#userconformEmail").data("flag","yes");
				$("#userconformEmail > p").css("color","blue");
				$("#userconformEmail > p").text("사용가능한 이메일 입니다.");
			}else{
				$("#userconformEmail").data("flag","no");
				$("#userconformEmail > p").css("color","red");
				$("#userconformEmail > p").text("사용 불가능한 또는 중복된 이메일입니다.");
			}
		}
	});
});



//비번 체크
$("#userPassCheck").focus(function(){
	console.log($(this).val().length)
	if($(this).val() == ""){
		$("#userPassCheck").next().text("");
		return;
	}
	if($(this).val() == $("#userPass").val()){
		$("#userPassCheck").next().text("비밀번호가 일치합니다.");
		$("#userPassCheck").data("flag","yes");
		$(".innerText").css("color","blue");
	}else{
		$("#userPassCheck").next().text("비밀번호가 일치하지 않습니다.");
		$("#userPassCheck").data("flag","no");
		$(".innerText").css("color","red");
	}
});


// 생년월일 체크
var year = null;
var month = null;
var date = null;

$("#birth1").keyup(function(){
	year = $("#birth1").val();
	if($("#birth1").val() == "") {
//		$("#birthtext").next().text("Example) 1988 01 01");
		$("#birth1").data("flag","no");
		return;
	}else{
//		$("#birthtext").next().text("Example) 1988 01 01");
		$("#birth1").data("flag","yes");
		return;
	}
});
$("#birth2").keyup(function(){
	 month = ($("#birth2").val());
	 console.log($("#birth2").val().length);
	if($("#birth2").val() == "" || month < 1 || month >= 13 || $("#birth2").val().length == 1) {
//		$("#birth3").next().text("1월부터 12월까지 입력 가능합니다. ");
		$("#birth2").data("flag","no");
		return;
	}else{
		$("#birth2").data("flag","yes");
//		$("#birth3").next().text("");
		return;
	}

});	     




//
$("#birth3").keyup(function(){
	date = $("#birth3").val();
	month = $("#birth2").val();
	year = $("#birth1").val();
		if ($("#birth3").val() == "" || date < 1 || date > 31 || $("#birth3").val().length == 1) {
		$("#birth3").data("flag","no");
		$("#birthtext").next().text("Example) 1988 01 01");
//		$("#birth3").next().text("일은 1일부터 31일까지 입력가능합니다. ");
		return;
	}else{
		$("#birth3").data("flag","yes");
		$("#birthtext").next().text("Example) 1988 01 01");
		
	}	
	
	if ((month==4 || month==6 || month==9 || month==11) && date==31) {
		$("#birth3").data("flag","no");
//		$("#birth3").next().text(month +"월은 31일이 존재하지 않습니다.");
		return;
	}else{
		$("#birth3").data("flag","yes");
		
	} 	
//	
	if (month == 2) {
		var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		if (date>29 || (date==29 && !isleap)) {
			$("#birth3").data("flag","no");
			return;
		}
	}else{
		$("#birth3").data("flag","yes");
		
	}	
	
	
});		     




//이름
$("#userName").focus(function(){
	if($(this).val() == ""){
		$(this).data("flag","no");
	}else{
		$(this).data("flag","yes");
	}
})



//별명 중복 체크

$("#nickName").keyup(function () {
	if($(this).val() == ""){
		$("#nickName").next().text("닉네임 입력");
		return;
	}
	console.log("닉네임 중복 체크 작동중..");
	$.ajax({
		url: "/bitcode/login/signUpNickCheck.json",
		data: {
			"nickName" : $(this).val()	
		},
		dataType: "json",
		success: function (data) {
			console.log(data);
			var	result = "";
			if (data == false) {
				result = "사용가능한 nickName 입니다.";
				$("#nickName").data("flag","yes");
				$(".innerText").css("color","blue");
				
			}else{
				result = "사용이 불가능한 nickName입니다.";
				$("#nickName").data("flag","no");
				$(".innerText").css("color","red");
			}
			$("#nickName").next().text(result);
		}
	});
});




//별명 
//$("#nickName").keyup(function(){
//	if($(this).val() == ""){
//		$(this).data("flag","no");
//	}else{
//		$(this).data("flag","yes");
//	}
//})


//공백 체크
var birthday = null;
$("#submitBtn").click(function(){
//	var id = $("#userId").data("flag");
	var pass = $("#userPassCheck").data("flag");
	var name = $("#userName").data("flag");
	var nickName = $("#nickName").data("flag");
	var year = $("#birth1").data("flag");
	var month = $("#birth2").data("flag");
	var date = $("#birth3").data("flag");
	var email = $("#userconformEmail").data("flag");
//	id = isEmpty($("#userId"), id , "아이디를 입력해주세요");
	pass = isEmpty($("#userPassCheck"), pass , "비밀번호를 입력해주세요");
	name = isEmpty($("#userName"), name , "이름을 입력해주세요");
	nickName = isEmpty($("#nickName"), nickName , "별명을 입력해주세요");
	year = isEmpty($("#birth1"), year , "정확한 년도를 입력해주세요");
	month = isEmpty($("#birth2"), month , "1월부터 12월까지 입력 가능합니다. ");
	date = isEmpty($("#birth3"), date , "정확한 날짜를 입력해주세요. (2000-01-01)");
	email = isEmpty($("#userconformEmail"), email , "중복된 이메일 입니다.");
	if(pass == false || name == false || nickName == false || email == false ||year == false ||month == false || date == false){
		return;
	}
	birthday = $("#birthday").val();
	$("#birthday").val($("#birth1").val() + $("#birth2").val() + $("#birth3").val());

	$("#userForm").submit();
})

function isEmpty(obj, flag ,msg) {
	if(flag != "yes"){
		obj.focus();
		swal(msg);
		return false;
	}
	return true;
}


