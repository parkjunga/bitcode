package kr.co.bitcode.music.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bitcode.repository.domain.FancyTree;

@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/music")
public class MusicController {

	private final String PATH = "c:\\java-lec\\upload\\";
	private final String MUSIC_PATH = "_music";
	//@Autowired
	//private MusicService service;
	
	/** 내음악 플레이어 */
	@RequestMapping("/player.do")
	public void player(String id) { }
	
	//----------------------------------------music폴더 관리
	@RequestMapping("/musicFolder.json")
	@ResponseBody
	public List<FancyTree> musicFolder(String id) {
		// 우클릭으로 폴더 추가시
//		new File(path + "\\" + name).mkdirs();
		return ListDirectory(new File(PATH + id + MUSIC_PATH));
	}
	
	@RequestMapping("musicList.json")
	@ResponseBody
	public List<FancyTree> musicList(String id){
		File f = new File(PATH + id + MUSIC_PATH);
		return ListDirectory(f);
	}
	
	private List<FancyTree> ListDirectory(File file, int...args){
//		file.renameTo(dest) 파일 무브 삭제개념
		int i;
		if(args.length == 0){
			i = 1;
		}else{
			i = args[0];
		}
//		long size = 0; 용량 체크
		List<FancyTree> fList = new ArrayList<>(); 
		for (File ff : file.listFiles()) {
			if(ff.isFile()){
				FancyTree folder = new FancyTree();
				folder.setKey(Integer.toString(i++));
				folder.setTitle(ff.getName());
				folder.setPath(ff.getParent());
				fList.add(folder);
			}
		}
		return fList;
	}
}
