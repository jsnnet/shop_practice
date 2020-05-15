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

	// 로그인 시 로그 !: 로그번호 , 회원번호 , 로그인상태(인아웃상태) , 날짜 , 아이피 주소
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
					// vo값이 있는 놈
					HttpServletRequest request = (HttpServletRequest) fd[0];
					HttpSession session = request.getSession();
					MemberVO vo = (MemberVO) session.getAttribute("map");
					String mid = vo.getMid();
					int mnum = vo.getMnum();
					if (mid == null) {
					} else {
						logvo.setMnum(mnum); // 회원번호
						logvo.setLlstatus("login"); // 로그인 상태 (login, logout)
						logvo.setReip(request.getRemoteAddr()); // 로그인한 아이피주소
						memberDaoInter.addLoginLog(logvo);
					}
				}
			} catch (Throwable e) {
				e.printStackTrace();
			}
			// 로그아웃 시 로그 !: 로그번호 , 회원번호 , 로그인상태(인아웃상태) , 날짜 , 아이피 주소
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