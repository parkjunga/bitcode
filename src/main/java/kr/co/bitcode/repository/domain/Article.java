package kr.co.bitcode.repository.domain;

public class Article {
	
	private int articleNo;
	private String articleType;
	private String articleTitle;
	private String articleSummary;
	private String articleContent;
	private String articleReporter;
	private String articleThumb;
	private String articleUrl;
	private String articleDate;
	
	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	public String getArticleType() {
		return articleType;
	}
	public void setArticleType(String articleType) {
		this.articleType = articleType;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public String getArticleSummary() {
		return articleSummary;
	}
	public void setArticleSummary(String articleSummary) {
		this.articleSummary = articleSummary;
	}
	public String getArticleContent() {
		return articleContent;
	}
	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}
	public String getArticleReporter() {
		return articleReporter;
	}
	public void setArticleReporter(String articleReporter) {
		this.articleReporter = articleReporter;
	}
	public String getArticleThumb() {
		return articleThumb;
	}
	public void setArticleThumb(String articleThumb) {
		this.articleThumb = articleThumb;
	}
	public String getArticleUrl() {
		return articleUrl;
	}
	public void setArticleUrl(String articleUrl) {
		this.articleUrl = articleUrl;
	}
	public String getArticleDate() {
		return articleDate;
	}
	public void setArticleDate(String articleDate) {
		this.articleDate = articleDate;
	}
	
}
