package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.dto.AttendVO;
import kr.co.kosmo.mvc.dto.GorderVO;
import kr.co.kosmo.mvc.dto.LoginLoggerVO;
import kr.co.kosmo.mvc.dto.MemberVO;
import kr.co.kosmo.mvc.dto.QnAVO;
import kr.co.kosmo.mvc.dto.SearchVO;

public interface MemberDaoInter {
	public void addMember(MemberVO vo); // 회원가입
	public int idChk(String id);		// 아이디 체크
	public MemberVO loginCheck(MemberVO vo); // 로그인 체크
	public void addLoginLog(LoginLoggerVO logvo); // 로그인 로그 저장
	public void updateMember(MemberVO vo); //회원정보 수정
	public MemberVO insert(String mid); //회원정보 보기용
	public void delMember(String mid); //회원탈퇴
	public List<LoginLoggerVO> myLogPage(SearchVO svo); // 로그인 로그 기록
	public int idpwdCheck(MemberVO vo);		//아이디, 비밀번호 일치 여부 검사
	public int getTotalCount(int mnum); // 로그 기록 페이지 카운트
	public List<GorderVO> mypurchase(int mnum); //구매내역조회
	public List<GorderVO> mypurchaseDetail(int onum);//구매내역 상세조회
	public List<QnAVO> myqna(String mid); //마이페이지 문의내역 확인
	public List<AttendVO> attendmbr(int mnum); //출석체크 
	public void attCalendar(AttendVO vo);//출석체크 캘린더
	public int attendCheck(int mnum);
	public List<AttendVO> attendToday(int mnum);
}
