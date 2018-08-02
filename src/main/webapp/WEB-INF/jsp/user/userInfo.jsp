<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/userInfo.css" />
<!-- <link href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css' rel='stylesheet' type='text/css'> -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.css" /> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pattern/patternLock.css" />
<script src="${pageContext.request.contextPath}/resources/js/pattern/patternLock.min.js"></script>

<style> 
.aaaa {
	color: red;
}
.stampId:hover {cursor: pointer;
text-decoration: none;
}
#textStmp {
width: 280px;
    height: 100px;
    color: white;
    font-size: 16px;
    font-weight: lighter;
    background-color: #fbc444;
    padding: 9px;
    border-radius: 20px 18px 20px 0px;
    box-shadow: 5px 5px 0px rgba(0,0,0,.1);
    text-decoration: none;
}
 #kCalendar #header { 
height: 70px; line-height: 70px; text-align: center; font-size: 20px; 
font-weight: bold; color: black; background-color: #ecec00;
-webkit-border-radius: 12px 12px 0px 0px;
-moz-border-radius: 12px 12px 0px 0px; 
border-radius: 12px 12px 0px 0px;
border: groove yellow;
}

#kCalendar {width: 350px; height: 400px; border: 3px solid #FFFFFF;
  -webkit-border-radius: 12px 12px 0px 0px;
  -moz-border-radius: 12px 12px 0px 0px; 
  border-radius: 12px 12px 0px 0px;
   border: 3px groove white;}
#calTable {margin-left: 10px; margin-top: 10px;}
#date { color: black;}

#kCalendar .button {color: #000; text-decoration: none;}

#kCalendar table {width: 320px; height:279px;}
#kCalendar caption {display: none;}
/* td {font-size: 15px; } */

#kCalendar .sun {text-align: center; font-size: 20px; width: 70px; height: 44px; padding-left: 6px;}
#kCalendar .mon {text-align: center; font-size: 20px; width: 70px; height: 44px; padding-left: 1px;}
#kCalendar .tue {text-align: center; font-size: 20px; width: 70px; height: 44px; padding-left: 9px;}
#kCalendar .wed {text-align: center; font-size: 20px; width: 70px; height: 44px; padding-left: 5px;}
#kCalendar .thu {text-align: center; font-size: 20px; width: 70px; height: 44px; padding-left: 7px;}
#kCalendar .fri {text-align: center; font-size: 20px; width: 70px; height: 44px; padding-left: 15px;}
#kCalendar .sat {text-align: center; font-size: 20px; width: 70px; height: 44px; padding-left: 12px;}

#userPattern {
	font-weight: lighter;
    text-align: center;
    font-size: 13px;
    width: 45%;
    height: 40px;
    padding: 5px;
    border-radius: 6px;
    border: 0;
    margin-left: 230px;
    background: #df736a;
    font-size: 1.1em;
    color: #fff;
    font-family: 'Arimo', sans-serif;
    text-decoration:none;
    ext-decoration:none;		
}
</style>
</head>
<body>
<!-- <div id="patternContainer" style="top: 300px; left: 600px;"></div> -->

