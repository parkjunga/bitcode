package kr.co.bitcode.repository.mapper;

import java.util.List;

import kr.co.bitcode.repository.domain.CodeBoard;
import kr.co.bitcode.repository.domain.CodeBoardFile;
import kr.co.bitcode.repository.domain.CodeBoardLike;
import kr.co.bitcode.repository.domain.CodeComment;
import kr.co.bitcode.repository.domain.CodeSearch;
import kr.co.bitcode.repository.domain.QnaComment;
import kr.co.bitcode.repository.domain.User;

public interface CodeBoardMapper {
	public List<CodeBoard> selectBoard(CodeSearch cs);
	public CodeBoard selectBoardByNo(int no);
	public void insertBoard(CodeBoard cb);
	public void updateBoard(CodeBoard cb);
	public void deleteBoard(int no);
	public void updateBoardViewCnt(int no);
	public List<CodeBoardFile> selectBoardFileByNo(int no);
	public void insertBoardFile(CodeBoardFile cbFile);
	public void updateGroupNo(int no);
	public void updateGroupOrder(CodeBoard cb);
	public void replyBoard(CodeBoard cb);
	public List<CodeBoardLike> selectCodeLike(CodeBoardLike cbl);
	public void insertCodeLike (CodeBoardLike cbl);
	public void updateBoardLikeCnt(int no);
	public int boardCount(CodeSearch cs);
	public void updatePoint(User user);
	
	// 댓글 
	public void insertComment(CodeComment comment);
	public void updateComment(CodeComment comment);
	public void deleteComment(int commentNo);
	public List<CodeComment> selectComment(int no);
}
