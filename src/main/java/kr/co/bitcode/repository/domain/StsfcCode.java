package kr.co.bitcode.repository.domain;

/**
 * @author Jiyeon
 *
 */
public class StsfcCode {
	 private char stsfcCode;
	 private String stsfcStep;
	 private int no;
	 private String id;
	 private String title;
	 
	
	 public char getStsfcCode() {
		return stsfcCode;
	}
	public void setStsfcCode(char stsfcCode) {
		this.stsfcCode = stsfcCode;
	}
	public String getStsfcStep() {
		return stsfcStep;
	}
	public void setStsfcStep(String stsfcStep) {
		this.stsfcStep = stsfcStep;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	 
 
}
