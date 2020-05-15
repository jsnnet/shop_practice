package kr.co.kosmo.mvc.dto;

public class GaguItemVO {

	private int ginum;
	private String giname;
	private String gicontent;
	private String gititle;
	
	public String getGititle() {
		return gititle;
	}

	public void setGititle(String gititle) {
		this.gititle = gititle;
	}

	public int getGinum() {
		return ginum;
	}

	public void setGinum(int ginum) {
		this.ginum = ginum;
	}

	public String getGiname() {
		return giname;
	}

	public void setGiname(String giname) {
		this.giname = giname;
	}

	public String getGicontent() {
		return gicontent;
	}

	public void setGicontent(String gicontent) {
		this.gicontent = gicontent;
	}

}
