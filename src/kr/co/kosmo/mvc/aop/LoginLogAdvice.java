package kr.co.kosmo.mvc.aop;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dto.LoginLoggerVO;
import kr.co.kosmo.mvc.dto.MemberVO;
import kr.co.kosmo.mvc.dao.MemberDaoInter;

@Controller
@Aspect
public class LoginLogAdvice {

	@Autowired
	private MemberDaoInter memberDaoInter;

	// �α��� �� �α� !: �α׹�ȣ , ȸ����ȣ , �α��λ���(�ξƿ�����) , ��¥ , ������ �ּ�
	@Around("execution(* kr.co.kosmo.mvc.controller.LoginController.success*(..))")
	public ModelAndView loginAdvice(ProceedingJoinPoint jp) {
		Object[] fd = jp.getArgs();
		ModelAndView rpath = null;
		String methodName = jp.getSignature().getName();
		if (methodName.equals("successlogin")) {
			LoginLoggerVO logvo = new LoginLoggerVO();
			try {
				rpath = (ModelAndView) jp.proceed();
				if (fd[0] instanceof HttpServletRequest) {
					// vo���� �ִ� ��
					HttpServletRequest request = (HttpServletRequest) fd[0];
					HttpSession session = request.getSession();
					MemberVO vo = (MemberVO) session.getAttribute("map");
					String mid = vo.getMid();
					int mnum = vo.getMnum();
					if (mid == null) {
					} else {
						logvo.setMnum(mnum); // ȸ����ȣ
						logvo.setLlstatus("login"); // �α��� ���� (login, logout)
						logvo.setReip(request.getRemoteAddr()); // �α����� �������ּ�
						memberDaoInter.addLoginLog(logvo);
					}
				}
			} catch (Throwable e) {
				e.printStackTrace();
			}
			// �α׾ƿ� �� �α� !: �α׹�ȣ , ȸ����ȣ , �α��λ���(�ξƿ�����) , ��¥ , ������ �ּ�
		} else if (methodName.equals("successloginOutProcess")) {
			try {
				LoginLoggerVO logvo = new LoginLoggerVO();
				if (fd[0] instanceof HttpSession && fd[1] instanceof HttpServletRequest) {
					HttpSession session = (HttpSession) fd[0];
					HttpServletRequest request = (HttpServletRequest) fd[1];
					MemberVO vo = (MemberVO) session.getAttribute("map");
					String mid = vo.getMid();
					int mnum = vo.getMnum();
					if (mid == null) {
					} else {
						logvo.setMnum(mnum);
						logvo.setLlstatus("logout");
						logvo.setReip(request.getRemoteAddr());
						memberDaoInter.addLoginLog(logvo);
					}
				}
				rpath = (ModelAndView) jp.proceed();
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		return rpath;
	}
}