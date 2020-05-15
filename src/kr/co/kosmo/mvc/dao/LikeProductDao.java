package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.ProductLogVO;

@Repository
public class LikeProductDao implements LikeProductDaoInter {

	@Autowired
	private SqlSessionTemplate ss;

	// 로그 추가
	@Override
	public void LikeProductLogAdd(ProductLogVO vo) {
		ss.insert("likeProduct.logAdd", vo);
	}

	// 클릭한 카테고리 가져오기
	@Override
	public int LikeProductLogGinumSelect(int gnum) {
		return ss.selectOne("likeProduct.logGinumSelect", gnum);
	}

	// 로그 여부 체크
	@Override
	public int LikeProductLogCheck(ProductLogVO vo) {
		return ss.selectOne("likeProduct.logCheck", vo);
	}

	// 로그 횟수 + 1
	@Override
	public void LikeProductLogUpdate(ProductLogVO vo) {
		ss.update("likeProduct.logUpdate", vo);
	}

	// 회원이 가장 많이 클릭한 가구종류번호 가져오기 
	@Override
	public int LikeProductLogMemberGinumSelect(int mnum) {
		return ss.selectOne("likeProduct.logMemberGinumSelect", mnum);
	}

	// 회원이 가장 많이 클릭한 가구 4개 가져오기
	@Override
	public List<GaguVO> LikeProductGaguList(int ginum) {
		return ss.selectList("likeProduct.logGaguList", ginum);
	}
	
}
