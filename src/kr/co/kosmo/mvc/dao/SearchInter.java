package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.dto.GaguItemVO;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.SearchVO;

public interface SearchInter {
	//�˻������� ����Ʈ
	public List<GaguVO> searchlist(SearchVO svo);
	//����¡ó�������� 
	public int totalcount(SearchVO svo);
	//���� ���� ����Ʈ
	public List<GaguItemVO> Searchitem(int ginum);
	// �˻��� ����
	public List<String> searchValueEx(String searchValue);
	
}