<div class="container1">
  <p class="title1" id="profileName">MyForm</p>
  <div class="row cf">
    <div id="card1" class="card three col">
		<div class="topbar red">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="maxbtn"></div>
			<div class="xbtn"></div>
		</div>    
		  <h3 class="userInformation">Information</h3>
		  <p id="pName">이름  <a href="#"><span id="userPattern" onclick="window.open('${pageContext.request.contextPath}/user/pattern.do', 'pattern', 'width=400 height=400')">패턴등록</span></a></p>
		  <input name="name" type="text" id="userName" value="${user.name}" readonly="readonly"/>
		  <div class="nickDiv">
		  <p id="pName">별명</p>
		  <input name="nickName" type="text" id="nickName" data-flag="no" class="inputDetail" value="${user.nickName}" readonly="readonly"/>
		  <span id="submitBox">
		  	<a href="#" id="submitNickBtn"><span id="userInfoUpdate">수정</span></a>
  		  </span>
		 </div>
		 <p id="pName">ID</p>
		  <input name="id" type="text" id="userId" value="${user.id}" readonly="readonly"/>
	
		<p id="pName">Birthday</p>
		<div class="birthday">
		  <input type="text" name="year" id="birth1" size="4" class="inputDetail1" value="${yearId1}" readonly="readonly"/>
		  <input type="text" name="month" id="birth2"  size="2" class="inputDetail1" value="${monthId1}" readonly="readonly"/>
		  <input type="text" name="date" id="birth3"  size="2" class="inputDetail1" value="${dateId1}" readonly="readonly"/>  
		  <input name="birthday" type="hidden" class="inputDetail" id="birthday"/>
		</div>
		<div class="nickDiv">
		 <p id="pName">Email</p>	
		  <input name="email" type="text" id="userEmail" data-flag="no" class="emailDetail" value="${user.email}" readonly="readonly"/>
 		  <span id="submitBox"><a href="#" id="submitEmailBtn"><span id="userInfoUpdate">수정</span></a></span>
		</div>
		 <div class="updateBtns">
		 <span id="paName">Password</span>
<!-- 		  <span id="submitBox"> -->
<%-- 		  	<a href="${pageContext.request.contextPath}/user/updateUserForm.do?id=${sessionScope.user.id}" id="submitBtn"><span id="userInfoUpdate">나의 정보 수정</span></a> --%>
<!-- 		  </span> -->
		  <span id="submitBoxPass">
		  	<a href="#" id="submitPassBtn"><span id="userInfoUpdate">비밀번호 수정</span></a>
  		  </span>
 		 </div>   
    </div>
    <div id="card2" class="card six col">
		<div class="topbar blue">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="maxbtn"></div>
			<div class="xbtn"></div>
		</div>     
    	<h3 class="userInformation">My Question</h3>
		<table class="table table-hover">
			<tr>
				<th colspan="4">제목</th><th colspan="1">답변여부</th><th colspan="3">만족도</th>
			</tr>
			
			<c:forEach var="listUser" items="${qnaList.listUser}">
			<tr>
				<td colspan="4"><a id="board_title" href='${pageContext.request.contextPath}/qnaboard/detail.do?no=${listUser.no}'>${listUser.title}</a></td>				
				<c:choose>
				<c:when test="${listUser.answerAt eq 'Y'}">
				<td><img class="lelvel" src="${pageContext.request.contextPath}/resources/images/checked.png"></td>				
				</c:when>
				<c:otherwise>
				<td>
				<img class="lelvel" src="${pageContext.request.contextPath}/resources/images/unre.png"></td>	
				</c:otherwise>
				</c:choose>	
				<c:forEach var="listStis" items="${qnaList.listStis}">
				<c:choose>
					<c:when test="${listStis.stsfcCode eq '13' and listUser.no == listStis.groupNo}">
						<td>
						<a id="board_title" href='${pageContext.request.contextPath}/qnaboard/detail.do?no=${listStis.no}'>
						<img class="lelvel" src="${pageContext.request.contextPath}/resources/images/sstar.png">
						<img class="lelvel" src="${pageContext.request.contextPath}/resources/images/sstar.png">
						<img class="lelvel" src="${pageContext.request.contextPath}/resources/images/sstar.png"></a>
						</td>
					</c:when> 
					<c:when test="${listStis.stsfcCode eq '11' and listUser.no == listStis.groupNo}">
						<td>
						<a id="board_title" href='${pageContext.request.contextPath}/qnaboard/detail.do?no=${listStis.no}'>
						<img class="lelvel" src="${pageContext.request.contextPath}/resources/images/xstar.png"></a>
						</td>
					</c:when> 				
					<c:when test="${listStis.stsfcCode eq '12' and listUser.no == listStis.groupNo}">
						<td>
						<a id="board_title" href='${pageContext.request.contextPath}/qnaboard/detail.do?no=${listStis.no}'>
						<img class="lelvel" src="${pageContext.request.contextPath}/resources/images/sstar.png">
						<img class="lelvel" src="${pageContext.request.contextPath}/resources/images/sstar.png"></a>
						</td>
					</c:when> 	
					<c:when test="${listUser.no == listStis.groupNo}">
					<td><a id="board_title" href='${pageContext.request.contextPath}/qnaboard/detail.do?no=${listStis.no}'>
					<img class="lelvel" src="${pageContext.request.contextPath}/resources/images/go.png">답변보러가기
					</a></td>
					</c:when>
				</c:choose>	
				</c:forEach>
			</tr>
			</c:forEach>
			
		</table>
	</div>	

    <div id="card3" class="card three col">
		<div class="topbar orange">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="maxbtn"><span></span></div>
			<div class="xbtn"  onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div>
		<div>
