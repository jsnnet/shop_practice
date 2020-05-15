package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.dto.GaguItemVO;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.SearchVO;

public interface SearchInter {
	//검색을위한 리스트
	public List<GaguVO> searchlist(SearchVO svo);
	//페이징처리를위한 
	public int totalcount(SearchVO svo);
	//가구 종류 리스트
	public List<GaguItemVO> Searchitem(int ginum);
	// 검색어 예시
	public List<String> searchValueEx(String searchValue);
	
}
