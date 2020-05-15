package kr.co.kosmo.mvc.aop;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dto.MemberVO;

@Controller
@Aspect
public class AdminCheckAdvice {

	// 관리자가 아닐 시 접근제한
	@Around(value = "execution(* kr.co.kosmo.mvc.controller.*.*Admin*(..))")
	public ModelAndView AdminCheck(ProceedingJoinPoint pjp) throws Throwable {
		Object[] fd = pjp.getArgs();
		if (fd[0] instanceof HttpServletRequest && fd[1] instanceof HttpServletResponse) {
			HttpServletRequest request = (HttpServletRequest) fd[0];
			HttpServletResponse response = (HttpServletResponse) fd[1];
			HttpSession session = request.getSession();
			try {
				MemberVO mvo = (MemberVO) session.getAttribute("map");
				// 관리자인지 아닌지 확인
				// 0 이면 관리자
				if (mvo.getMadmin().equals("0")) {
					ModelAndView mav = (ModelAndView) pjp.proceed();
					return mav;
				} else {
					// 회원이 로그인한 경우
					// 경고 메세지를 띄우고 메인화면으로 이동 
					PrintWriter out = response.getWriter();
				    response.setContentType("text/html; charset=euc-kr");
				    out.println("<script>alert('비정상적인 접근입니다.');");
				    out.println("location.href='error';</script>");
				    out.flush();
				}
			} catch (NullPointerException e) {
				// 로그인 안한 경우
				// 경고 메세지를 띄우고 메인화면으로 이동 
				PrintWriter out = response.getWriter();
			    response.setContentType("text/html; charset=euc-kr");
			    out.println("<script>alert('비정상적인 접근입니다.');");
			    out.println("location.href='error';</script>");
			    out.flush();
			}
		}
		return null;
	}
}
