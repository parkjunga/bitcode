package kr.co.bitcode.websocket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.User;
import kr.co.bitcode.repository.mapper.QnaMapper;
 
@Component("websocket")
public class WebsocketHandler extends TextWebSocketHandler {

	private Map<String, WebSocketSession> users = new HashMap<>();
	private Map<String, WebSocketSession> chatUsers = new HashMap<>();
	//private Map<String, Object> maps = new HashMap<>();
	
	@Autowired
	private QnaMapper mapper;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		User user = (User)session.getAttributes().get("user");
		users.put(user.getId(),session);
	}
	
	

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String reMsg = message.getPayload();
		//
		String rcvMsg = reMsg.split(":")[0];
		String rcvId = reMsg.split(":")[1];
		if(reMsg.startsWith("notice")) {
			System.out.println("메세지 잘 담겼는지 확인 " + reMsg);
			Set<String> keys = users.keySet();
			WebSocketSession rcvSession = users.get(rcvId);
			if(rcvSession != null) {
				List<Qna> qnaList = mapper.selectNotification(reMsg.split(":")[1]);
				System.out.println(qnaList.size() + "QnaList 갯수");
				String notReadText = "";
				List<Qna> readList = null;
				int notiCnt = 0;
				for (Qna qna : qnaList) {
					// 내가 쓴 글에 대한 게시글에 대한 답변수
					//List<Qna> ansList = mapper.selectNtf(qna.getGroupNo());
					
					// 내가 읽지않은 답변 수 
					readList = mapper.selectNoRead(qna.getGroupNo());
					
					// 사용자 질문에 대한 답변여부에 관한 리스트
					for (Qna read : readList) {
						System.out.println("------------------------------");
						System.out.println(qna.getNo()+"번글의 읽지않은 답변리스트:"+readList.size());
						System.out.println(qna.getNo()+"번글의 읽지않은 답변:" +read.getTitle());
						System.out.println("------------------------------");
						// 원글 쓴 사람에게만 답변갯수랑 읽은 갯수를 보냄.
						notiCnt++;
						if(read.getGroupNo() == qna.getNo()) {
							notReadText += qna.getNo() + "번글의" + read.getNickName() +"님의 답글을 읽지않았습니다.,";
						}
					}	
						
				} // QnaList 를 받음
				
				rcvSession.sendMessage( //noticeA : "1번글의 1개의 답글을 읽지않았습니다.," : 1
						new TextMessage("noticeA:" + notReadText + ":" + notiCnt)); 						
			
				// 유저정보
				User user = mapper.selectUserPoint(reMsg.split(":")[1]);
				rcvSession.sendMessage(new TextMessage("noticeB:"+ user.getNickName()+"님의 현재포인트는" + user.getPoint()+ "점입니다.")); 
				
				
			}
/*			for (String key : keys) {
				WebSocketSession wSession = users.get(key);
				System.out.println(wSession +"이거뭐야 ");
*/				// 로그인 한 아이디로 쓴 게시글 정보 
				
			
			// } 
			
			
		}
		
		else {
			// 채팅 부분
			if(reMsg.startsWith("in:")) {
				String[] inmsg = reMsg.split("in:");
				String a = "";
				for (String string : inmsg) {
					a += string;
				}
				String[] nick = a.split("님 입장");
				// 접속자리스트
//			Map<String, Object> attrs = session.getAttributes();
//			User u = (User)attrs.get("user");
				chatUsers.put(nick[0], session);
				System.out.println("------------------------------");
				System.out.println("접속한 사용자 관리 목록");
				System.out.println("------------------------------");		
				Set<String> chatKeys = chatUsers.keySet();
				String userList = "userList:";
				for(String key : chatKeys) {
					System.out.println(key);
					userList = userList + key + ":";			
				}
				
				for(String key : chatKeys) {
					WebSocketSession wss = chatUsers.get(key);
					wss.sendMessage(new TextMessage(userList));
				}
				
				System.out.println("------------------------------");		
				
			}
			else if(reMsg.startsWith("out:")) {
				String[] outmsg = reMsg.split("out:");
				String a = "";
				for (String string : outmsg) {
					a += string;
				}
				String[] nick = a.split("님 퇴장");
				chatUsers.remove(nick[0], session);
				Set<String> chatKeys = chatUsers.keySet();
				String userList = "userList:";
				for(String key : chatKeys) {
					System.out.println(key);
					userList = userList + key + ":";			
				}
				for(String key : chatKeys) {
					WebSocketSession wss = chatUsers.get(key);
					wss.sendMessage(new TextMessage(userList));
				}			
			}
			// 메세지
			System.out.println("보낸 아이디 : " + session.getId());
			System.out.println("보낸 메세지 : " + message.getPayload());		
			// 서버에 접속한 모든 사용자에게 메세지 전송하기
			Set<String> chatKeys = chatUsers.keySet();
			for(String key : chatKeys) {
				System.out.println(key);
				WebSocketSession wss = chatUsers.get(key);
				wss.sendMessage(
						new TextMessage(message.getPayload()));
			};		
			
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		User user = (User)session.getAttributes().get("user");
		users.remove(user.getId());
//		Map<String,Object> attr =  session.getAttributes();
//		System.out.println(attr.toString() +"맵정보");
//		User user = (User)attr.get("user");
//		System.out.println(user.getId() +"유저아이디" );
//		System.out.println(user.getName() +"이름");
//		users.remove(session);
		
		// 채팅 부분
		Map<String, Object> attrs = session.getAttributes();
		User u = (User)attrs.get("user");
		// 종료된 사용자 정보를 삭제
		chatUsers.remove(u.getNickName());	
	}	
}
