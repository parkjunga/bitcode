package kr.co.bitcode.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bitcode.repository.domain.User;



@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/chat")
public class ChatController {
	
	@RequestMapping("/chat.do")
	public void chat() {
		
	}
	
//	@RequestMapping("/login.do")
//	@ResponseBody
//	public String login(HttpSession session, User u) {
//		session.setAttribute("user", u);
//		return "success";
//	}
//
//	@RequestMapping("/logout.do")
//	@ResponseBody
//	public String logout(HttpSession session) {
//		session.invalidate();
//		return "success";
//	}
}
