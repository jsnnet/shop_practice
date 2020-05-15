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

	// ����ڰ� �˻��� ��
	@After(value = "execution(* kr.co.kosmo.mvc.controller.SearchController.searchFrom(..))")
	public void SerarchLog(JoinPoint jp) {
		// --------------------------------------��ó�� ����
		Object[] fd = jp.getArgs();
		if (fd[1] instanceof SearchVO) {
			SearchVO svo = (SearchVO) fd[1];

			// DAO�� ���� VO ��ü ����
			SearchLogVO slvo = new SearchLogVO();
			String sldate = new SimpleDateFormat("yy/MM/dd").format(new Date());

			// �˻��� VO�� SET
			slvo.setSlvalue(svo.getSearchValue());
			slvo.setSldate(sldate);
			
			// �˻��� �αװ� �̹� �����ϴ��� Ȯ��
			int cnt = searchLogDao.SearchLogCheck(slvo);
			
			if (cnt == 0) { // ���� �αװ� ������ ���ο� �α� INSERT
				searchLogDao.SearchLogInsert(slvo);
			} else { // ���� �αװ� ������ ���� �α� UPDATE CNT + 1
				searchLogDao.SearchLogUpdate(slvo);
			}
		}
	}
}
