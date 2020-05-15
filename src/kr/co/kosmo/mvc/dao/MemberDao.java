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

	// 회원가입
	@Override
	public void addMember(MemberVO vo) {
		ss.insert("usermember.join", vo);
	}

	// 아이디 중복 체크
	@Override
	public int idChk(String mid) {
		return ss.selectOne("usermember.idChk", mid);
	}

	// 아이디,비밀번호 체크
	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return ss.selectOne("usermember.loginChk", vo);
	}

	// 로그인 로그 저장
	@Override
	public void addLoginLog(LoginLoggerVO logvo) {
		ss.insert("usermember.loginlog", logvo);
	}

	// 로그인 기록 보기
	public List<LoginLoggerVO> myLogPage(SearchVO svo) {
		return ss.selectList("usermember.mylog", svo);
	}

	// 로그 페이징 row수
	@Override
	public int getTotalCount(int mnum) {
		return ss.selectOne("usermember.logtotalCount", mnum);
	}

	// 회원 정보 수정
	@Override
	public void updateMember(MemberVO vo) {
		ss.update("usermember.updateMember", vo);
	}

	// 회원 정보 리스트
	@Override
	public MemberVO insert(String mid) {
		return ss.selectOne("usermember.ins", mid);
	}

	// 회원 탈퇴 하기
	@Override
	public void delMember(String mid) {
		ss.delete("usermember.deleteMember", mid);
	}

	// 회원 구매내역 조회
	@Override
	public List<GorderVO> mypurchase(int mnum) {
		List<GorderVO> list = ss.selectList("usermember.purchase", mnum);
		return list;
	}

	// 회원 상세구매내역 조회
	@Override
	public List<GorderVO> mypurchaseDetail(int onum) {
		List<GorderVO> list = ss.selectList("usermember.purchaseDetail", onum);
		return list;
	}

	// 회원 문의내역 조회
	@Override
	public List<QnAVO> myqna(String mid) {
		return ss.selectList("usermember.myqna1", mid);
	}

	// 아이디, 비밀번호 일치 여부 검사
	@Override
	public int idpwdCheck(MemberVO vo) {
		return ss.selectOne("usermember.idpwdCheck", vo);
	}

	// 회원 출석체크 캘린더
	@Override
	public List<AttendVO> attendmbr(int mnum) {
		return ss.selectList("usermember.attend", mnum);
	}

	// 회원 출석체크
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
