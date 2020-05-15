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
	
	// 회원 조회
	public List<MemberVO> getMemberList(SearchVO vo){
		return ss.selectList("adminmember.memberList", vo);
	}
	
	// 페이징
	public int totalCount(SearchVO svo) {
		return ss.selectOne("adminmember.totalCount", svo);
	}
	
	// 회원 등록
	public void getAddMember(MemberVO vo) {
		ss.insert("adminmember.add", vo);
	}
	
	// 회원 수정 폼
	public MemberVO getUpdateMemberForm(int mnum) {
		return ss.selectOne("adminmember.updateForm", mnum);
	}
	
	// 회원 수정
	public void getUpdateMember(MemberVO vo) {
		ss.update("adminmember.update", vo);
	}
	
	// 회원 삭제
	public void getDeleteMember(int mnum) {
		ss.update("adminmember.delete", mnum);
	}
	
}
