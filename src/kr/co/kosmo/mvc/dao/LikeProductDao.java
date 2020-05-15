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

	// �α� �߰�
	@Override
	public void LikeProductLogAdd(ProductLogVO vo) {
		ss.insert("likeProduct.logAdd", vo);
	}

	// Ŭ���� ī�װ� ��������
	@Override
	public int LikeProductLogGinumSelect(int gnum) {
		return ss.selectOne("likeProduct.logGinumSelect", gnum);
	}

	// �α� ���� üũ
	@Override
	public int LikeProductLogCheck(ProductLogVO vo) {
		return ss.selectOne("likeProduct.logCheck", vo);
	}

	// �α� Ƚ�� + 1
	@Override
	public void LikeProductLogUpdate(ProductLogVO vo) {
		ss.update("likeProduct.logUpdate", vo);
	}

	// ȸ���� ���� ���� Ŭ���� ����������ȣ �������� 
	@Override
	public int LikeProductLogMemberGinumSelect(int mnum) {
		return ss.selectOne("likeProduct.logMemberGinumSelect", mnum);
	}

	// ȸ���� ���� ���� Ŭ���� ���� 4�� ��������
	@Override
	public List<GaguVO> LikeProductGaguList(int ginum) {
		return ss.selectList("likeProduct.logGaguList", ginum);
	}
	
}
