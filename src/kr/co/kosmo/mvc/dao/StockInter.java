package kr.co.kosmo.mvc.dao;

import java.util.List;



import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.QnAVO;
import kr.co.kosmo.mvc.dto.SearchVO;

public interface StockInter {
	//��� ������ ���� ����Ʈ
	public List<GaguVO> stock();
	//��� ��Ż �� ��
	public int gagu_total(SearchVO vo);
	//��� ����Ʈ
	public List<GaguVO> gagu_list(SearchVO vo);
	//��� ���� ������Ʈ
	public void stockUp(int gnum,int stock);
}
