package kr.co.bitcode.folder.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import kr.co.bitcode.repository.domain.DownloadFile;
import kr.co.bitcode.repository.domain.FancyTree;
import kr.co.bitcode.repository.domain.FolderAndFile;

public interface FolderService {
	
	//
	/**
	 * @param id
	 * @return
	 */
	public Map<String, Object> selectFolderById(String id);
	public List<FancyTree> createFolder(FolderAndFile faf);
	public Map<String, Object> contextFolder(FolderAndFile faf);
	public Map<String, Object> delete(FolderAndFile faf);
	public List<FancyTree> enterDirectory(FolderAndFile faf);
	public List<FancyTree> lazyLoad(FolderAndFile faf);
	public Map<String, Object> uploadFile(FolderAndFile faf, MultipartFile attach);
	public List<FancyTree> musicFolder(FolderAndFile faf);
	
}
