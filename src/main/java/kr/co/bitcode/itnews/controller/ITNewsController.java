package kr.co.bitcode.itnews.controller;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcode.itnews.service.ITService;
import kr.co.bitcode.repository.domain.Article;
import kr.co.bitcode.repository.domain.NewsComment;
import kr.co.bitcode.repository.domain.PageITNews;
import kr.co.bitcode.repository.domain.Search;

@Controller
@RequestMapping("/itnews")
public class ITNewsController {
	
	@Autowired
	private ITService iTService;
	
	@RequestMapping("/list.do")
	public String listBoard() throws Exception {
		return "itnews/list";
	}
	
	// IT 뉴스 출력하기
	@RequestMapping("/list.json")
	@ResponseBody
	public Map<String,Object> newsList(PageITNews pageITNews) throws Exception {
		return iTService.selectITNews(pageITNews);
	}
	//IT 상세페이지 출력
	@RequestMapping("/itnewsDetail.do") 
	public ModelAndView itnewsDetail(int articleNo) { 
		ModelAndView mav = new ModelAndView();
		Article article = iTService.selectITNewsByNo(articleNo);
		mav.setViewName("itnews/detail");
		mav.addObject("article", article);
		return mav;
	} 
//	(value = "/naver.do", method = { RequestMethod.GET})
	//댓글 출력
	@RequestMapping("/commentList.json")
	public @ResponseBody List<NewsComment> retrieveListComment(int articleNo) {
		
		return iTService.retrieveListComment(articleNo);
	}
	//댓글 입력
//	int commentNo = 0;
	@RequestMapping("/commentWrite.json")
	public @ResponseBody List<NewsComment> writeComment(NewsComment newsComment) {
//		commentNo++;
//		newsComment.setCommentNo(commentNo);
//		System.out.println("newsComment:" + newsComment.getCommentNo());
		iTService.insertArticleComment(newsComment);
		return iTService.retrieveListComment(newsComment.getArticleNo());
	}
	
	@RequestMapping("/commentUpdate.json")
	public @ResponseBody List<NewsComment> updateComment(NewsComment newsComment) {
		iTService.updateArticleComment(newsComment);
		return iTService.retrieveListComment(newsComment.getArticleNo());
	}	
	
	@RequestMapping("/commentDelete.json")
	public @ResponseBody List<NewsComment> deleteComment(NewsComment newsComment) {
		iTService.deleteArticleComment(newsComment.getCommentNo());    
		return iTService.retrieveListComment(newsComment.getArticleNo());
	}
}
