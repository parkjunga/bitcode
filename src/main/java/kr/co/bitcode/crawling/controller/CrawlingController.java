package kr.co.bitcode.crawling.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.bitcode.crawling.service.CrawlingService;
import kr.co.bitcode.repository.domain.Article;

@Controller
public class CrawlingController {
	
	@Autowired
	private CrawlingService crawlingService;
	
	private static List<Article> list;
	
	@RequestMapping("/crawling.do")
	public String mainCrawling(RedirectAttributes attr){
		System.setProperty("webdriver.chrome.driver", new File("C:\\java-lec\\chromedriver.exe").getAbsolutePath()); //크롬 드라이버 파일 경로설정
		WebDriver driver = new ChromeDriver();
		driver.get("http://www.hellodd.com/?md=news");
		driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS); //응답시간 5초설정
		String name = "";
		List<WebElement> list = driver.findElements(By.cssSelector("#list_area > ul > li"));
		List<Article> aList = new ArrayList<>();
		for (WebElement e : list) {
			Article a = new Article();
			String[] noArr = e.findElement(By.cssSelector("div.article > h3 > a")).getAttribute("href").split("pid=");
//			http://www.hellodd.com/?md=news&mt=view&pid=65534
//			Article no = mapper.selectArticleByNo(Integer.parseInt(noArr[1]));
//			System.out.println("dbno :  scrapno : " + noArr[1]);
			System.out.println("체크 시작!");
//			if (no == null) 
//			else continue;
			a.setArticleNo(Integer.parseInt(noArr[1]));
			System.out.println("널값 으로 else 건너뜀 VO에 데이터 저장 ");
			a.setArticleType("hellodd");
			a.setArticleTitle(e.findElement(By.tagName("h3")).getText());
			a.setArticleUrl(e.findElement(By.cssSelector("div.article > h3 > a")).getAttribute("href"));
			a.setArticleSummary(e.findElement(By.cssSelector("div.article > span > a")).getText());
			try {
				a.setArticleThumb(e.findElement(By.cssSelector("div.thumb > a > img")).getAttribute("src"));
			}catch (NoSuchElementException e1) {
				System.out.println("엘리먼트 못참음 썸네일 없음");
				a.setArticleThumb(" ");
			}
			name = e.findElement(By.cssSelector("div.article > p")).getText();
			String[] arr = name.split(" \\| ");
			SimpleDateFormat sd = new SimpleDateFormat("yyyy.MM.dd");
			if(arr.length == 2) {
				a.setArticleReporter(arr[0]);
				a.setArticleDate(arr[1]);
			}else {
				a.setArticleDate(arr[0]);
				a.setArticleReporter("hellodd");
			}
//			mapper.insertArticle(a);
//			System.out.println(a.toString());
			aList.add(a);
		}
//		웹드라이버 닫기
		driver.close();
//		attr.addFlashAttribute("aList", aList);
		CrawlingController.list = aList;
		return "redirect:subCrawling.do";
	}
	@RequestMapping("/subCrawling.do")
	public String subCrawling(){
		List<Article> aList = CrawlingController.list;
//		System.out.println(list.size());
		System.setProperty("webdriver.chrome.driver", "C:\\java-lec\\chromedriver.exe"); //크롬 드라이버 파일 경로설정
		WebDriver driver = new ChromeDriver();
		for (Article a : aList) {
//			System.out.println(a.getArticleTitle());
//			System.out.println(a.getArticleSummary());
			driver.get(a.getArticleUrl());
			driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS); //응답시간 5초설정
			String content = driver.findElement(By.cssSelector("#newsvw > div.article_body")).getText().trim();
			if(content.length() > 1100) a.setArticleContent(content.substring(0, 1100));
			else a.setArticleContent(content);
//			System.out.println(a.getArticleContent().length());
//			System.out.println(a.getArticleContent());
//			System.out.println(a.toString());
//			System.out.println("-------------------------------------------------------------------------------------");
		}
		driver.close();
		System.out.println(aList.size());
		crawlingService.insertArticle(aList);
		return "redirect:itnews/list.do";
	}

}
