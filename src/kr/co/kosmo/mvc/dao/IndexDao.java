package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.GaguVO;

@Repository
public class IndexDao {
	@Autowired
	private SqlSessionTemplate ss;
	
	public List<GaguVO> getRecentlyGagu(){
		return ss.selectList("gagushop.gaguRecentlyList");
	}
}
