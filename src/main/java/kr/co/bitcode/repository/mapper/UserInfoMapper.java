package kr.co.bitcode.repository.mapper;



import java.util.List;


import kr.co.bitcode.repository.domain.Attendance;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.StsfcCode;

public interface UserInfoMapper {
	//유저 질문 목록
//	public List<Qna> selectmyQuestion(String id) throws Exception;
	
	//출석체크
	public void insertAttendance(Attendance attend) throws Exception;
	//출석체크
	public List<Attendance> selectAttendance(String id) throws Exception;
	//현재날짜 중복체크
	public Attendance selectAttenByIdDate(Attendance attendance) throws Exception;
	//출석시 포인트 업뎃
	public void updateUserPoint(String id) throws Exception;
	
	//만족
	List<StsfcCode> selectmyQuestion(String id) throws Exception;
	//만족
	public void updateSatisfAnat(Qna qna) throws Exception;
	//user
	public Qna checkSatis(Qna qna) throws Exception;
	//admin
	public Qna checkSatisAdmin(Qna qna) throws Exception;
	
	
	
	
	public List<Qna> selectIdAnswer(String id) throws Exception;
	
	
	public List<Qna> selectSatisAdmin() throws Exception;
	
}



