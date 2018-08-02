package kr.co.bitcode.repository.domain;

import java.util.Date;

public class Attendance {
	//출석체크번호
	private int attID;
	//유저 아이디
	private String id;
	//출석체크한날
	private Date attDate;
	
	
	public int getAttID() {
		return attID;
	}
	public void setAttID(int attID) {
		this.attID = attID;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getAttDate() {
		return attDate;
	}
	public void setAttDate(Date attDate) {
		this.attDate = attDate;
	}
	
	
	
}
