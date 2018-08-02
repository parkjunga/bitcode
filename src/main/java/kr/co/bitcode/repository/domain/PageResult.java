package kr.co.bitcode.repository.domain;

public class PageResult {
	private int listSize = 5;
	private int tabSize  = 10;
	private int pageNo;
	private int count;
	private int lastPage;
	private int beginPage;
	private int endPage; // 페이지마지막번호

	private boolean prev;
	private boolean next;

	public PageResult(int pageNo, int count) {
		this.count = count;
		this.pageNo = pageNo;
		init();
	}
	
	private void init() {
		
		lastPage = (int)Math.ceil(count / (double)listSize);
		
		// 현재 페이지에 해당하는 탭 위치, 탭 시작 페이지, 탭 끝 페이지, 이전.다음 페이지 존재 여부 
		int currTab   = (pageNo  -1) / tabSize + 1; // 나눈 나머지
		beginPage = (currTab -1) * tabSize + 1;  //한 탭에 맨첨번호
		endPage   = (currTab * tabSize < lastPage) ? currTab * tabSize : lastPage;
		        
		prev = beginPage != 1; 
		next = endPage != lastPage;
		
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getCount() {
		return count;
	}

	public int getLastPage() {
		return lastPage;
	}

	public int getTabSize() {
		return tabSize;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean getPrev() {
		return prev;
	}

	public boolean getNext() {
		return next;
	}
}
