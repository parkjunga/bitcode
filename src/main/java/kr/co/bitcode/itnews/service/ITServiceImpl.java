package kr.co.bitcode.itnews.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.domain.Article;
import kr.co.bitcode.repository.domain.NewsComment;
import kr.co.bitcode.repository.domain.PageITNews;
import kr.co.bitcode.repository.domain.PageResultITNews;
import kr.co.bitcode.repository.mapper.NewsMapper;

@Service("ITService")
public class ITServiceImpl implements ITService{
	
	@Autowired
	private NewsMapper mapper;
	

	@Override
	public Map<String,Object> selectITNews(PageITNews pageITNews) {
		Map<String,Object> map = new HashMap<>();
		map.put("list", mapper.selectITNews(pageITNews));
		map.put("PageResultITNews", new PageResultITNews(pageITNews.getPageNo(),mapper.selectPagingCount()));
		List<Article> list= mapper.selectITNews(pageITNews);
		for(Article article : list) {
			System.out.println("article" + article.getArticleNo());
		}
		System.out.println("pageITNews" + pageITNews.getBegin());
		System.out.println("pageITNews" + pageITNews.getEnd());
		System.out.println("pageITNews" + pageITNews.getPageNo());
		return map;
	}
	@Override
	public Article selectITNewsByNo(int articleNo) {
		return mapper.selectITNewsByNo(articleNo);
	}
	
	//댓글파트
	
	//댓글 리스트
	@Override
	public List<NewsComment> retrieveListComment(int articleNo) {
		return mapper.selectCommByArticleNo(articleNo);
	}
	//댓글 입력
	@Override
	public void insertArticleComment(NewsComment newsComment) {
		mapper.insertArticleComment(newsComment);
	}
	//댓글 수정
	@Override
	public void updateArticleComment(NewsComment newsComment) {
		mapper.updateArticleComment(newsComment);
	}
	//댓글 삭제
	@Override
	public void deleteArticleComment(int commentNo) {
		mapper.deleteArticleComment(commentNo);
	}



}
