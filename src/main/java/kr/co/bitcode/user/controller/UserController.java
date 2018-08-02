package kr.co.bitcode.user.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import kr.co.bitcode.login.service.LoginService;
import kr.co.bitcode.repository.domain.Attendance;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.StsfcCode;
import kr.co.bitcode.repository.domain.User;
import kr.co.bitcode.user.service.UserService;


@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private LoginService loginService;
	
	
	// PassWord 암호화
	@Autowired
	BCryptPasswordEncoder passCode;
	
	
	// 게시판에서 만족클릭
	@RequestMapping("/satisAn.json")
	@ResponseBody
	public boolean satisAn (Qna qna) throws Exception {
		
		Qna user = userService.checkSatis(qna);
		Qna admin = userService.checkSatisAdmin(qna);
		
		if(user.getId().equals(qna.getId()) && admin.getStsfcCode() == null) {
			userService.updateSatisfAnat(qna);
			return true;
		}else {
			return false;
		}
	}
	
	
	//출석체크
	@RequestMapping("/attend.json")
	@ResponseBody
	public int attend(Attendance attendance) throws Exception {
		Attendance attend = new Attendance();
		Attendance attenTodayUser = userService.selectAttenByIdDate(attendance);
		if(attenTodayUser != null) {
			return 2;
		}else {
			//디비 저장
			attend.setAttDate(attendance.getAttDate());
			attend.setId(attendance.getId());
			userService.updateUserPoint(attendance.getId());
			userService.insertAttendance(attend);
			return 1;
		}
		
	}
	@RequestMapping("/updateAttend.do")
	public ModelAndView updateAttend(String id) throws Exception {
		ModelAndView mav = new ModelAndView();
		//한 유저에 대한 질문 List 출력
		List<StsfcCode> qnaList= userService.selectmyQuestion(id);
		// 유저 등급및 포인트 출력
		User userInfo = loginService.selectUserById(id);
		//출첵
		List<Attendance> attendList =  userService.selectAttendance(id);
		mav.setViewName("user/userInfo");
		mav.addObject("qnaList", qnaList);
		mav.addObject("userInfo", userInfo);
		mav.addObject("attendList", attendList);
		return mav;
	}
	//회원정보
	@RequestMapping("/userInfo.do") 	
	public ModelAndView joinForm(String id) throws Exception{ 
		ModelAndView mav = new ModelAndView();
		//한 유저에 대한 질문 List 출력
//		List<StsfcCode> qnaList= userService.selectmyQuestion(id);
		Map<String, Object> qnaList = userService.selectIdAnswer(id);
		// 유저 등급및 포인트 출력
		User userInfo = loginService.selectUserById(id);
		//생년월일 3칸에 나누어서 출력
		String birth = userInfo.getBirthday();
		String yearId1 = birth.substring(0, 4);
		
		String monthId1 =birth.substring(4, 6);
		String dateId1 =birth.substring(6);
		//출첵
		List<Attendance> attendList =  userService.selectAttendance(id);
		mav.setViewName("user/userInfo");
		mav.addObject("qnaList", qnaList);
		mav.addObject("userInfo", userInfo);
		mav.addObject("attendList", attendList);
		mav.addObject("yearId1",yearId1);
		mav.addObject("monthId1", monthId1);
		mav.addObject("dateId1", dateId1);
		return mav;
	} 
	//수정 클릭시
//	@RequestMapping("/updateUserForm.do") 
//	public ModelAndView updateUserForm(String id) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		User userInfo = loginService.selectUserById(id);
//		//생년월일 3칸에 나누어서 출력
//		String birth = userInfo.getBirthday();
//		String yearId1 = birth.substring(0, 4);
//		String monthId1 =birth.substring(4, 6);
//		String dateId1 =birth.substring(6);
//		mav.setViewName("user/userUpdate");
//		mav.addObject("yearId1",yearId1);
//		mav.addObject("monthId1", monthId1);
//		mav.addObject("dateId1", dateId1);
//		return mav;
//	} 
	//email 수정
	@RequestMapping("/updateEmailForm.json") 
	public @ResponseBody boolean updateEmailForm(User user, HttpSession session) throws Exception { 
		List<User> list = loginService.selectAllUser();
		for (User users : list) {
			if(user.getEmail().equals(users.getEmail())) {
				return true;
			}
		}
		userService.updateEmail(user);
		User userInfo = loginService.selectUserById(user.getId());	
		session.setAttribute("user", userInfo);
		return false;
	} 
	//닉네임 수정 중복 체크
	@RequestMapping("/updateNickCheck.json") 
	public @ResponseBody boolean signUpNickCheck(User user, HttpSession session) throws Exception { 
		List<User> list = loginService.selectAllUser();
		for (User users : list) {
			if(user.getNickName().equals(users.getNickName())) {
				return true;
			}
		}
		userService.updateNick(user);
		User userInfo = loginService.selectUserById(user.getId());	
		session.setAttribute("user", userInfo);
		return false;
	} 	
	
	
	//비번수정 JSON
	@RequestMapping("/updatePassForm.json") 
	@ResponseBody
	public User updatePassForm(User user, HttpSession session)  throws Exception{ 
		user.setPassword(passCode.encode(user.getPassword()));
		userService.updateUserPass(user);
		User userInfo = loginService.selectUserById(user.getId());	
		session.setAttribute("user", userInfo);
		
		return user;
	} 
	//email 체크
	@RequestMapping("/emailCheck.json") 
	public @ResponseBody boolean emailCheck(User user) throws Exception { 
		List<User> list = loginService.selectAllUser();
		for (User users : list) {
			if(user.getEmail().equals(users.getEmail())) {
				return true;
			}
		}
		return false;
	} 	
	
	@RequestMapping("/pattern.do") 
	public void pattern() { }
	
	
}
