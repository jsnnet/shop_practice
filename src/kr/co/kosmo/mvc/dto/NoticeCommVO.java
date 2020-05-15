package kr.co.kosmo.mvc.dto;

public class NoticeCommVO {
	private int ncnum,nnum,mnum;
	private String nccontent;
	public int getNcnum() {
		return ncnum;
	}
	public void setNcnum(int ncnum) {
		this.ncnum = ncnum;
	}
	public int getNnum() {
		return nnum;
	}
	public void setNnum(int nnum) {
		this.nnum = nnum;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getNccontent() {
		return nccontent;
	}
	public void setNccontent(String nccontent) {
		this.nccontent = nccontent;
	}
	
}
