package kr.co.kosmo.mvc.dto;

import java.util.List;

public class MemberVO {
	private int mnum;
	private String mid;
	private String mpwd;
	private String mname;
	private String maddr1;
	private String maddr2;
	private int mpost;
	private String mtel;
	private String memail;
	private String medate;
	private String madmin;
	private int cnt;
	private List<CartVO> cart;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public List<CartVO> getCart() {
		return cart;
	}
	public void setCart(List<CartVO> cart) {
		this.cart = cart;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMaddr1() {
		return maddr1;
	}
	public void setMaddr1(String maddr1) {
		this.maddr1 = maddr1;
	}
	public String getMaddr2() {
		return maddr2;
	}
	public void setMaddr2(String maddr2) {
		this.maddr2 = maddr2;
	}
	public int getMpost() {
		return mpost;
	}
	public void setMpost(int mpost) {
		this.mpost = mpost;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMedate() {
		return medate;
	}
	public void setMedate(String medate) {
		this.medate = medate;
	}
	public String getMadmin() {
		return madmin;
	}
	public void setMadmin(String madmin) {
		this.madmin = madmin;
	}
	
}