<%-- 		<c:forEach var="userList" items="${userList}"> --%>
			<c:choose>
				<c:when test="${100 >= userInfo.point }">
				<p class="userInfoPoint"><img class="lelvel" src="${pageContext.request.contextPath}/resources/images/level2.png">초보&nbsp;<span class="userInfobattery"><img class="userInfobattery1" src="${pageContext.request.contextPath}/resources/images/1battery.png"></span>&nbsp;${userInfo.point}Point</p>
				</c:when>
				<c:when test="${userInfo.point >= 201 }">
				<p class="userInfoPoint"><img class="lelvel" src="${pageContext.request.contextPath}/resources/images/level2.png">고수&nbsp;<span class="userInfobattery"><img class="userInfobattery1" src="${pageContext.request.contextPath}/resources/images/4battery.png"></span>&nbsp;${userInfo.point}Point</p>
				</c:when>			
	        	<c:when test="${userInfo.point >= 101 && 201 >= userInfo.point}">
	        	<p class="userInfoPoint"><img class="lelvel" src="${pageContext.request.contextPath}/resources/images/level2.png">중수&nbsp;<span class="userInfobattery"><img class="userInfobattery1" src="${pageContext.request.contextPath}/resources/images/3battery.png"></span>&nbsp;${userInfo.point}Point</p>
	        	</c:when>		
			</c:choose>
<%-- 		</c:forEach> --%>
		</div>
		<div></div>
		<div></div>
<!-- 		캘린더 -->
		<div>
		<c:forEach var="attendList" items="${attendList}">
				<input name="attDate" id="${attendList.attID}" value='<fmt:formatDate value="${attendList.attDate}" pattern="yyyy-MM-dd" />' type="hidden" >
		</c:forEach>
		</div>
	  	<span><a class="stampId" href="#1" id="stampId">
	  	<img class="stamp" src="${pageContext.request.contextPath}/resources/images/stamp.png">
	  	<span id="textStmp">출석하기Click</span></a></span>
	  	<input name="id" value="${user.id}" type="hidden" >
	  
	  	<div id="kCalendar"></div>
    </div>
  </div>
</div>

<script>

$(".container1").draggable();


//캘린더 로딩
window.onload = function () {
	kCalendar('kCalendar');
};
$("#stampId").click(function () {
	//오늘 날짜
	var today = new Date();
	$.ajax({
		url : "/bitcode/user/attend.json",
		type: "POST",
		data : {
			"id"	  : $("#userId").val(),
			"attDate" : today
		},
		success : function(data){
			console.log(data);
			if(data == 2){
				swal("하루 한번만 출석이 가능합나다.");
				
			}
			else{
				swal("출석이 체크 되었습니다.");
				setTimeout( function() {
					location.reload();
					}, 2000);
				
			}
		
		}
	})	
});


