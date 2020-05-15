package kr.co.kosmo.mvc.dao;

import kr.co.kosmo.mvc.dto.GorderListVO;

public interface GorderDetailInter {
	//구매한 상세 페이지에 넣는다
	public void gorderdetailinsert(GorderListVO glvo);
}
