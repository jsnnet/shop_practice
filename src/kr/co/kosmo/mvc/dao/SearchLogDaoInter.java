package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.dto.SearchLogVO;

public interface SearchLogDaoInter {

	public void SearchLogInsert(SearchLogVO slvo);
	
	public void SearchLogUpdate(SearchLogVO slvo);
	
	public int SearchLogCheck(SearchLogVO slvo);
	
	public List<SearchLogVO> SearchLogRankList();
}
