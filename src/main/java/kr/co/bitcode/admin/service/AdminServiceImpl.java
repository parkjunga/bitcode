package kr.co.bitcode.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.plaf.synth.SynthToggleButtonUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.mapper.AdminMapper;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;

	/** 총 Q&A 문의/답변 갯수 */
	public List<Map> answerCnt() {
		List<Map> result = mapper.selectAllCnt();
		return result;
	}

	
	public Map<String, Integer> stsDou() {
		Map<String, Integer> map= new HashMap<>();
		int unstsfCount = mapper.unstsfCount();
		int midstsfCount=mapper.MidstsfCount();
		int stsfCount = mapper.stsfCount();
		
		
		map.put("unstsfCount", unstsfCount);
		map.put("midstsfCount", midstsfCount);
		map.put("stsfCount", stsfCount);
		
		return map;
	}
	
}