/* Kurien / Kurien's Blog / http://blog.kurien.co.kr */
function kCalendar(id, date) {
	var attdate;	
	var attMonth;
	var kCalendar = document.getElementById(id);
	if( typeof( date ) !== 'undefined' ) {
		date = date.split('-');
		date[1] = date[1] - 1;
		date = new Date(date[0], date[1], date[2]);
	} else {
		var date = new Date();
	}
	var currentYear = date.getFullYear();
	//년도를 구함
	
	var currentMonth = date.getMonth() + 1;
	//연을 구함. 월은 0부터 시작하므로 +1, 12월은 11을 출력
	
	var currentDate = date.getDate();
	//오늘 일자.
	
	date.setDate(1);
	var currentDay = date.getDay();
	//이번달 1일의 요일은 출력. 0은 일요일 6은 토요일
	
	var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 )
		lastDate[1] = 29;
	//각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일 임.
	
	var currentLastDate = lastDate[currentMonth-1];
	var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );
	//총 몇 주인지 구함.
	
	if(currentMonth != 1)
		var prevDate = currentYear + '-' + ( currentMonth - 1 ) + '-' + currentDate;
	else
		var prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + currentDate;
	//만약 이번달이 1월이라면 1년 전 12월로 출력.
	
	if(currentMonth != 12) 
		var nextDate = currentYear + '-' + ( currentMonth + 1 ) + '-' + currentDate;
	else
		var nextDate = ( currentYear + 1 ) + '-' + 1 + '-' + currentDate;
	//만약 이번달이 12월이라면 1년 후 1월로 출력.

	
	if( currentMonth < 10 )
		var currentMonth = '0' + currentMonth;
	//10월 이하라면 앞에 0을 붙여준다.
	
	
	// 디비에서 가져온 유저의 날짜 출력

	
	var calendar = '';
	
	calendar += '<div id="header">';
	calendar += '			<span><a href="#" class="button left" onclick="kCalendar(\'' +  id + '\', \'' + prevDate + '\')"><</a></span>';
	calendar += '			<span id="date">'+ currentYear + '년' + currentMonth + '월</span>';
	calendar += '			<span><a href="#" class="button right" onclick="kCalendar(\'' + id + '\', \'' + nextDate + '\')">></a></span>';
	calendar += '		</div>';
	calendar += '		<table id="calTable" border="0" cellspacing="0" cellpadding="0">';
	calendar += '			<caption>' + currentYear + '년 ' + currentMonth + '월 달력</caption>';
	calendar += '			<thead>';
	calendar += '				<tr>';
	calendar += '				  <th class="sun" scope="row">sun</th>';
	calendar += '				  <th class="mon" scope="row">mon</th>';
	calendar += '				  <th class="tue" scope="row">tue</th>';
	calendar += '				  <th class="wed" scope="row">wed</th>';
	calendar += '				  <th class="thu" scope="row">thu</th>';
	calendar += '				  <th class="fri" scope="row">fri</th>';
	calendar += '				  <th class="sat" scope="row">sat</th>';
	calendar += '				</tr>';
	calendar += '			</thead>';
	calendar += '			<tbody>';
	
	var dateNum = 1 - currentDay;
	var attId = $("input[name=attDate]")
	var day = [];
	var mons = [];
	 for(let d = 0; d < attId.length; d++){
			var dbuser = attId[d]
			var attendate = dbuser.value;
			attendate = attendate.split('-');
			attendate[1]= attendate[1] - 1;
			attendate = new Date(attendate[0], attendate[1], attendate[2]);
			attdate = attendate.getDate();
			attMonth = attendate.getMonth() + 1;
			day.push({"date": attdate, "month": attMonth});
			mons.push(attMonth);
		 }
	 
	for(var i = 0; i < week; i++) {
		calendar += '			<tr>';
		
		for(var j = 0; j < 7; j++, dateNum++) {
			if( dateNum < 1 || dateNum > currentLastDate ) {
				calendar += '				<td class="' + dateString[j] + '"></td>';
				continue;
			}
			var check = '';
			for(let dd of day){
				if(dd.date == dateNum && dd.month == currentMonth){
					check = dd;
					break;
				}
			}
			
			calendar += '				<td class="' + dateString[j] + '" data-check="'+check+'">' + dateNum + '</td>';
			$("td").data('check')
		}
		calendar += '			</tr>';
	}
	calendar += '			</tbody>';
	calendar += '		</table>';

	kCalendar.innerHTML = calendar;
	var td = $("#calTable").find("td");
	for(let t of td){
		if(t.dataset.check){
			$(t).css("background", 'url(/bitcode/resources/images/attend2.png)')
			$(t).css("color", 'yellow')
		}
	}
}

