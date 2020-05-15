package kr.co.kosmo.mvc.dto;

public class SearchLogVO {

	private int slnum;
	private String slvalue, sldate;
	private int slcnt;

	public int getSlnum() {
		return slnum;
	}

	public void setSlnum(int slnum) {
		this.slnum = slnum;
	}

	public String getSlvalue() {
		return slvalue;
	}

	public void setSlvalue(String slvalue) {
		this.slvalue = slvalue;
	}

	public String getSldate() {
		return sldate;
	}

	public void setSldate(String sldate) {
		this.sldate = sldate;
	}

	public int getSlcnt() {
		return slcnt;
	}

	public void setSlcnt(int slcnt) {
		this.slcnt = slcnt;
	}

}
