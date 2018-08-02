package kr.co.bitcode.remote.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.mapper.RemoteMapper;

@Service
public class RemoteServiceImpl implements RemoteService {
	
	@Autowired
	private RemoteMapper mapper;

	
}
