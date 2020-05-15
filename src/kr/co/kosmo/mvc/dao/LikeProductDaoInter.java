package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.ProductLogVO;

public interface LikeProductDaoInter {

	public void LikeProductLogAdd(ProductLogVO vo);
	
	public int LikeProductLogGinumSelect(int gnum);

	public int LikeProductLogCheck(ProductLogVO vo);
	
	public void LikeProductLogUpdate(ProductLogVO vo);
	
	public int LikeProductLogMemberGinumSelect (int mnum);
	
	public List<GaguVO> LikeProductGaguList (int ginum);
}
