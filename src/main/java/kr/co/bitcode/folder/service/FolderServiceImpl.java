package kr.co.bitcode.folder.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.bitcode.repository.domain.FancyTree;
import kr.co.bitcode.repository.domain.FolderAndFile;

@Service("folderService")
public class FolderServiceImpl implements FolderService{
	
//	private static final String DELETE_PATH = "c:\\java-lec\\upload\\delete_";
	private final String PATH = "c:\\java-lec\\upload\\";
	private final String MUSIC_PATH = "_music";
	private final String[] EXT = { "jpg", "png", "gif",};
	private static long FolderSize = 0;
	
	@Override
	public Map<String, Object> selectFolderById(String id) {
		String folderPath = PATH + id; 
		String musicPath = PATH + id + MUSIC_PATH;
		String deletePath = PATH + id + "_delete";
		new File(folderPath + "\\Sample").mkdirs();
		new File(deletePath).mkdirs();
		new File(musicPath).mkdirs();
//		try {
//			FileInputStream fis = new FileInputStream(PATH + "sample.mp3");
//			FileOutputStream fos = new FileOutputStream(musicPath + "\\sample.mp3");
//			int data = 0;
//			while((data=fis.read())!=-1) {
//				fos.write(data);
//			}
//			fis.close();
//			fos.close();
//			
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		Map<String, Object> map = new HashMap<>();
		FolderSize = 0;
		map.put("size", ListDirectorySize(new File(folderPath)));
		map.put("list", ListDirectory(new File(folderPath)));
		return map;
	}
	@Override
	public List<FancyTree> createFolder(FolderAndFile faf) {
		new File(PATH + faf.getId() + "\\" + faf.getPath()).mkdirs();
		return  ListDirectory(new File(PATH + faf.getId()));
	}
	@Override
	public Map<String, Object> contextFolder(FolderAndFile faf) {
		new File(faf.getPath() + "\\" + faf.getName()).mkdirs();
		Map<String, Object> map = new HashMap<>();
		map.put("fancyList", ListDirectory(new File(PATH + faf.getId())));
		map.put("path", faf.getPath());
		return map;
	}
	@Override
	public Map<String, Object> delete(FolderAndFile faf) {
		System.out.println(faf.getPath());
		new File(faf.getPath() + "/" + faf.getName()).delete();
		Map<String, Object> map = new HashMap<>();
		if(faf.getPath().indexOf(MUSIC_PATH) != -1){
			map.put("fancyList", ListDirectory(new File(faf.getPath())));
		}else{
			map.put("fancyList", ListDirectory(new File(PATH + faf.getId())));
		}
		map.put("path", faf.getPath());
		return map;
	}
	@Override
	public List<FancyTree> enterDirectory(FolderAndFile faf) {
		System.out.println(faf.getPath());
		return ListDirectory(new File(faf.getPath()), Integer.parseInt(faf.getKey()));
	}
	@Override
	public List<FancyTree> lazyLoad(FolderAndFile faf) {
		return ListDirectory(new File(faf.getPath() + "\\" + faf.getName()), Integer.parseInt(faf.getKey()));
	}
	@Override
	public Map<String, Object> uploadFile(FolderAndFile faf, MultipartFile attach) {
//		System.out.println(faf.getPath().indexOf(MUSIC_PATH));
//		System.out.println(faf.getPath().);
		Map<String, Object> map = new HashMap<>();
		try {
//			if(parentPath == null) {
//				attach.transferTo(new File(PATH + id, attach.getOriginalFilename()));
//				return "";
//			}else {
//			}
			// 실제 서버에 업로드 (경로없으면 폴더 생성 후 파일 업로드)
			File create = new File(faf.getPath(), attach.getOriginalFilename());
			create.mkdirs();
			attach.transferTo(create);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(faf.getPath().indexOf(MUSIC_PATH) != -1){
			map.put("list", ListDirectory(new File(faf.getPath())));
		}else{
			map.put("list", ListDirectory(new File(PATH + faf.getId())));
		}
		FolderSize = 0;
		map.put("size", ListDirectorySize(new File(PATH + faf.getId())));
		return map;
	}
	
	
	@Override
	public List<FancyTree> musicFolder(FolderAndFile faf) {
		System.out.println(PATH + faf.getId() + MUSIC_PATH);
		return ListDirectory(new File(PATH + faf.getId() + MUSIC_PATH));
	}
	
	//폴더 읽기
	/**
	 * @param file, 해당 경로 파일, 폴더 읽기
	 * @param args, 고유 key값 부여
	 * @return  폴더, 파일 정보
	 */
	private List<FancyTree> ListDirectory(File file, int...args){
		int i;
		if(args.length == 0){
			i = 1;
		}else{
			i = args[0];
		}
		List<FancyTree> fList = new ArrayList<>(); 
		for (File ff : file.listFiles()) {
			FancyTree ft = new FancyTree();
			String type = ff.getName().substring(ff.getName().lastIndexOf(".") + 1, ff.getName().length());
			if(ff.isFile()){
				for(int j=0; j<EXT.length; j++){
					if(type.equalsIgnoreCase(EXT[j])){
						ft.setType("img");
					}
				}
				ft.setKey(Integer.toString(i++));
				ft.setTitle(ff.getName());
				ft.setPath(ff.getParent());
			}
			if(ff.isDirectory()){
				ft.setKey(Integer.toString(i++));
				ft.setTitle(ff.getName());
				ft.setFolder(true);
				ft.setPath(ff.getParent());
				if(ff.listFiles().length != 0){
					ft.setLazy(true);
				}
			}
			fList.add(ft);
		}
		return fList;
	}
	
	// 폴더 크기
	/**
	 * @param file
	 * @return 파일 용량 
	 */
	private static long ListDirectorySize(File file){
		for (File ff : file.listFiles()) {
			if(ff.isFile()){
				FolderSize += ff.length();
			}
			if(ff.isDirectory()) {
				ListDirectorySize(ff);
			}
		}
		return FolderSize;
	}

	
}
