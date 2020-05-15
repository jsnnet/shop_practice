package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.dto.GaguItemVO;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.SearchVO;

public interface GaguAdminDaoInter {

	// 가구 종류 리스트
	public List<GaguItemVO> gaguItemList();

	// 가구 추가
	public void gaguAdd(GaguVO vo);

	// TotalCount
	public int totalCount(SearchVO svo);

	// 가구 리스트
	public List<GaguVO> gaguList(SearchVO svo);

	// 가구 상세페이지
	public GaguVO gaguDetail(int gnum);

	// 가구 수정
	public void gaguUpdate(GaguVO vo);

	// 가구 삭제
	public void gaguDelete(int gnum);

//	// 가구 검색
//	public List<GaguVO> gaguSearch(SearchVO vo);
}
