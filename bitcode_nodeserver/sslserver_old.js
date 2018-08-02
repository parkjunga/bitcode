//ssl 인증서 적용 서버
const fs = require('fs');
var app = require('express')();
const options = {
		pfx: fs.readFileSync('c:/java-lec/ssl/bitcode.pfx')
};
var server = require('https').createServer(options, function(req, res) {
});
var io = require('socket.io')(server);


app.get('/', function(req, res) {
  res.header("Access-Control-Allow-Origin", "*");
  res.sendFile(__dirname + '/chat.html');
});

io.on("connection", function (socket) {
  console.log(socket.id);

  socket.on("join", function (data){
    socket.join("room" + data.roomid);
  })

  socket.on("msg", function (data) {
    // 개별통신 : 데이터를 보낸 사용자에게만 보내기
    // socket.emit("msg", data);
    io.sockets.in("room" + data.roomid).emit("msg")
    // server.socket으로 접속한 사용자 모두에게 데이터 전송
	  io.emit("msg", data);
    
    // 나를 제외한 접속자 모두에게
    // socket.broadcast.emit("msg", data);
  });
  
  socket.on('disconnect', function() {
    // 새로고침, 페이지 종료시 자동 emit 발생
	 console.log('연결 종료 : ' + socket.id);
  });
});

server.listen(10001, function() {
  console.log('SSL server listening on port 10001');
});