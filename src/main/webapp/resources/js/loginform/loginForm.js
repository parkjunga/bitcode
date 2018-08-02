//카카오톡

$(document).ready(function(e){
	$("#siciallogin").on('click',function(){
		$('.social').stop().slideToggle();
	});
})   


Kakao.init('2cc709ee9221eabde91595f7d69427c1');  //여기서 발급받은 키  javascript키를 사용해준다.( 키 정보는 개인정보)
Kakao.Auth.createLoginButton({
	container: '#kakao-login-btnn',
	success: function(authObj) {
		Kakao.API.request({
			url: '/v1/user/me',
			success: function(res) {
				kakao(res); 
				console.log(res.properties.nickname);
				console.log(authObj.access_token);

			}
		})
	}
});

function kakao(res) {
	var kakaoForm = $("#kakaoForm");
	$("#kakaoId").val(res.id);
	$("#kakaoEmail").val(res.kaccount_email);
	$("#kakaoNickname").val(res.properties_nickname);

	kakaoForm.submit();
}


//Pass 찾기
$("#forgetpass").on('click',function () {
	swal.mixin({
		input: 'text',
		confirmButtonText: '전송',
		showCancelButton: true,
		progressSteps: ['1', '2']
	}).queue([
		{
			title: '이메일를 입력하세요',
			text: '이메일로 임시비밀번호가 전송되니 정확하게 기입해주세요'
		},
		'ID를 입력하세요',
		]).then(function(result){
			if(result.value != undefined){
				fnFindPass(result);
			}
		})
});
function fnFindPass(data) {
	$("body").waitMe({
		effect: "ios",
		text: "Loding.. :D",
		bg: 'rgba(255,255,255, 0.7)',
		color: '#000'

	});	

	$.ajax({
		url : "/bitcode/sendMail/findPass.json",
		type: "POST",
		data : {
			"email" : data.value[0],
			"id": data.value[1]
		}
	}).done(function(data) {
		console.log(data.id)
		if(data.id == null){
			swal("입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.");
		}else{
			swal("귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
		}
		$("body").waitMe("hide");
	});

}		




//ID 찾기
$("#forgetid").on('click',function () {
	swal.mixin({
		input: 'text',
		confirmButtonText: '전송',
		showCancelButton: true,
		progressSteps: ['1', '2']
	}).queue([
		{
			title: '이름을 입력하세요',
			text: '...'
		},
		'이메일을 입력하세요',
		]).then(function(result){
			if(result.value != undefined){
				fnFindId(result);
			}
		})
});

function fnFindId(data) {
	$("body").waitMe({
		effect: "ios",
		text: "Loding.. :D",
		bg: 'rgba(255,255,255, 0.7)',
		color: '#000'

	});	
	$.ajax({
		url : "/bitcode/login/fogetId.json",
		type: "POST",
		data : {
			"name" : data.value[0],
			"email": data.value[1]
		}
	}).done(function(result) {
		if(data.id == null){
			swal("이름과 이메일이 일치 하지 않습니다.");
		}else{
			swal("아이디는 " + data.id + "입니다.");
		}
		$("body").waitMe("hide");
	});

}

// 패턴 로그인
$("#patternLogin").click(function() {
	$('.pattern').stop().slideToggle();
	$('input[name=password]').stop().slideToggle();
});