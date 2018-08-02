package kr.co.bitcode.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminService {
	
	/** 총 Q&A 문의/답변 갯수 */
	public List<Map> answerCnt();
	/*  만족률*/
	public Map<String, Integer> stsDou(); 

	
}
