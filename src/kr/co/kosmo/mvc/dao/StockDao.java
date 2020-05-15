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
	//��� ������ ���� ����Ʈ
	@Override
	public List<GaguVO> stock() {
		return ss.selectList("stock.shortage");
	}
	//��� ��Ż �� ��
	@Override
	public int gagu_total(SearchVO vo){
		return ss.selectOne("stock.total",vo);
	}
	//��� ����Ʈ
	@Override
	public List<GaguVO> gagu_list(SearchVO vo){
		List<GaguVO> list = ss.selectList("stock.list",vo);
		return list;
	}
	//��� ���� ������Ʈ
	@Override
	public void stockUp(int gnum, int stock) {
		//���� ����ؼ� �ΰ��� ���� ����
		Map<String, Integer> paramegert = new HashMap<String, Integer>();
		paramegert.put("gnum", gnum);
		paramegert.put("stock", stock);
		ss.update("stock.update", paramegert);
		
	}

	

	

	
}
