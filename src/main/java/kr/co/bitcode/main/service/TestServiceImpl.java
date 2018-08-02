package kr.co.bitcode.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.domain.Board;
import kr.co.bitcode.repository.mapper.TMapper;

@Service("testService")
public class TestServiceImpl implements TestService {
	
	@Autowired
	private TMapper mapper;

	@Override
	public List<Board> test() {
		return mapper.selectTest();
	}

}
