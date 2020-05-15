package kr.co.kosmo.mvc.aop;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import kr.co.kosmo.mvc.dao.SearchLogDaoInter;
import kr.co.kosmo.mvc.dto.SearchLogVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Controller
@Aspect
public class SerarchLogAdvice {

	@Autowired
	private SearchLogDaoInter searchLogDao;

	// 사용자가 검색할 때
	@After(value = "execution(* kr.co.kosmo.mvc.controller.SearchController.searchFrom(..))")
	public void SerarchLog(JoinPoint jp) {
		// --------------------------------------전처리 시작
		Object[] fd = jp.getArgs();
		if (fd[1] instanceof SearchVO) {
			SearchVO svo = (SearchVO) fd[1];

			// DAO를 위한 VO 객체 생성
			SearchLogVO slvo = new SearchLogVO();
			String sldate = new SimpleDateFormat("yy/MM/dd").format(new Date());

			// 검색어 VO에 SET
			slvo.setSlvalue(svo.getSearchValue());
			slvo.setSldate(sldate);
			
			// 검색어 로그가 이미 존재하는지 확인
			int cnt = searchLogDao.SearchLogCheck(slvo);
			
			if (cnt == 0) { // 기존 로그가 없으면 새로운 로그 INSERT
				searchLogDao.SearchLogInsert(slvo);
			} else { // 기존 로그가 있으면 기존 로그 UPDATE CNT + 1
				searchLogDao.SearchLogUpdate(slvo);
			}
		}
	}
}
