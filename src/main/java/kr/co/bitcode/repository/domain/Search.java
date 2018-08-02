package kr.co.bitcode.repository.domain;

public class Search {
	private String type;
	private String keyword; 
	private String title;
	private String content;
	private int sort;
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}

	private int pageNo = 1;
	public static void main(String[] args) {
		Page p = new Page();
		p.setPageNo(1);
		
		System.out.println(p.getBegin());
		System.out.println(p.getEnd());
	}
	
	private int listSize = 5; // 쿼리에서 LIMIT #{begin},10  숫자변경시 같이 변경해야됨 
	public int getBegin() {
		// 10이 listSize
		//      1-1 * 10
		return (pageNo -1) * listSize ; //한 탭에 맨첨번호
	} // 규칙을 찾음 . 시작 
	public int getEnd() {
		// 10이 listSize
		
		return pageNo * listSize + 1; //한 탭에 맨 마지막번호 // limit
//		return pageNo * listSize; //한 탭에 맨 마지막번호
	} // 페이지 끝
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


}
