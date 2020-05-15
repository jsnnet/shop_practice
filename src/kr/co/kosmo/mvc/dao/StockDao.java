package kr.co.kosmo.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.SearchVO;
@Repository
public class StockDao implements StockInter{
	
	@Autowired
	SqlSessionTemplate ss;
	//재고 부족분 물량 리스트
	@Override
	public List<GaguVO> stock() {
		return ss.selectList("stock.shortage");
	}
	//재고 토탈 총 수
	@Override
	public int gagu_total(SearchVO vo){
		return ss.selectOne("stock.total",vo);
	}
	//재고 리스트
	@Override
	public List<GaguVO> gagu_list(SearchVO vo){
		List<GaguVO> list = ss.selectList("stock.list",vo);
		return list;
	}
	//재고 수량 업데이트
	@Override
	public void stockUp(int gnum, int stock) {
		//맵을 사용해서 두개의 값을 보냄
		Map<String, Integer> paramegert = new HashMap<String, Integer>();
		paramegert.put("gnum", gnum);
		paramegert.put("stock", stock);
		ss.update("stock.update", paramegert);
		
	}

	

	

	
}
