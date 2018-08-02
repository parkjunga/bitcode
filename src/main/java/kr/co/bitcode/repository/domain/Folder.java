package kr.co.bitcode.repository.domain;

public class Folder {
	private int key;
	private String title;
	private boolean folder;
	private String type;
	private boolean lazy;
	private String parentPath;
//	private List<Children> children;
	
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public boolean isFolder() {
		return folder;
	}
	public void setFolder(boolean folder) {
		this.folder = folder;
	}
//	public List<Children> getChildren() {
//		return children;
//	}
//	public void setChildren(List<Children> children) {
//		this.children = children;
//	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public boolean isLazy() {
		return lazy;
	}
	public void setLazy(boolean lazy) {
		this.lazy = lazy;
	}
	public String getParentPath() {
		return parentPath;
	}
	public void setParentPath(String parentPath) {
		this.parentPath = parentPath;
	}
	
}
