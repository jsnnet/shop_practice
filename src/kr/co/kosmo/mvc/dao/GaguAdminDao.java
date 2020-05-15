package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.GaguItemVO;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Repository
public class GaguAdminDao implements GaguAdminDaoInter {

	@Autowired
	private SqlSessionTemplate ss;

	// 가구 종류 리스트
	@Override
	public List<GaguItemVO> gaguItemList() {
		return ss.selectList("gaguAdmin.gaguItemList");
	}

	// 가구 추가
	@Override
	public void gaguAdd(GaguVO vo) {
		ss.insert("gaguAdmin.gaguAdd", vo);
	}

	// TotalCount
	@Override
	public int totalCount(SearchVO svo) {
		return ss.selectOne("gaguAdmin.totalCount", svo);
	}

	// 가구 리스트
	@Override
	public List<GaguVO> gaguList(SearchVO svo) {
		return ss.selectList("gaguAdmin.gaguList", svo);
	}

	// 가구 상세페이지
	@Override
	public GaguVO gaguDetail(int gnum) {
		return ss.selectOne("gaguAdmin.gaguDetail", gnum);
	}

	// 가구 수정
	@Override
	public void gaguUpdate(GaguVO vo) {
		ss.update("gaguAdmin.gaguUpdate", vo);
	}

	// 가구 삭제
	@Override
	public void gaguDelete(int gnum) {
		ss.delete("gaguAdmin.gaguDelete", gnum);
	}

//	// 가구 검색
//	public List<GaguVO> gaguSearch(SearchVO vo) {
//		return ss.selectList("gaguAdmin.gaguSearch", vo);
//	}
}
