package kr.co.bitcode.repository.domain;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Qna {
	private int no;
	private String nickName;
	private int groupNo;
	private int groupOrder;
	private int depth;
	private String id;
	private String title;
	private String content;
	private Date regDate;
	private int viewCnt;
	private String code;
	private String codeName;
	private String answerAt;
	private char readAns;
	private String oriId;
	private int point;
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getOriId() {
		return oriId;
	}
	public void setOriId(String oriId) {
		this.oriId = oriId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public char getReadAns() {
		return readAns;
	}
	public void setReadAns(char readAns) {
		this.readAns = readAns;
	}
	private String language_code;
	
	
	

	public String getAnswerAt() {
		return answerAt;
	}
	public void setAnswerAt(String answerAt) {
		this.answerAt = answerAt;
	}
	public String getLanguage_code() {
		return language_code;
	}
	public void setLanguage_code(String language_code) {
		this.language_code = language_code;
	}
	private List<QnaFile> fileList;

	public List<QnaFile> getFileList() {
		return fileList;
	}
	public void setFileList(List<QnaFile> fileList) {
		this.fileList = fileList;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	private int likeCnt;
	private String stsfcCode;
	private MultipartFile[] file;
	public MultipartFile[] getFile() {
		return file;
	}
	public void setFile(MultipartFile[] file) {
		this.file = file;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getGroupOrder() {
		return groupOrder;
	}
	public void setGroupOrder(int groupOrder) {
		this.groupOrder = groupOrder;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getStsfcCode() {
		return stsfcCode;
	}
	public void setStsfcCode(String stsfcCode) {
		this.stsfcCode = stsfcCode;
	}

}
