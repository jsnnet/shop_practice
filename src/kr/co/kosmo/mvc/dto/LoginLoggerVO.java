package kr.co.kosmo.mvc.dto;

public class LoginLoggerVO {
	private int llnum;	// 로그번호
	private int mnum;	// 회원번호
	private String llstatus;	// 로그인 ,로그아웃 
	private String lltime;		// 접속시간
	private String reip;		// 아이피
	
	public String getReip() {
		return reip;
	}
	public void setReip(String reip) {
		this.reip = reip;
	}
	public int getLlnum() {
		return llnum;
	}
	public void setLlnum(int llnum) {
		this.llnum = llnum;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getLlstatus() {
		return llstatus;
	}
	public void setLlstatus(String llstatus) {
		this.llstatus = llstatus;
	}
	public String getLltime() {
		return lltime;
	}
	public void setLltime(String lltime) {
		this.lltime = lltime;
	}
}