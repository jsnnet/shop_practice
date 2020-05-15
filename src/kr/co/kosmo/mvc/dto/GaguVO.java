package kr.co.kosmo.mvc.dto;

import org.springframework.web.multipart.MultipartFile;

public class GaguVO {

	private int gnum;
	private String gname;
	private int ginum;
	private String ginfo;
	private String gcolor;
	private String gpicture;
	private String gsize;
	private String gcompany;
	private int gprice;
	private int gstock;
	private int ghit;
	private String gdetail;
	private MultipartFile multipartFile;
	private MultipartFile multipartFile2;
	private double rgrade;
	private String giname;

	public int getGnum() {
		return gnum;
	}

	public void setGnum(int gnum) {
		this.gnum = gnum;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public int getGinum() {
		return ginum;
	}

	public void setGinum(int ginum) {
		this.ginum = ginum;
	}

	public String getGinfo() {
		return ginfo;
	}

	public void setGinfo(String ginfo) {
		this.ginfo = ginfo;
	}

	public String getGcolor() {
		return gcolor;
	}

	public void setGcolor(String gcolor) {
		this.gcolor = gcolor;
	}

	public String getGpicture() {
		return gpicture;
	}

	public void setGpicture(String gpicture) {
		this.gpicture = gpicture;
	}

	public String getGsize() {
		return gsize;
	}

	public void setGsize(String gsize) {
		this.gsize = gsize;
	}

	public String getGcompany() {
		return gcompany;
	}

	public void setGcompany(String gcompany) {
		this.gcompany = gcompany;
	}

	public int getGprice() {
		return gprice;
	}

	public void setGprice(int gprice) {
		this.gprice = gprice;
	}

	public int getGstock() {
		return gstock;
	}

	public void setGstock(int gstock) {
		this.gstock = gstock;
	}

	public int getGhit() {
		return ghit;
	}

	public void setGhit(int ghit) {
		this.ghit = ghit;
	}

	public String getGdetail() {
		return gdetail;
	}

	public void setGdetail(String gdetail) {
		this.gdetail = gdetail;
	}

	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}

	public MultipartFile getMultipartFile2() {
		return multipartFile2;
	}

	public void setMultipartFile2(MultipartFile multipartFile2) {
		this.multipartFile2 = multipartFile2;
	}

	public double getRgrade() {
		return rgrade;
	}

	public void setRgrade(double rgrade) {
		this.rgrade = rgrade;
	}

	public String getGiname() {
		return giname;
	}

	public void setGiname(String giname) {
		this.giname = giname;
	}

}
