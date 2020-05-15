package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.ChartVO;
import kr.co.kosmo.mvc.dto.ProductLogVO;
import kr.co.kosmo.mvc.dto.ReviewVO;

@Repository
public class ChartListDao {
	@Autowired
	private SqlSessionTemplate ss;

	public ChartVO chartSumList() {
		return ss.selectOne("chart.chartSumList");
	}
	public ChartVO chartStar() {
		return ss.selectOne("chart.chartStar");
	}
	public ChartVO chartMoney() {
		return ss.selectOne("chart.chartMoney");
	}
	
	public ChartVO chartDate() {
		return ss.selectOne("chart.chartDate");
	}
		
	public List<ChartVO> chartRanking() {
		List<ChartVO> list = ss.selectList("chart.chartRanking");
		return list;
	}
}
