package kr.co.bitcode.folder.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.co.bitcode.folder.service.FolderService;
import kr.co.bitcode.repository.domain.DownloadFile;
import kr.co.bitcode.repository.domain.FancyTree;
import kr.co.bitcode.repository.domain.FolderAndFile;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/main")
public class FolderController {

	@Autowired
	private FolderService folderService;
	
	@RequestMapping("/selectFolder.json")
	@ResponseBody
	public Map<String, Object> selectFolder(String id) {
		return folderService.selectFolderById(id);
	}
	
	@RequestMapping("/createFolder.json")
	@ResponseBody
	public List<FancyTree> createFolder(FolderAndFile faf) {
		//  폴더만 업로드 할 경우
		return folderService.createFolder(faf);
	}
	
	@RequestMapping("/contextFolder.json")
	@ResponseBody
	public Map<String, Object> contextFolder(FolderAndFile faf) {
		// 우클릭으로 폴더 추가시
		return folderService.contextFolder(faf);
	}
	
	@RequestMapping("/delete.json")
	@ResponseBody
	public Map<String, Object> delete(FolderAndFile faf) {
		// 폴더 & 파일 삭제
		return folderService.delete(faf);
	}
	
	@RequestMapping("/enterDirectory.json")
	@ResponseBody
	public List<FancyTree> enterDirectory(FolderAndFile faf){
		
		return folderService.enterDirectory(faf);
	}
	
	@RequestMapping("/lazyLoad.json")
	@ResponseBody
	public List<FancyTree> lazyLoad(FolderAndFile faf){
		return folderService.lazyLoad(faf);
	}
	
	@RequestMapping("/upload.json")
	@ResponseBody
	public Map<String, Object> upload(MultipartFile attach, FolderAndFile faf){
		return folderService.uploadFile(faf, attach);
	}
	
	/**
	 * @param faf
	 * @return
	 */
	@RequestMapping("/musicFolder.json")
	@ResponseBody
	public List<FancyTree> musicFolder(FolderAndFile faf){
		return folderService.musicFolder(faf);
	}
	
	
	
	@RequestMapping("/download.do")
	public void download(DownloadFile file, HttpServletResponse response) throws Exception{
		System.out.println(file.getPath());
		System.out.println(file.getFileName());
		File f = new File(file.getPath() + "\\" + file.getFileName());
		String dName = file.getFileName();
		response.setHeader("content-Type", "application/octet-stream");
		dName = new String(dName.getBytes("utf-8"), "8859_1");
		response.setHeader("content-Disposition", "attachment;filename="+dName);
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);
		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		while(true){
			int ch = bis.read();
			if (ch == -1) break;
			bos.write(ch);
		}
		bis.close();
		fis.close();
		bos.close();
		out.close();
	}
}


//@RequestMapping("/download.do")
//public void download(DownloadFile file, HttpServletResponse response) throws Exception{
//	System.out.println(file.getPath());
//	System.out.println(file.getFileName());
//	File f = new File(file.getPath() + "\\" + file.getFileName());
//	String dName = file.getFileName();
////		if(dName == null){
////			헤더값의 설정을 통해서 처리
////			response.setHeader("content-Type", "image/jpg");
////		}
////			파일의 종류에 상관없이 무조건 다운로드
////		else{
////			타입을 모른다. 다운로드 하세요...
//	response.setHeader("content-Type", "application/octet-stream");
////			다운로드 받을 이름을 설정
////			dName 한글처리
//	dName = new String(dName.getBytes("utf-8"), "8859_1");
//	response.setHeader("content-Disposition", "attachment;filename="+dName);
////		}
//	FileInputStream fis = new FileInputStream(f);
//	BufferedInputStream bis = new BufferedInputStream(fis);
//	OutputStream out = response.getOutputStream();
//	BufferedOutputStream bos = new BufferedOutputStream(out);
//	while(true){
//		int ch = bis.read();
//		if (ch == -1) break;
//		bos.write(ch);
//	}
//	bis.close();
//	fis.close();
//	bos.close();
//	out.close();
//}
//}
