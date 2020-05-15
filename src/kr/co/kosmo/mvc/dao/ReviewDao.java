package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.ReviewVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Repository
public class ReviewDao {
	@Autowired
	private SqlSessionTemplate ss;
	
	// ÆäÀÌÂ¡
	public int totalCount(int gnum) {
		return ss.selectOne("review.totalCount", gnum);
	}
	
	// °¡±¸ ´ç ¸®ºä °³¼ö
	public int getReviewCount(int gnum) {
		return ss.selectOne("review.reviewCount", gnum);
	}
	
	// ³ªÀÇ ¸®ºä °³¼ö
	public int getMyReviewCount(String mid) {
		return ss.selectOne("review.myReviewCount", mid);
	}
	
	// ³ªÀÇ ¸®ºä ¸®½ºÆ®
	public List<ReviewVO> getMyReviewList(SearchVO svo) {
		return ss.selectList("review.myreview", svo);
	}
	
	// ¸®ºä ¸®½ºÆ®
	public List<ReviewVO> getReviewList(SearchVO svo) {
		return ss.selectList("review.reviewList", svo);
	}
	
	// ¸®ºä µî·Ï
	public void getAddReview(ReviewVO vo) {
		ss.insert("review.add", vo);
	}
	
	// ¸®ºä ¼öÁ¤ Æû
	public ReviewVO getUpdateReviewForm(int rnum) {
		return ss.selectOne("review.reviewForm", rnum);
	}
	
	// ¸®ºä ¼öÁ¤
	public void getUpdateReview(ReviewVO vo) {
		ss.update("review.update", vo);
	}
	
	// ¸®ºä »èÁ¦
	public void getDeleteReview(int rnum) {
		ss.delete("review.delete", rnum);
	}
	
	//¸®ºä º°Á¡ °¡±¸º° ÇÕ°è
	public ReviewVO reviewStarSum() {
		return ss.selectOne("review.reviewStarSum");		
	}

}
