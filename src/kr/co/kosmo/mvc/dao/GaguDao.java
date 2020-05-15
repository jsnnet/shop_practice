package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.GaguItemVO;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Repository
public class GaguDao {

	@Autowired
	private SqlSessionTemplate ss;

	public void saveGagu(GaguVO vo) {
		ss.insert("gagushop.gagusave", vo);
	}

	public List<GaguVO> getGaguList(SearchVO svo) {
		return ss.selectList("gagushop.gaguList", svo);
	}

	public GaguItemVO getGaguItemList(int ginum) {
		return ss.selectOne("gagushop.gaguItemList", ginum);

	}
	
	public int getGaguTotal(int ginum) {
		return ss.selectOne("gagushop.total",ginum);
	}
	
	public GaguVO gaguDetail(int gnum) {
		return ss.selectOne("gagushop.gaguDetail", gnum);
	}

}
