package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.dto.AttendVO;
import kr.co.kosmo.mvc.dto.GorderVO;
import kr.co.kosmo.mvc.dto.LoginLoggerVO;
import kr.co.kosmo.mvc.dto.MemberVO;
import kr.co.kosmo.mvc.dto.QnAVO;
import kr.co.kosmo.mvc.dto.SearchVO;

public interface MemberDaoInter {
	public void addMember(MemberVO vo); // ȸ������
	public int idChk(String id);		// ���̵� üũ
	public MemberVO loginCheck(MemberVO vo); // �α��� üũ
	public void addLoginLog(LoginLoggerVO logvo); // �α��� �α� ����
	public void updateMember(MemberVO vo); //ȸ������ ����
	public MemberVO insert(String mid); //ȸ������ �����
	public void delMember(String mid); //ȸ��Ż��
	public List<LoginLoggerVO> myLogPage(SearchVO svo); // �α��� �α� ���
	public int idpwdCheck(MemberVO vo);		//���̵�, ��й�ȣ ��ġ ���� �˻�
	public int getTotalCount(int mnum); // �α� ��� ������ ī��Ʈ
	public List<GorderVO> mypurchase(int mnum); //���ų�����ȸ
	public List<GorderVO> mypurchaseDetail(int onum);//���ų��� ����ȸ
	public List<QnAVO> myqna(String mid); //���������� ���ǳ��� Ȯ��
	public List<AttendVO> attendmbr(int mnum); //�⼮üũ 
	public void attCalendar(AttendVO vo);//�⼮üũ Ķ����
	public int attendCheck(int mnum);
	public List<AttendVO> attendToday(int mnum);
}
