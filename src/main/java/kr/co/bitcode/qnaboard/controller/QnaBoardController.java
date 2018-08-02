package kr.co.bitcode.qnaboard.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcode.qnaboard.service.QnaBoardService;
import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.QnaComment;
import kr.co.bitcode.repository.domain.QnaFile;
import kr.co.bitcode.repository.domain.QnaLike;
import kr.co.bitcode.repository.domain.Search;
import kr.co.bitcode.repository.domain.User;

@Controller
@RequestMapping("/qnaboard")
public class QnaBoardController {
	
	@Autowired
	private QnaBoardService qnaBoardService;
	
	@RequestMapping("/list.do")
	public void listBoard(Search search) throws Exception {	
	}
	
	@RequestMapping("/delete.do")
	public String delete(int no) throws Exception {
		qnaBoardService.delete(no);
		return "redirect:/qnaboard/list.do";
	}
	
	@RequestMapping("/detail.do")
	public ModelAndView viewDeatil(int no) throws Exception {
		ModelAndView mav = new ModelAndView("qnaboard/detail");
		mav.addObject("list", qnaBoardService.detailQna(no));
		return mav;
	}	
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String editQna(Qna qna,QnaFile qnafile,User user) throws Exception {
		qnaBoardService.insertQna(qna, qnafile, user);
		return "redirect:/qnaboard/list.do";
	}
	
	@RequestMapping(value="/insertForm.do", method=RequestMethod.GET)
	public void editQna() throws Exception {
	}
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String updateQna(Qna qna,QnaFile qnafile) throws Exception {
		qnaBoardService.updateQna(qna, qnafile);
		return "redirect:/qnaboard/list.do";
	}
	
	@RequestMapping(value="/updateForm.do", method=RequestMethod.GET)
	public String updateQna(int no,Model model) throws Exception {
		model.addAttribute("list", qnaBoardService.detailQna(no));
		return "qnaboard/updateForm";
	}
	
	@RequestMapping(value="/insertRe.do",method=RequestMethod.POST)
	public String editReQna(Qna qna,QnaFile qnafile,User user) throws Exception {
		qnaBoardService.insertReQna(qna, qnafile,user);
		return "redirect:/qnaboard/list.do";
	}
	
	@RequestMapping(value="/insertReForm.do", method=RequestMethod.GET)
	public String editReQna(int no,Model model) throws Exception{
		model.addAttribute("list", qnaBoardService.detailQna(no));
		return "qnaboard/insertReForm";
	}
	
	@RequestMapping("/selectLanguage.json")
	@ResponseBody
	public List<Code> selectLanguage() throws Exception{
		List<Code> list = qnaBoardService.selectLanguage();
		return list;
	}
	
	@RequestMapping("/list.json")
	@ResponseBody
	public Map<String,Object> list(Search search) throws Exception{
		System.out.println("12111111111 : ddddd");
		return qnaBoardService.list(search);
	}
	
	// 댓글 
	
	@RequestMapping("/commentList.json")
	@ResponseBody
	public List<QnaComment> commentList(int no) throws Exception{
		return qnaBoardService.commentList(no);
	}
	
	@RequestMapping("/commentRegist.json")
	@ResponseBody
	public List<QnaComment> commentRegist(QnaComment comment,User user) throws Exception{
		return qnaBoardService.commentRegist(comment,user);
	}
	
	@RequestMapping("/commentDelete.json")
	@ResponseBody
	public List<QnaComment> commentDelete(QnaComment comment) throws Exception {
		return qnaBoardService.commentDelete(comment);
	}
	
	@RequestMapping("/commentUpdate.json")
	@ResponseBody
	public List<QnaComment> commentUpdate(QnaComment comment) throws Exception {
		return qnaBoardService.commentUpdate(comment);
	}
	
	// 좋아요
	@RequestMapping("/likeUpdate.json")
	@ResponseBody
	public int insertQnaLike(QnaLike qnaLike,User user) throws Exception{
		return qnaBoardService.updateQnaLike(qnaLike,user);
	}
	
	
}
