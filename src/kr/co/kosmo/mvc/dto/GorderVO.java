package kr.co.kosmo.mvc.dto;

import java.util.List;

public class GorderVO {
	private int onum, mnum, ototal, opost;
	private String odate, oname, oaddr1, oaddr2, otel;
	private List<GorderDetailVO> gorderDetail;

	public List<GorderDetailVO> getGorderDetail() {
		return gorderDetail;
	}

	public void setGorderDetail(List<GorderDetailVO> gorderDetail) {
		this.gorderDetail = gorderDetail;
	}

	public int getOnum() {
		return onum;
	}

	public void setOnum(int onum) {
		this.onum = onum;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public int getOtotal() {
		return ototal;
	}

	public void setOtotal(int ototal) {
		this.ototal = ototal;
	}

	public int getOpost() {
		return opost;
	}

	public void setOpost(int opost) {
		this.opost = opost;
	}

	public String getOdate() {
		return odate;
	}

	public void setOdate(String odate) {
		this.odate = odate;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getOaddr1() {
		return oaddr1;
	}

	public void setOaddr1(String oaddr1) {
		this.oaddr1 = oaddr1;
	}

	public String getOaddr2() {
		return oaddr2;
	}

	public void setOaddr2(String oaddr2) {
		this.oaddr2 = oaddr2;
	}

	public String getOtel() {
		return otel;
	}

	public void setOtel(String otel) {
		this.otel = otel;
	}

}