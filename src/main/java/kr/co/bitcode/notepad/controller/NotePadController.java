package kr.co.bitcode.notepad.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@CrossOrigin(origins = "*")
public class NotePadController {
	
	private final String PATH = "c:\\java-lec\\upload\\";
		
	/** 메모장 내용 읽기 */
	@RequestMapping("/main/myNote.json")
	@ResponseBody
	public String myNote(String id) throws Exception {
		// 사용자 txt 파일
		File txt = new File(PATH + id + ".txt");
		// 없으면 만들기
		if(!txt.exists()) {
			txt.createNewFile();
		}
		// txt 파일 읽기
		String myTxt = "";
		String temp;
		
		BufferedReader br = new BufferedReader(new FileReader(txt));
        while ((temp = br.readLine()) != null) {
      	  myTxt += temp;
        }
		br.close();
		//System.out.println("저장된 메모장 내용 : " + myTxt);
		return myTxt;
	}
	
	
	/** 메모장 내용 수정 */
	@RequestMapping("/main/modNote.json")
	@ResponseBody
	public Map<String, String> modNote(String id, String content) throws Exception {
		//System.out.println("메모장 입력 내용 : " + content);
		// txt 파일 저장
		FileWriter fw = new FileWriter(PATH + id + ".txt");
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write(content);
		bw.close();
		// txt 파일 읽기
		String myTxt = "";
		String temp;
		File txt = new File(PATH + id + ".txt");
		BufferedReader br = new BufferedReader(new FileReader(txt));
        while ((temp = br.readLine()) != null) {
      	  myTxt += temp;
        }
		br.close();
		System.out.println("메모장 : " + myTxt);
		Map<String, String> result = new HashMap<>();
		result.put("result", myTxt);
		return result;
	}
}
