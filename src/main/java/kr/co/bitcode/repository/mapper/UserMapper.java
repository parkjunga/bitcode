package kr.co.bitcode.repository.mapper;

import java.util.List;

import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.User;

public interface UserMapper {
	//ID로 회원정보 찾기 
	public User selectUserById (String id) throws Exception;
	//회원가입
	public void insertUser(User user) throws Exception;
	
	//ID 찾기
	public User selectUserByNameEmail(User user) throws Exception;
	
	//유저정보 수정
	public void updateUser(User user) throws Exception;
	
	public void updateEmail(User user) throws Exception;
	
	public void updateNick(User user) throws Exception;
	
	//비번수정하기
	public void updateUserPass (User user) throws Exception;
	//모든 유저들 List뽑기
	public List<User> selectAllUser() throws Exception;
	
	//이메일 인증 위해 ID 와 Email 매칭 유저 찾기
	public User selectbyIdEmail(User user) throws Exception;
	
	
	
	

	
	

	
}
