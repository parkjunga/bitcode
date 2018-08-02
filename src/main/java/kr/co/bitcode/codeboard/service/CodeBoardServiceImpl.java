package kr.co.bitcode.codeboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.CodeBoard;
import kr.co.bitcode.repository.domain.CodeBoardFile;
import kr.co.bitcode.repository.domain.CodeBoardLike;
import kr.co.bitcode.repository.domain.CodeComment;
import kr.co.bitcode.repository.domain.CodeSearch;
import kr.co.bitcode.repository.domain.Page;
import kr.co.bitcode.repository.domain.PageResult;
import kr.co.bitcode.repository.domain.QnaComment;
import kr.co.bitcode.repository.domain.User;
import kr.co.bitcode.repository.mapper.CodeBoardMapper;
import kr.co.bitcode.repository.mapper.CodeListMapper;

@Service("CodeBoardService")
public class CodeBoardServiceImpl implements CodeBoardService{
	@Autowired
	private CodeBoardMapper mapper;
	private CodeListMapper Cmapper;
	
	@Override
	public CodeBoard selectBoardByNo(int no) {
		return mapper.selectBoardByNo(no);
	}
	
	@Override
	public void insertBoard(CodeBoard cb) {
		mapper.insertBoard(cb);
	}

	@Override
	public void updateBoard(CodeBoard cb) {
		mapper.updateBoard(cb);
	}

	@Override
	public void deleteBoard(int no) {
		mapper.deleteBoard(no);
	}

	@Override
	public void updateBoardViewCnt(int no) {
		mapper.updateBoardViewCnt(no);
	}

	@Override
	public List<Code> selectLanguage() {
		List<Code> list = Cmapper.selectLanguage();
		return list;
	}

	@Override
	public List<CodeBoardFile> selectBoardFileByNo(int no) {
		return mapper.selectBoardFileByNo(no);
	}

	@Override
	public void insertBoardFile(CodeBoardFile cbFile) {
		mapper.insertBoardFile(cbFile);
	}

	@Override
	public void replyBoard(CodeBoard cb) {
		mapper.updateGroupOrder(cb);
		mapper.replyBoard(cb);
		
	}

	@Override
	public void updateGroupNo(int no) {
		mapper.updateGroupNo(no);
		
	}

	@Override
	public Map<String, Object> boardListInfo(CodeSearch cs) {
		int pageNo = cs.getPageNo();
		Page search = new Page();
		search.setPageNo(pageNo != -1 ? pageNo : 1);
		cs.setBegin(search.getBegin());
		cs.setEnd(search.getEnd());
		System.out.println(cs.getPageNo());
//		System.out.println(mapper.boardCount(cs));
//		int count = mapper.boardCount(cs);
		Map<String,Object> map = new HashMap<>();
		map.put("searchInput", cs.getSearchInput());
		map.put("searchOption", cs.getSearchOption());
		map.put("list", mapper.selectBoard(cs));
		map.put("pageResult",new PageResult(cs.getPageNo(), mapper.boardCount(cs)));		
		return map;
	}

	@Override
	public int likeBoard(CodeBoardLike cbl,User user) {		
		
		if(mapper.selectCodeLike(cbl).size() != 0) { // 추천 안됨
			return 0;
		}else{
			mapper.insertCodeLike(cbl);
			mapper.updateBoardLikeCnt(cbl.getNo());	
			user.setId(cbl.getOriId());
			mapper.updatePoint(user);
			return mapper.selectBoardByNo(cbl.getNo()).getLikeCnt();
		}
	}

	@Override
	public List<CodeComment> commentRegist(CodeComment comment) throws Exception {
		mapper.insertComment(comment);
		return mapper.selectComment(comment.getNo());
	}


	@Override
	public List<CodeComment> commentUpdate(CodeComment comment) throws Exception {
		mapper.updateComment(comment);
		return mapper.selectComment(comment.getNo()); 
	}

	@Override
	public List<CodeComment> commentDelete(CodeComment comment) throws Exception {
		mapper.deleteComment(comment.getCommentNo());
		return mapper.selectComment(comment.getNo());
	}

	@Override
	public List<CodeComment> commentList(int no) throws Exception {
		return mapper.selectComment(no);
	}

	@Override
	public void updatePoint(User user) {
		mapper.updatePoint(user);
		
	}	

}
