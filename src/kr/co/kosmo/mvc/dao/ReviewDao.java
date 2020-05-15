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
	
	// ����¡
	public int totalCount(int gnum) {
		return ss.selectOne("review.totalCount", gnum);
	}
	
	// ���� �� ���� ����
	public int getReviewCount(int gnum) {
		return ss.selectOne("review.reviewCount", gnum);
	}
	
	// ���� ���� ����
	public int getMyReviewCount(String mid) {
		return ss.selectOne("review.myReviewCount", mid);
	}
	
	// ���� ���� ����Ʈ
	public List<ReviewVO> getMyReviewList(SearchVO svo) {
		return ss.selectList("review.myreview", svo);
	}
	
	// ���� ����Ʈ
	public List<ReviewVO> getReviewList(SearchVO svo) {
		return ss.selectList("review.reviewList", svo);
	}
	
	// ���� ���
	public void getAddReview(ReviewVO vo) {
		ss.insert("review.add", vo);
	}
	
	// ���� ���� ��
	public ReviewVO getUpdateReviewForm(int rnum) {
		return ss.selectOne("review.reviewForm", rnum);
	}
	
	// ���� ����
	public void getUpdateReview(ReviewVO vo) {
		ss.update("review.update", vo);
	}
	
	// ���� ����
	public void getDeleteReview(int rnum) {
		ss.delete("review.delete", rnum);
	}
	
	//���� ���� ������ �հ�
	public ReviewVO reviewStarSum() {
		return ss.selectOne("review.reviewStarSum");		
	}

}
