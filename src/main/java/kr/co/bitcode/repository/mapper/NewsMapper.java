package kr.co.bitcode.repository.mapper;

import java.util.List;


import kr.co.bitcode.repository.domain.Article;
import kr.co.bitcode.repository.domain.NewsComment;
import kr.co.bitcode.repository.domain.PageITNews;

public interface NewsMapper {
	//for Paging Count
	int selectPagingCount ();
	// 기사 리스트 출력 & 페이징
	public List<Article> selectITNews(PageITNews page);
	// 기사 크롤링후 DB 저장
	public void insertNews(Article article);
	// 기사 번호로 select 출력하기
	public Article selectITNewsByNo(int articleNo);
	//댓글출력
	public List<NewsComment> selectCommByArticleNo(int articleNo);
	//댓글 입력
	public void insertArticleComment(NewsComment newsComment);
	//댓글 수정
	public void updateArticleComment(NewsComment newsComment);
	//댓글 삭제
	public void deleteArticleComment(int commentNo);
	
}
