package kr.co.bitcode.mail.controller;

import javax.servlet.http.HttpSession;


import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bitcode.mail.service.MailService;
import kr.co.bitcode.repository.domain.User;
import kr.co.bitcode.user.service.UserService;

@Controller
@RequestMapping("/sendMail")
public class MailController {
	// PassWord 암호화
	@Autowired
	BCryptPasswordEncoder passCode;	
	
	@Autowired
	private UserService userservice;
	
	@Autowired
    private MailService mailService;	
	
	
    public void setUserService(UserService userService) {
        this.userservice = userService;
    }
 
    public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }
	
    @RequestMapping("/findPass.json")
    @ResponseBody
    public User findPass(User user, HttpSession session) throws Exception {
    	// id, email 통해 유저 정보 확인
    	User userInfo = userservice.selectbyIdEmail(user);
    	
    	if (userInfo != null) {
        	Random r = new Random();
        	StringBuffer buf =new StringBuffer();
        	for(int i = 0 ; i < 6 ; i++){
        		if(r.nextBoolean()){
        			buf.append((char)((int)(r.nextInt(26))+97));
        		}else{
        			buf.append((r.nextInt(10)));
        		}
        	}
        	String password = String.valueOf(buf);
//        	user.setPassword(password);
        	
        	StringBuilder sb = new StringBuilder();
        	String subject = "BIT CODE 임시 비밀번호 발급 안내 입니다.";
        	sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
        	sb.append("로그인 후 나의 회원정보 페이지에서 변경해주세요");
        	mailService.send(subject, sb.toString(), "bitcodeProject1@gmail.com", user.getEmail(), null);
        	
        	userInfo.setPassword(passCode.encode(password)); // 임시비밀번호 암호화 
        	userservice.updateUserPass(userInfo);; // 해당 유저의 비밀번호 db 변경
        	return userInfo;
        
        } else {
            return null;
        }
    }
    
    
    
}
