package kr.co.bitcode.user.service;

import java.util.List;
import java.util.Map;

import kr.co.bitcode.repository.domain.Attendance;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.StsfcCode;
import kr.co.bitcode.repository.domain.User;

public interface UserService {
	//유저 기본정보 수정
	void updateUser(User user) throws Exception; 
	public void updateNick(User user) throws Exception;
	public void updateEmail(User user) throws Exception;
	
	//비번수정
	void updateUserPass (User user) throws Exception;
	
	// ID 와 Email 매칭 유저 찾기
	User selectbyIdEmail(User user) throws Exception;
	
	//유저 질문 목록@@@@@@@@@@@@@@
	List<StsfcCode> selectmyQuestion(String id) throws Exception;

	//출석체크
	void insertAttendance(Attendance attend) throws Exception;
	//출석체크
	List<Attendance> selectAttendance(String id) throws Exception;
	//출석시 포인트 업뎃
	public void updateUserPoint(String id) throws Exception;

	public Attendance selectAttenByIdDate(Attendance attendance) throws Exception;
	//만족
	public void updateSatisfAnat(Qna qna) throws Exception;
	
	
	public Qna checkSatis(Qna qna) throws Exception;
	//admin
	public Qna checkSatisAdmin(Qna qna) throws Exception;
	
	
	
	
	
	public Map<String,Object> selectIdAnswer(String id) throws Exception;
}
