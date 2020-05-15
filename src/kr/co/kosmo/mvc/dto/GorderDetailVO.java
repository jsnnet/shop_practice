package kr.co.kosmo.mvc.dto;

import java.util.List;

public class GorderDetailVO {
	private int odnum, onum, gnum, odamount, odprice, cnum;
	private GaguVO gagu;

	public GaguVO getGagu() {
		return gagu;
	}

	public void setGagu(GaguVO gagu) {
		this.gagu = gagu;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public int getOdnum() {
		return odnum;
	}

	public void setOdnum(int odnum) {
		this.odnum = odnum;
	}

	public int getOnum() {
		return onum;
	}

	public void setOnum(int onum) {
		this.onum = onum;
	}

	public int getGnum() {
		return gnum;
	}

	public void setGnum(int gnum) {
		this.gnum = gnum;
	}

	public int getOdamount() {
		return odamount;
	}

	public void setOdamount(int odamount) {
		this.odamount = odamount;
	}

	public int getOdprice() {
		return odprice;
	}

	public void setOdprice(int odprice) {
		this.odprice = odprice;
	}

}