package kr.co.kosmo.mvc.dto;

import java.util.List;

public class GorderListVO {
	private List<GorderDetailVO> gorderDetail;

	public List<GorderDetailVO> getGorderDetail() {
		return gorderDetail;
	}

	public void setGorderDetail(List<GorderDetailVO> gorderDetail) {
		this.gorderDetail = gorderDetail;
	}
	
}
