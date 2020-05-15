package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.AttendVO;
import kr.co.kosmo.mvc.dto.GorderVO;
import kr.co.kosmo.mvc.dto.LoginLoggerVO;
import kr.co.kosmo.mvc.dto.MemberVO;
import kr.co.kosmo.mvc.dto.QnAVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Repository
public class MemberDao implements MemberDaoInter {

	@Autowired
	private SqlSessionTemplate ss;

	// ȸ������
	@Override
	public void addMember(MemberVO vo) {
		ss.insert("usermember.join", vo);
	}

	// ���̵� �ߺ� üũ
	@Override
	public int idChk(String mid) {
		return ss.selectOne("usermember.idChk", mid);
	}

	// ���̵�,��й�ȣ üũ
	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return ss.selectOne("usermember.loginChk", vo);
	}

	// �α��� �α� ����
	@Override
	public void addLoginLog(LoginLoggerVO logvo) {
		ss.insert("usermember.loginlog", logvo);
	}

	// �α��� ��� ����
	public List<LoginLoggerVO> myLogPage(SearchVO svo) {
		return ss.selectList("usermember.mylog", svo);
	}

	// �α� ����¡ row��
	@Override
	public int getTotalCount(int mnum) {
		return ss.selectOne("usermember.logtotalCount", mnum);
	}

	// ȸ�� ���� ����
	@Override
	public void updateMember(MemberVO vo) {
		ss.update("usermember.updateMember", vo);
	}

	// ȸ�� ���� ����Ʈ
	@Override
	public MemberVO insert(String mid) {
		return ss.selectOne("usermember.ins", mid);
	}

	// ȸ�� Ż�� �ϱ�
	@Override
	public void delMember(String mid) {
		ss.delete("usermember.deleteMember", mid);
	}

	// ȸ�� ���ų��� ��ȸ
	@Override
	public List<GorderVO> mypurchase(int mnum) {
		List<GorderVO> list = ss.selectList("usermember.purchase", mnum);
		return list;
	}

	// ȸ�� �󼼱��ų��� ��ȸ
	@Override
	public List<GorderVO> mypurchaseDetail(int onum) {
		List<GorderVO> list = ss.selectList("usermember.purchaseDetail", onum);
		return list;
	}

	// ȸ�� ���ǳ��� ��ȸ
	@Override
	public List<QnAVO> myqna(String mid) {
		return ss.selectList("usermember.myqna1", mid);
	}

	// ���̵�, ��й�ȣ ��ġ ���� �˻�
	@Override
	public int idpwdCheck(MemberVO vo) {
		return ss.selectOne("usermember.idpwdCheck", vo);
	}

	// ȸ�� �⼮üũ Ķ����
	@Override
	public List<AttendVO> attendmbr(int mnum) {
		return ss.selectList("usermember.attend", mnum);
	}

	// ȸ�� �⼮üũ
	@Override
	public void attCalendar(AttendVO vo) {
		ss.insert("usermember.attendclins", vo);
	}

	@Override
	public int attendCheck(int mnum) {
		return ss.selectOne("usermember.attendCheck", mnum);
	}

	@Override
	public List<AttendVO> attendToday(int mnum) {
		return ss.selectList("usermember.attendToday", mnum);
	}
}
