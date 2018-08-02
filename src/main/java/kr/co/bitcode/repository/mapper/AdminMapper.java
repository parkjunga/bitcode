package kr.co.bitcode.repository.mapper;

import java.util.List;
import java.util.Map;

public interface AdminMapper {

	/** 총 Q&A 문의/답변 갯수 */
	public List<Map> selectAllCnt ();
	
	/*  불만족*/
	public int unstsfCount ();
	
	/*  보통*/
	public int MidstsfCount ();
	/*  만족*/
	public int stsfCount ();	
}
