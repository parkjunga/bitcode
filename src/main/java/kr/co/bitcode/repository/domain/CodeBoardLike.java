package kr.co.bitcode.repository.domain;

public class CodeBoardLike {
	private int likeNo;
	private int likeCheck;
	private int no;
	private String id;
	private String oriId;
	public String getOriId() {
		return oriId;
	}
	public void setOriId(String oriId) {
		this.oriId = oriId;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getLikeCheck() {
		return likeCheck;
	}
	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}
}
