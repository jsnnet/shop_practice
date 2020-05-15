package kr.co.kosmo.mvc.service;

import kr.co.kosmo.mvc.dto.GorderListVO;
import kr.co.kosmo.mvc.dto.GorderVO;

public interface GorderServiceInter {
	//트렌젝션 처리하기 위한 인터페이스
	public void twoadd(GorderListVO glvo, GorderVO gvo) throws Exception;
}
