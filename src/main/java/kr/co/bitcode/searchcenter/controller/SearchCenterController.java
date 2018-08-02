package kr.co.bitcode.searchcenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/searchcenter")
public class SearchCenterController {
	
	@RequestMapping(value="/searchCenter.do", method=RequestMethod.GET)
	public String searchcenter() {
		return "searchcenter/searchCenter";
	}
}
