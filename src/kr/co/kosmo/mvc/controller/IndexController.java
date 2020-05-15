package kr.co.kosmo.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.ChartListDao;
import kr.co.kosmo.mvc.dao.IndexDao;
import kr.co.kosmo.mvc.dao.SearchLogDao;
import kr.co.kosmo.mvc.dto.ChartVO;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.SearchLogVO;

@Controller
public class IndexController {

	@Autowired
	private IndexDao indexDao;
	@Autowired
	private ChartListDao chartDao;
	@Autowired
	private SearchLogDao searchLogDao;

	@RequestMapping(value = { "/", "/main" })
	public ModelAndView indexPage(HttpSession session) {
		ModelAndView mav = new ModelAndView("index");
		List<GaguVO> list = indexDao.getRecentlyGagu();
		List<SearchLogVO> slist = searchLogDao.SearchLogRankList();
		ChartVO cvo = chartDao.chartSumList();
		ChartVO svo = chartDao.chartStar();
		ChartVO mvo = chartDao.chartMoney();
		ChartVO dvo = chartDao.chartDate();
		mav.addObject("list", list);
		mav.addObject("cvo", cvo);
		mav.addObject("svo", svo);
		mav.addObject("mvo", mvo);
		mav.addObject("dvo", dvo);
		session.setAttribute("slist", slist);
		List<ChartVO> rvo = chartDao.chartRanking();
		mav.addObject("rvo", rvo);
		return mav;
	}

	@RequestMapping(value = "error")
	public String errorPage() {
		return "error";
	}
}
