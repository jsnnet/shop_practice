package kr.co.kosmo.mvc.dto;

public class QnaCommVO {
	private int qcnum,qnum,mnum,madmin;
	private String qccontent,mid, qcdate;
	
	public String getQcdate() {
		return qcdate;
	}
	public void setQcdate(String qcdate) {
		this.qcdate = qcdate;
	}
	public int getMadmin() {
		return madmin;
	}
	public void setMadmin(int madmin) {
		this.madmin = madmin;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getQcnum() {
		return qcnum;
	}
	public void setQcnum(int qcnum) {
		this.qcnum = qcnum;
	}
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getQccontent() {
		return qccontent;
	}
	public void setQccontent(String qccontent) {
		this.qccontent = qccontent;
	}
	
}