//email 수정
$("#submitEmailBtn").on('click',function () {
	swal.mixin({
		  input: 'text',
		  confirmButtonText: '전송',
		  showCancelButton: true,
		  progressSteps: ['1']
		}).queue([
		  {
		    title: '변경할 Email 주소를 입력하세요',
		    text: '비밀번호 수정시 꼭 필요한 이메일 입니다.'
		  },
		]).then(function(result){
			if(result.value[0] == ""){
				swal("다시 입력하세요");
			}else {
				updateEmail(result);
			}
		})
});
function updateEmail(data) {
	$.ajax({
		url : "/bitcode/user/updateEmailForm.json",
		type: "POST",
		data : {
			"email" : data.value[0],
			"id"	  : id
		},
		success : function(data){
			if(data == false){
				swal("Email 주소가 수정되었습니다.");
				setTimeout( function() {
					location.reload();
					}, 2000);
			}else{
				swal("중복된 Email 입니다. 다시 시도해주세요.");
			}
			console.log(data + "성공")
		}
	})
}

// 별명 수정
$("#submitNickBtn").on('click',function () {
	swal.mixin({
		  input: 'text',
		  confirmButtonText: '전송',
		  showCancelButton: true,
		  progressSteps: ['1']
		}).queue([
		  {
		    title: '변경할 별명을 입력하세요',
		    text: 'BitCode'
		  },
		]).then(function(result){
			if(result.value[0] == ""){
				swal("다시 입력하세요");
			}else {
				updateNcik(result);
			}
		})
});
//별명 중복 체크
function updateNcik(data) {
	console.log("닉네임 중복 체크 작동중..");
	$.ajax({
		url: "/bitcode/user/updateNickCheck.json",
		data: {
			"nickName" : data.value[0],
			"id"	   : $("#userId").val()
		},
		dataType: "json",
		success: function (data) {
			if (data == false) {
				swal("닉네임이 수정되었습니다.");
				setTimeout( function() {
					location.reload();
					}, 2000);
			}else{
				swal("중복된 닉네임 입니다.");
			}
		}
	});
};



//Pass 찾기
var id = $("#userId").val();
$("#submitPassBtn").on('click',function () {
	swal.mixin({
	  input: 'text',
	  confirmButtonText: '전송',
	  showCancelButton: true,
	  progressSteps: ['1', '2']
	}).queue([
	  {
	    title: '변경할 비밀번호를 입력하세요',
	    text: ''
	  },
	  '비밀번호를 재입력 하세요',
	]).then(function(result){
		if(result.value[1] == result.value[1] ){
			fnFindPass(result);
		}else {
			swal("다시 입력하세요");
		}
	
	})
});
function fnFindPass(data) {
	$.ajax({
		url : "/bitcode/user/updatePassForm.json",
		type: "POST",
		data : {
			"password" : data.value[0],
			"password": data.value[1],
			"id"	  : id
		},
		success : function(data){
			if(data != undefined){
				swal("비밀번호가 수정되었습니다.");
			}else{
				swal("다시 시도 해주시기 바랍니다.");
			}
			console.log(data + "성공")
		}
	})
}

</script>
</body>
</html>