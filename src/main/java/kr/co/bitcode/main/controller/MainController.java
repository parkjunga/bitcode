package kr.co.bitcode.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/main")
public class MainController {
	
	@RequestMapping("/main.do")
	public void main(Model model) {
		
	}
}
