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

	// �α� �߰�
	@Override
	public void SearchLogInsert(SearchLogVO slvo) {
		ss.insert("searchLog.logInsert", slvo);
	}

	// �α� ������Ʈ
	@Override
	public void SearchLogUpdate(SearchLogVO slvo) {
		ss.update("searchLog.logUpdate", slvo);
	}

	// �α� ���� ���� üũ
	@Override
	public int SearchLogCheck(SearchLogVO slvo) {
		return ss.selectOne("searchLog.logCheck", slvo);
	}

	// �˻����� ��������
	@Override
	public List<SearchLogVO> SearchLogRankList() {
		return ss.selectList("searchLog.logRankList");
	}

}
