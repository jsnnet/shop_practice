package kr.co.kosmo.mvc.dto;

public class LoginLoggerVO {
	private int llnum;	// �α׹�ȣ
	private int mnum;	// ȸ����ȣ
	private String llstatus;	// �α��� ,�α׾ƿ� 
	private String lltime;		// ���ӽð�
	private String reip;		// ������
	
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