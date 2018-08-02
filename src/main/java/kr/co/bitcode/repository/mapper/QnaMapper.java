package kr.co.bitcode.repository.mapper;

import java.util.List;

import kr.co.bitcode.repository.domain.Page;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.QnaComment;
import kr.co.bitcode.repository.domain.QnaFile;
import kr.co.bitcode.repository.domain.QnaLike;
import kr.co.bitcode.repository.domain.Search;
import kr.co.bitcode.repository.domain.User;

public interface QnaMapper {
	// 게시판 
	//public List<Qna> selectboard(Page page);
	public List<Qna> selectBoardSearch(Search search);
	public Qna selectBoardByNo(int no);
	public void insertBoard(Qna qna);
	public void updateGroupNo(int no);
	public void updateBoard(Qna qna);
	public void deleteBoard(int no);
	public void updateViewCnt(int no);
	public void updateLikeCnt(int no);
	
	// 좋아요 
	public List<QnaLike> selectLikeView(QnaLike qnaLike);
	public void insertLikeView(QnaLike qnaLike);
	
	// 답글 
	public void updateReBoard(Qna qna);
	public void updateAnswerChange(int no);
	public void insertReBoard(Qna qna);
	
	// 페이징
	public int searchBoardCount(Search search);
	//public int selectBoardCount(Page page);	
	
	// 댓글 
	public void insertComment(QnaComment comment);
	public void updateComment(QnaComment comment);
	public void deleteComment(int commentNo);
	public List<QnaComment> selectComment(int no);
	
	// 첨부파일 
	public void insertQnaFile(QnaFile qnafile);
	public void updateQnaFile(QnaFile qnafile);
	public List<Qna> selectQnaFileByNo(int no);
	public List<QnaFile> selectQnaFile(int no);
	public void deleteQnaFile(int no);
	
	// 포인트 증가여부 
	public void updatePoint(User user);
	public void deletePoint(User user);
	
	//알림
	public List<Qna> selectNotification(String id);
	//public List<Qna> selectNtf(int groupNo);
	public List<Qna> selectNoRead(int groupNo);
	public User selectUserPoint(String id);
	public Qna readQna(Qna qna);
	public void updateReadAns(Qna qna);
	
	
}
