package kr.co.bitcode.login.service;

import java.util.List;

import kr.co.bitcode.repository.domain.User;

public interface LoginService {
	
	//ID 로 유저 정보 찾기
	public User selectUserById (String id) throws Exception;
	// 유저 회원가입
	public void insertMemberInfo(User user) throws Exception;
	//ID 찾기
	public User selectUserByNameEmail(User user) throws Exception;	
	//모든 유저들 List뽑기
	public List<User> selectAllUser() throws Exception;
	
	
	
	
	
}
