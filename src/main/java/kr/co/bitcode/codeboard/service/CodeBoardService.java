package kr.co.bitcode.codeboard.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.CodeBoard;
import kr.co.bitcode.repository.domain.CodeBoardFile;
import kr.co.bitcode.repository.domain.CodeBoardLike;
import kr.co.bitcode.repository.domain.CodeComment;
import kr.co.bitcode.repository.domain.CodeSearch;
import kr.co.bitcode.repository.domain.QnaComment;
import kr.co.bitcode.repository.domain.User;

public interface CodeBoardService {
	public Map<String, Object> boardListInfo(CodeSearch cs);
	public CodeBoard selectBoardByNo(int no);
	public void insertBoard(CodeBoard cb);
	public void updateBoard(CodeBoard cb);
	public void deleteBoard(int no);
	public void updateBoardViewCnt(int no);
	public List<Code> selectLanguage();
	public List<CodeBoardFile> selectBoardFileByNo(int no);
	public void insertBoardFile(CodeBoardFile cbFile);
	public void replyBoard(CodeBoard cb);
	public void updateGroupNo(int no);
	public int likeBoard(CodeBoardLike cbl,User user);
	public void updatePoint(User user);
	
	// 댓글
	public List<CodeComment> commentList(int no) throws Exception;
	public List<CodeComment> commentRegist(CodeComment comment) throws Exception;
	public List<CodeComment> commentUpdate(CodeComment comment) throws Exception;
	public List<CodeComment> commentDelete(CodeComment comment) throws Exception;	
};
