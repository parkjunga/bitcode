package kr.co.bitcode.repository.domain;

public class Page {
	public static void main(String[] args) {
		Page p = new Page();
		p.setPageNo(1);
		
		System.out.println(p.getBegin());
		System.out.println(p.getEnd());
	}
	private int pageNo = 1; 
	
	private int listSize = 10; // 쿼리에서 LIMIT #{begin},10  숫자변경시 같이 변경해야됨 
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
}
