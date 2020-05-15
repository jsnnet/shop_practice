package kr.co.kosmo.mvc.dto;

public class CartVO {
	private int cnum,mnum,gnum,chit;
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

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public int getGnum() {
		return gnum;
	}

	public void setGnum(int gnum) {
		this.gnum = gnum;
	}

	public int getChit() {
		return chit;
	}

	public void setChit(int chit) {
		this.chit = chit;
	}
	
}
