package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.SearchLogVO;

@Repository
public class SearchLogDao implements SearchLogDaoInter {
	
	@Autowired
	private SqlSessionTemplate ss;

	// 로그 추가
	@Override
	public void SearchLogInsert(SearchLogVO slvo) {
		ss.insert("searchLog.logInsert", slvo);
	}

	// 로그 업데이트
	@Override
	public void SearchLogUpdate(SearchLogVO slvo) {
		ss.update("searchLog.logUpdate", slvo);
	}

	// 로그 존재 여부 체크
	@Override
	public int SearchLogCheck(SearchLogVO slvo) {
		return ss.selectOne("searchLog.logCheck", slvo);
	}

	// 검색순위 가져오기
	@Override
	public List<SearchLogVO> SearchLogRankList() {
		return ss.selectList("searchLog.logRankList");
	}

}
