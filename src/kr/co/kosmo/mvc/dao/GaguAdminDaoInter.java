package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.dto.GaguItemVO;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.SearchVO;

public interface GaguAdminDaoInter {

	// ���� ���� ����Ʈ
	public List<GaguItemVO> gaguItemList();

	// ���� �߰�
	public void gaguAdd(GaguVO vo);

	// TotalCount
	public int totalCount(SearchVO svo);

	// ���� ����Ʈ
	public List<GaguVO> gaguList(SearchVO svo);

	// ���� ��������
	public GaguVO gaguDetail(int gnum);

	// ���� ����
	public void gaguUpdate(GaguVO vo);

	// ���� ����
	public void gaguDelete(int gnum);

//	// ���� �˻�
//	public List<GaguVO> gaguSearch(SearchVO vo);
}
