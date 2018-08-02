package kr.co.bitcode.qnaboard.service;

import java.util.List;
import java.util.Map;

import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.Page;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.QnaComment;
import kr.co.bitcode.repository.domain.QnaFile;
import kr.co.bitcode.repository.domain.QnaLike;
import kr.co.bitcode.repository.domain.Search;
import kr.co.bitcode.repository.domain.User;

public interface QnaBoardService {
	public void updateQna(Qna qna,QnaFile qnafile) throws Exception;
	public void updateQnaView(int no) throws Exception;
	public void insertQna(Qna qna,QnaFile qnafile,User user) throws Exception;
	public void delete(int no) throws Exception;
	Map<String,Object> detailQna(int no) throws Exception;
	public List<Code> selectLanguage() throws Exception;
	public Map<String,Object> list(Search search) throws Exception;
	
	// 답글
	public void insertReQna(Qna qna,QnaFile qnafile,User user) throws Exception;
	
	// 댓글
	public List<QnaComment> commentList(int no) throws Exception;
	public List<QnaComment> commentRegist(QnaComment comment, User user) throws Exception;
	public List<QnaComment> commentUpdate(QnaComment comment) throws Exception;
	public List<QnaComment> commentDelete(QnaComment comment) throws Exception;
	
	//좋아요 
	public int updateQnaLike(QnaLike qnaLike,User user) throws Exception;
}
