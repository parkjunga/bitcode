
//email 중복 체크

$(".emailDetail, #userEmail").keyup(function(){
	$(this).prev().addClass("show");
	
		if($("#userEmail").val() == ""){
			$("#userEmail").data("flag","yes");
			return;
		}
		console.log("이메일 중복 체크 작동중..");
		$.ajax({
			url: "/bitcode/user/emailCheck.json",
			data: {
				"email" : $("#userEmail").val(),	
				"id" : $("#userId").val()	
			},
			dataType: "json",
			success: function (data) {
				var	result = "";
				if (data == false) {
					result = "사용가능한 이메일 입니다.";
					$("#userEmail").data("flag","yes");
					$(".innerText").css("color", 'blue');
				}else{
					result = "사용 불가능한 또는 중복된 이메일입니다. ";
					$("#userEmail").data("flag","no");
					$(".innerText").css("color", 'red');
				}
				$("#userEmail").next().text(result);
			}
		});

});

//
//	$("#submitBtn").click(function () {
//		$("#userForm").submit();
//	})
//	
//	

//공백 체크
$("#submitBtn").click(function(){
	var email = $("#userEmail").data("flag");
	email = isEmpty($("#userEmail"), email , "사용 불가능한 또는 중복된 이메일입니다.");
	if(email == false){
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
	