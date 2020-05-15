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

	// �����ڰ� �ƴ� �� ��������
	@Around(value = "execution(* kr.co.kosmo.mvc.controller.*.*Admin*(..))")
	public ModelAndView AdminCheck(ProceedingJoinPoint pjp) throws Throwable {
		Object[] fd = pjp.getArgs();
		if (fd[0] instanceof HttpServletRequest && fd[1] instanceof HttpServletResponse) {
			HttpServletRequest request = (HttpServletRequest) fd[0];
			HttpServletResponse response = (HttpServletResponse) fd[1];
			HttpSession session = request.getSession();
			try {
				MemberVO mvo = (MemberVO) session.getAttribute("map");
				// ���������� �ƴ��� Ȯ��
				// 0 �̸� ������
				if (mvo.getMadmin().equals("0")) {
					ModelAndView mav = (ModelAndView) pjp.proceed();
					return mav;
				} else {
					// ȸ���� �α����� ���
					// ��� �޼����� ���� ����ȭ������ �̵� 
					PrintWriter out = response.getWriter();
				    response.setContentType("text/html; charset=euc-kr");
				    out.println("<script>alert('���������� �����Դϴ�.');");
				    out.println("location.href='error';</script>");
				    out.flush();
				}
			} catch (NullPointerException e) {
				// �α��� ���� ���
				// ��� �޼����� ���� ����ȭ������ �̵� 
				PrintWriter out = response.getWriter();
			    response.setContentType("text/html; charset=euc-kr");
			    out.println("<script>alert('���������� �����Դϴ�.');");
			    out.println("location.href='error';</script>");
			    out.flush();
			}
		}
		return null;
	}
}
