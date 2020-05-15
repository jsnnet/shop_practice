package kr.co.kosmo.mvc.aop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.LikeProductDaoInter;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.MemberVO;
import kr.co.kosmo.mvc.dto.ProductLogVO;

@Controller
@Aspect
public class LikeProductAdvice {

	@Autowired
	private LikeProductDaoInter likeProductDao;

	// ����ڰ� ��ǰ �������� Ŭ�� �� �۵�
	@Around(value = "execution(* kr.co.kosmo.mvc.controller.GaguController.gaguDetail(..))")
	public Object LikeProductLog(ProceedingJoinPoint pjp) throws Throwable {
		// --------------------------------------��ó�� ����
		Object[] fd = pjp.getArgs();
		if (fd[0] instanceof HttpServletRequest && fd[1] instanceof Integer) {
			HttpServletRequest request = (HttpServletRequest) fd[0];
			// ����ڰ� Ŭ���� ������ȣ
			int gnum = (int) fd[1];
			HttpSession session = request.getSession(false);
			try {
				// ȸ�� �α��� ���� Ȯ��
				if (session.getAttribute("map") == null) {
					System.out.println("MemberVO is Null");
				} else {
					// �α����� ȸ�� ���� ���ǿ��� ��������
					MemberVO mvo = (MemberVO) session.getAttribute("map");

					// DAO�� ���� VO ��ü ����
					ProductLogVO pvo = new ProductLogVO();
					// VO�� ȸ����ȣ�� Ŭ���� ������ȣ SET
					pvo.setMnum(mvo.getMnum());
					pvo.setGnum(gnum);

					// ȸ���� Ŭ���� ������ ����������ȣ ��������
					int ginum = likeProductDao.LikeProductLogGinumSelect(gnum);

					// ���� �α� ���� �Ǵ�
					int cnt = likeProductDao.LikeProductLogCheck(pvo);

					// Ŭ���� ����������ȣ VO�� SET
					pvo.setGinum(ginum);
					if (cnt == 0) {
						// ���� �αװ� ������ ���ο� �α� INSERT
						likeProductDao.LikeProductLogAdd(pvo);
					} else {
						// ���� �αװ� ������ ���� �α� UPDATE CNT + 1
						likeProductDao.LikeProductLogUpdate(pvo);
					}

					// ���� ���� Ŭ���� ����������ȣ ��������
					// �� ȸ���� ��ü �α� �� Ŭ�� �� RANK = 1 ������
					int favoritesGinum = likeProductDao.LikeProductLogMemberGinumSelect(pvo.getMnum());

					// ���� ���� Ŭ���� ����������ȣ�� �ش��ϴ� ���� 4�� LIST�� ��������
					// ���� - ��� ������ ���� ��
					List<GaguVO> favoritesList = likeProductDao.LikeProductGaguList(favoritesGinum);
					// --------------------------------------��ó�� ��
					ModelAndView mav = (ModelAndView) pjp.proceed();
					// --------------------------------------��ó�� ����
					mav.addObject("favoritesList", favoritesList);
					// --------------------------------------��ó�� ��
					return mav;
				}
			} catch (NullPointerException e) {
				// ������ ���ų� ���������
				System.out.println("Session is Null");
			}
		}
		// --------------------------------------��ó�� �� - �α��� ���� �ƴҰ��
		ModelAndView mav = (ModelAndView) pjp.proceed();
		return mav;
	}
}
