package kr.co.kosmo.mvc.service;

import kr.co.kosmo.mvc.dto.GorderListVO;
import kr.co.kosmo.mvc.dto.GorderVO;

public interface GorderServiceInter {
	//Ʈ������ ó���ϱ� ���� �������̽�
	public void twoadd(GorderListVO glvo, GorderVO gvo) throws Exception;
}
