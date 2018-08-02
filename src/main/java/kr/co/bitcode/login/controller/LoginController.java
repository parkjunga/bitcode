package kr.co.bitcode.login.controller;



import java.io.File;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;

import kr.co.bitcode.login.service.LoginService;
import kr.co.bitcode.repository.domain.User;


@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/login")
public class LoginController {
	
	// PassWord 암호화
	@Autowired
	BCryptPasswordEncoder passCode;
	
	@Autowired
	private LoginService loginService;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}	
	
	//로그인 클릭시 
	@RequestMapping(value = "/loginForm.do",  method = { RequestMethod.GET})
	public String loginForm(Model model, HttpSession session) {
		//네이버 
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("naverurl", naverAuthUrl);
//		
		/* 생성한 인증 URL을 View로 전달 */
		return "login/loginForm";
	}
	
    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/naver.do", method = { RequestMethod.GET})
    public String navercallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws Exception {
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        
        Gson gson = new Gson();
        NaverVO vo = gson.fromJson(apiResult, NaverVO.class);
        NaverInfo info = vo.getResponse();
        String id= info.getId();
        
        User userInfo = loginService.selectUserById(id);
        if(userInfo != null) {
        	session.setAttribute("user", userInfo);
        	return "redirect:/main/main.do";
        }else {
        // 소셜 회원 폼으로 넘기기.	
		model.addAttribute("id", info.getId());
		model.addAttribute("email", info.getEmail());
		model.addAttribute("nickName", info.getName());
		model.addAttribute("nickName", info.getNickname());
        return "login/socialSignupform";
        }
    }	
	
	
	
	//카카오톡 로그인시 bitcode에 회원가입이 되어있는지 확인, 회원 가입 안되있으면정보추가 위해 소셜로그인폼으로 이동
	@RequestMapping("/kakaoForm.do") 
	public String kakaoForm(User user, Model model, HttpSession session) throws Exception { 
		User userinfo = loginService.selectUserById(user.getId());
		if(userinfo != null) {
			session.setAttribute("user", userinfo);
			session.setMaxInactiveInterval(60 * 60);
			return "redirect:/main/main.do";
		}
		model.addAttribute("id", user.getId());
		model.addAttribute("email", user.getEmail());
		model.addAttribute("nickName", user.getNickName());
		return "login/socialSignupform";
	} 
	
	//로그 아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/main.do";
	}	
	
	
	//카카오톡 ?????
//	@RequestMapping("/kakao.json") 
//	public @ResponseBody User kakao(User user, Model model) throws Exception { 
//		User users = loginService.selectUserById(user.getId());
//		System.out.println(user.getName());
//		System.out.println(user.getId());
//		System.out.println(user.getEmail());
//		return users;
//	} 
	
	//로그인 (ID, Pass 입력 후)
	@RequestMapping("/login.do")
	public String login(User user, HttpSession session,  RedirectAttributes attr) throws Exception{
		// 패턴값 들어왔을 때
		if(user.getPatternPass() != 0) {
			User userInfo = loginService.selectUserById(user.getId());
			if(userInfo != null && user.getPatternPass() == userInfo.getPatternPass()) {
				session.setAttribute("user", userInfo);
				session.setMaxInactiveInterval(60 * 60);
				return "redirect:/main/main.do";
			}else {
				attr.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치 하지 않습니다");
				return "redirect:/login/loginForm.do";
			}
		} // 패턴 입력 됬을때
		else {
			User userInfo = loginService.selectUserById(user.getId());
			if(userInfo != null && passCode.matches(user.getPassword(), userInfo.getPassword())) {
				session.setAttribute("user", userInfo);
				session.setMaxInactiveInterval(60 * 60);
				return "redirect:/main/main.do";
			}else {
				attr.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치 하지 않습니다");
				return "redirect:/login/loginForm.do";
			}
		} // 비밀번호 입력시

	}	

	//회원가입
	@RequestMapping("/signupForm.do") 
	public String signupForm() throws Exception{ 
		return "login/signupForm";
	} 
	
	//ID 중복 체크
	@RequestMapping("/signUpIdCheck.json") 
	public @ResponseBody boolean signUpForm(User user) throws Exception { 
		List<User> list = loginService.selectAllUser();
		for (User users : list) {
			if(user.getId().equals(users.getId())) {
				return true;
			}
		}
		return false;
	} 	
	
	//닉네임 중복 체크
	@RequestMapping("/signUpNickCheck.json") 
	public @ResponseBody boolean signUpNickCheck(User user) throws Exception { 
		List<User> list = loginService.selectAllUser();
		for (User users : list) {
			if(user.getNickName().equals(users.getNickName())) {
				return true;
			}
		}
		return false;
	} 		
	
	//email 중복 체크
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
	
	// 회원가입후 로그인화면 이동
	@RequestMapping("/signup.do") 
	public String signup(User user, RedirectAttributes attr, HttpSession session) throws Exception{ 
		 user.setPassword(passCode.encode(user.getPassword()));
		 loginService.insertMemberInfo(user);
		 new File("c:\\java-lec\\upload\\" + user.getId()).mkdirs();
		 attr.addFlashAttribute("msg", "회원가입이 되었습니다.");
		return "redirect:/login/loginForm.do";
		
	} 
	
	// ID찾기
	@RequestMapping("/fogetId.json") 
	@ResponseBody
	public User fogetId(User user,  RedirectAttributes attr) throws Exception { 
		User userInfo = loginService.selectUserByNameEmail(user);

		if(userInfo != null){
			return userInfo;
		}
		return null;
	}

	
}
