package kr.co.kosmo.mvc.dto;

public class QnAVO {
	private int qnum,mnum;
	private String qtitle,qcontent,qcatagory,qdate,qpwd,mid, qcdate;
	private int mynum;
	
	public int getMynum() {
		return mynum;
	}
	public void setMynum(int mynum) {
		this.mynum = mynum;
	}
	public String getQcdate() {
		return qcdate;
	}
	public void setQcdate(String qcdate) {
		this.qcdate = qcdate;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getQtitle() {
		return qtitle;
	}
	public String getQpwd() {
		return qpwd;
	}
	public void setQpwd(String qpwd) {
		this.qpwd = qpwd;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getQcatagory() {
		return qcatagory;
	}
	public void setQcatagory(String qcatagory) {
		this.qcatagory = qcatagory;
	}
	public String getQdate() {
		return qdate;
	}
	public void setQdate(String qdate) {
		this.qdate = qdate;
	}
	
}
