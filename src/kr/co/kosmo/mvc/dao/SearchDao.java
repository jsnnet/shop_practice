package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.GaguItemVO;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Repository
public class SearchDao implements SearchInter {
	@Autowired
	SqlSessionTemplate ss;

	// 가구리스트
	@Override
	public List<GaguVO> searchlist(SearchVO svo) {
		return ss.selectList("search.list", svo);
	}

	@Override
	public int totalcount(SearchVO svo) {
		return ss.selectOne("search.totalCount", svo);
	}

	@Override
	public List<GaguItemVO> Searchitem(int ginum) {
		return ss.selectOne("search.item", ginum);
	}

	// 검색어 예시
	@Override
	public List<String> searchValueEx(String searchValue) {
		return ss.selectList("search.searchValueEx", searchValue);
	}

}
