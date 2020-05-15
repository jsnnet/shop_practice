package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.MemberVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Repository
public class AdminMemberDao {
	@Autowired
	private SqlSessionTemplate ss;
	
	// ȸ�� ��ȸ
	public List<MemberVO> getMemberList(SearchVO vo){
		return ss.selectList("adminmember.memberList", vo);
	}
	
	// ����¡
	public int totalCount(SearchVO svo) {
		return ss.selectOne("adminmember.totalCount", svo);
	}
	
	// ȸ�� ���
	public void getAddMember(MemberVO vo) {
		ss.insert("adminmember.add", vo);
	}
	
	// ȸ�� ���� ��
	public MemberVO getUpdateMemberForm(int mnum) {
		return ss.selectOne("adminmember.updateForm", mnum);
	}
	
	// ȸ�� ����
	public void getUpdateMember(MemberVO vo) {
		ss.update("adminmember.update", vo);
	}
	
	// ȸ�� ����
	public void getDeleteMember(int mnum) {
		ss.update("adminmember.delete", mnum);
	}
	
}
