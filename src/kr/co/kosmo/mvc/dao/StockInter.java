package kr.co.kosmo.mvc.dao;

import java.util.List;



import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.QnAVO;
import kr.co.kosmo.mvc.dto.SearchVO;

public interface StockInter {
	//재고 부족분 물량 리스트
	public List<GaguVO> stock();
	//재고 토탈 총 수
	public int gagu_total(SearchVO vo);
	//재고 리스트
	public List<GaguVO> gagu_list(SearchVO vo);
	//재고 수량 업데이트
	public void stockUp(int gnum,int stock);
}
