package kr.co.bitcode.repository.domain;

public class User {
	private String id;
	private String name;
	private String nickName;
	private String password;
	private int patternPass;
	private String email;
	private String birthday;
	private int point;
	private String auth;
	
	
	public int getPatternPass() {
		return patternPass;
	}
	public void setPatternPass(int patternPass) {
		this.patternPass = patternPass;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", nickName=" + nickName + ", password=" + password
				+ ", patternPass=" + patternPass + ", email=" + email + ", birthday=" + birthday + ", point=" + point
				+ ", auth=" + auth + "]";
	}
}
