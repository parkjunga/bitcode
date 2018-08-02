package kr.co.bitcode.crawling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.domain.Article;
import kr.co.bitcode.repository.mapper.NewsMapper;

@Service("crawlingService")
public class CrawlingServiceImpl implements CrawlingService{

	@Autowired
	private NewsMapper mapper;
	@Override
	public void insertArticle(List<Article> a) {
		System.out.println(a.size());
		System.out.println(a.get(0).getArticleNo());
		System.out.println(a.get(0).getArticleContent());
		System.out.println(a.get(0).getArticleDate());
		System.out.println(a.get(0).getArticleReporter());
		System.out.println(a.get(0).getArticleSummary());
		System.out.println(a.get(0).getArticleThumb());
		System.out.println(a.get(0).getArticleType());
		System.out.println(a.get(0).getArticleTitle());
		for (Article article : a) {
			mapper.insertNews(article);
		}
	}
	
	
	
}
