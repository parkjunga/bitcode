package kr.co.bitcode.crawling.service;

import java.util.List;

import kr.co.bitcode.repository.domain.Article;

public interface CrawlingService {
	public void insertArticle(List<Article> a);
}
