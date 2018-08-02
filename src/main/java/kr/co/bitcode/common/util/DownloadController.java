package kr.co.bitcode.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bitcode.repository.domain.FileVO;


@Controller
public class DownloadController {
	
	@RequestMapping("/fileDown.do")
	public void fileDown(FileVO file,HttpServletResponse response, Model model) throws Exception{
		File f = new File("C:\\java-lec\\upload\\"+file.getOriginalFileName());
		String dName = file.getOriginalFileName();
		if(dName == null){
//			헤더값의 설정을 통해서 처리
			response.setHeader("content-Type", "image/jpg");
		}
//		파일의 종류에 상관없이 무조건 다운로드
		else{
//			타입을 모른다. 다운로드 하세요...
			response.setHeader("content-Type", "application/octet-stream");
//			다운로드 받을 이름을 설정
//			dName 한글처리
			dName = new String(dName.getBytes("utf-8"), "8859_1");
			response.setHeader("content-Disposition", "attachment;filename="+dName);
		}
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
