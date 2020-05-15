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

	// 사용자가 상품 상세페이지 클릭 시 작동
	@Around(value = "execution(* kr.co.kosmo.mvc.controller.GaguController.gaguDetail(..))")
	public Object LikeProductLog(ProceedingJoinPoint pjp) throws Throwable {
		// --------------------------------------전처리 시작
		Object[] fd = pjp.getArgs();
		if (fd[0] instanceof HttpServletRequest && fd[1] instanceof Integer) {
			HttpServletRequest request = (HttpServletRequest) fd[0];
			// 사용자가 클릭한 가구번호
			int gnum = (int) fd[1];
			HttpSession session = request.getSession(false);
			try {
				// 회원 로그인 여부 확인
				if (session.getAttribute("map") == null) {
					System.out.println("MemberVO is Null");
				} else {
					// 로그인한 회원 정보 세션에서 가져오기
					MemberVO mvo = (MemberVO) session.getAttribute("map");

					// DAO를 위한 VO 객체 생성
					ProductLogVO pvo = new ProductLogVO();
					// VO에 회원번호와 클릭한 가구번호 SET
					pvo.setMnum(mvo.getMnum());
					pvo.setGnum(gnum);

					// 회원이 클릭한 가구의 가구종류번호 가져오기
					int ginum = likeProductDao.LikeProductLogGinumSelect(gnum);

					// 기존 로그 여부 판단
					int cnt = likeProductDao.LikeProductLogCheck(pvo);

					// 클릭한 가구종류번호 VO에 SET
					pvo.setGinum(ginum);
					if (cnt == 0) {
						// 기존 로그가 없으면 새로운 로그 INSERT
						likeProductDao.LikeProductLogAdd(pvo);
					} else {
						// 기존 로그가 있으면 기존 로그 UPDATE CNT + 1
						likeProductDao.LikeProductLogUpdate(pvo);
					}

					// 가장 많이 클릭한 가구종류번호 가져오기
					// 이 회원의 전체 로그 중 클릭 수 RANK = 1 가져옴
					int favoritesGinum = likeProductDao.LikeProductLogMemberGinumSelect(pvo.getMnum());

					// 가장 많이 클릭한 가구종류번호에 해당하는 가구 4개 LIST로 가져오기
					// 정렬 - 평균 평점이 높은 순
					List<GaguVO> favoritesList = likeProductDao.LikeProductGaguList(favoritesGinum);
					// --------------------------------------전처리 끝
					ModelAndView mav = (ModelAndView) pjp.proceed();
					// --------------------------------------후처리 시작
					mav.addObject("favoritesList", favoritesList);
					// --------------------------------------후처리 끝
					return mav;
				}
			} catch (NullPointerException e) {
				// 세션이 없거나 만료됐을때
				System.out.println("Session is Null");
			}
		}
		// --------------------------------------전처리 끝 - 로그인 중이 아닐경우
		ModelAndView mav = (ModelAndView) pjp.proceed();
		return mav;
	}
}
