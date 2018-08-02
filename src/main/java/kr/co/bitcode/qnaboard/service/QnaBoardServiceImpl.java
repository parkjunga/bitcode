package kr.co.bitcode.qnaboard.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.PageResult;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.QnaComment;
import kr.co.bitcode.repository.domain.QnaFile;
import kr.co.bitcode.repository.domain.QnaLike;
import kr.co.bitcode.repository.domain.Search;
import kr.co.bitcode.repository.domain.User;
import kr.co.bitcode.repository.mapper.CodeListMapper;
import kr.co.bitcode.repository.mapper.QnaMapper;

@Service("QnaBoardService")
public class QnaBoardServiceImpl implements QnaBoardService {
	
	@Autowired
	private QnaMapper mapper;
	
	@Autowired
	private CodeListMapper Cmapper;

	@Override
	public void insertQna(Qna qna, QnaFile qnafile,User user) throws Exception {
		mapper.insertBoard(qna);
		mapper.updateGroupNo(qna.getNo());
		if(qna.getFile()[0].getSize() == 0) {
			System.out.println("파일없음");
		}else {
		for(MultipartFile file:qna.getFile()) {
		file.transferTo(new File("c:/java-lec/upload/"+file.getOriginalFilename()));
		qnafile.setNo(qna.getNo());
		qnafile.setFilePath("c:/java-lec/upload/"+file.getOriginalFilename());
		qnafile.setOriName(file.getOriginalFilename());
		qnafile.setSystemName(file.getName());
		qnafile.setFileSize((int)file.getSize());	
		mapper.insertQnaFile(qnafile);}
		} 	
		mapper.deletePoint(user);
	}

	@Override
	public List<Code> selectLanguage() throws Exception {
		List<Code> list = Cmapper.selectLanguage();
		return list;
	}

	@Override
	public Map<String,Object> detailQna(int no) throws Exception {
		mapper.updateViewCnt(no);
		Map<String,Object> map= new HashMap<>();
		Qna qna = mapper.selectBoardByNo(no);
		// 개행문자 처리
		qna.setContent(qna.getContent().replace("\r\n", "<br>"));
		qna.setFileList(mapper.selectQnaFile(no));
		map.put("qna", qna);
		map.put("ori", mapper.selectBoardByNo(qna.getGroupNo()).getId());
		// 게시판 읽었을 경우 Y로 변경되게
		mapper.readQna(qna);
		mapper.updateReadAns(qna);
		return map;
	}
	@Override
	public void delete(int no) throws Exception {
		mapper.deleteBoard(no);
		System.out.println(no +"삭제할 번호");
		System.out.println("삭제확인");
		mapper.deleteQnaFile(no);
	}

	@Override
	public void updateQna(Qna qna, QnaFile qnafile) throws Exception {
		//mapper.updateReBoard(qna.getNo());
		mapper.updateBoard(qna);
		mapper.deleteQnaFile(qna.getNo());
		if(qna.getFile()[0].getSize() == 0) {
			System.out.println("파일없음");
		}else {
		for(MultipartFile file:qna.getFile()) {
		file.transferTo(new File("c:/java-lec/upload/"+file.getOriginalFilename()));
		qnafile.setNo(qna.getNo());
		qnafile.setFilePath("c:/java-lec/upload/"+file.getOriginalFilename());
		qnafile.setOriName(file.getOriginalFilename());
		qnafile.setSystemName(file.getName());
		qnafile.setFileSize((int)file.getSize());	
		mapper.insertQnaFile(qnafile);
		}
		} 	
	}

	@Override
	public void updateQnaView(int no) throws Exception {
		mapper.selectBoardByNo(no);
		mapper.selectQnaFileByNo(no);		
	}

	@Override
	public void insertReQna(Qna qna, QnaFile qnafile,User user) throws Exception {
		mapper.updateReBoard(qna);
		mapper.insertReBoard(qna);
		if(qna.getFile()[0].getSize() == 0) {
			System.out.println("파일없음");
		}else {
		for(MultipartFile file:qna.getFile()) {
		file.transferTo(new File("c:/java-lec/upload/"+file.getOriginalFilename()));
		qnafile.setNo(qna.getNo());
		qnafile.setFilePath("c:/java-lec/upload/"+file.getOriginalFilename());
		qnafile.setOriName(file.getOriginalFilename());
		qnafile.setSystemName(file.getName());
		qnafile.setFileSize((int)file.getSize());	
		mapper.updateQnaFile(qnafile);}
		}mapper.updateAnswerChange(qna.getNo());
		mapper.updatePoint(user);
	}

	@Override
	public Map<String,Object> list(Search search) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("list", mapper.selectBoardSearch(search));
		map.put("pageResult", new PageResult(search.getPageNo(),mapper.searchBoardCount(search)));
		List<Qna> list = mapper.selectBoardSearch(search);
		return map;
	
	}

	@Override
	public List<QnaComment> commentRegist(QnaComment comment, User user) throws Exception {
		// 댓글 입력함.
		mapper.insertComment(comment);
		// 댓글이 입력되면 포인트를 줘야됨.
		user.setId(comment.getId());
		mapper.updatePoint(user);
		return mapper.selectComment(comment.getNo());
	}


	@Override
	public List<QnaComment> commentUpdate(QnaComment comment) throws Exception {
		mapper.updateComment(comment);
		return mapper.selectComment(comment.getNo()); 
	}

	@Override
	public List<QnaComment> commentDelete(QnaComment comment) throws Exception {
		mapper.deleteComment(comment.getCommentNo());
		return mapper.selectComment(comment.getNo());
	}

	@Override
	public List<QnaComment> commentList(int no) throws Exception {
		return mapper.selectComment(no);
	}
	
	@Override
	public int updateQnaLike(QnaLike qnaLike,User user) throws Exception {
		List<QnaLike> list = mapper.selectLikeView(qnaLike);
			if(list.size() == 0) {
				mapper.insertLikeView(qnaLike);
				mapper.updateLikeCnt(qnaLike.getNo());
				user.setId(qnaLike.getOriId());
				mapper.updatePoint(user);
				return mapper.selectBoardByNo(qnaLike.getNo()).getLikeCnt();
			}else {
				return 0;
			}
			
   }
		
	
	
	
}