package kr.co.bitcode.repository.domain;


public class Remote {

	private String id;
	private String nickName;
	private String question;
	private String link;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	@Override
	public String toString() {
		return "Remote [id=" + id + ", nickName=" + nickName + ", question=" + question + ", link=" + link + "]";
	}
	
}
