package kr.co.kosmo.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.ReviewDao;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.MemberVO;
import kr.co.kosmo.mvc.dto.PageVO;
import kr.co.kosmo.mvc.dto.ReviewVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Controller
public class ReviewController {
	@Autowired
	private ReviewDao reviewDao;

	// ���� ���
	@RequestMapping("/addreview")
	public ModelAndView addReview(HttpSession session, ReviewVO vo) {
		reviewDao.getAddReview(vo);
		MemberVO mvo = (MemberVO) session.getAttribute("map");
		String madmin = mvo.getMadmin();
		if (madmin.equals("0")) {
			return new ModelAndView("redirect:gaguAdminDetail?gnum=" + vo.getGnum());
		} else {
			return new ModelAndView("redirect:gaguShopDetail?gnum=" + vo.getGnum());
		}
	}

	// ���� ���丸 ���
	@RequestMapping("/myreviewlist")
	public ModelAndView myReview(HttpSession session, @RequestParam(defaultValue = "1") int page, SearchVO svo) {
		ModelAndView mav = new ModelAndView("mypageReview");
		MemberVO mvo = (MemberVO) session.getAttribute("map");
		String mid = mvo.getMid();
		int rcount = reviewDao.getMyReviewCount(mid);
		// -------------------
		PageVO pageInfo = new PageVO();
		int rowsPerPage = 5; // ���������� ������ ���� ��
		int pagesPerBlock = 5; // ���������� ������ ��� ��
		int currentPage = page; // ���� ������
		int currentBlock = 0; // ���� ��ϼ�
		if (currentPage % pagesPerBlock == 0) { // ���� ��Ͽ� ���� ����
			currentBlock = currentPage / pagesPerBlock;
		} else {
			currentBlock = currentPage / pagesPerBlock + 1;
		}
		int startRow = (currentPage - 1) * rowsPerPage + 1;
		int endRow = currentPage * rowsPerPage;
		svo.setBegin(String.valueOf(startRow));
		svo.setEnd(String.valueOf(endRow));
		// ��ü ���ڵ� ��
		int totalRows = rcount;
		int totalPages = 0;
		// ��ü �������� ���ϴ� ����
		if (totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		} else {
			totalPages = totalRows / rowsPerPage + 1;
		}
		// ��ü ����� ���ϴ� ����
		int totalBlocks = 0;
		if (totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		} else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		// PageVO�� setter�� ���� ����.
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setCurrentBlock(currentBlock);
		pageInfo.setRowsPerPage(rowsPerPage);
		pageInfo.setPagesPerBlock(pagesPerBlock);
		pageInfo.setStartRows(startRow);
		pageInfo.setEndRows(endRow);
		pageInfo.setTotalRows(totalRows);
		pageInfo.setTotalPages(totalPages);
		pageInfo.setTotalBlocks(totalBlocks);

		// ------------------------------------------
		svo.setMid(mid);
		List<ReviewVO> rlist = reviewDao.getMyReviewList(svo);
		GaguVO gvo = new GaguVO();
		mav.addObject("gvo", gvo);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("rcount", rcount);
		mav.addObject("rlist", rlist);
		return mav;
	}

	// ���� ���� ��
	@RequestMapping("/updatereviewform")
	public ModelAndView updateReviewForm(int rnum) {
		ModelAndView mav = new ModelAndView("updateReviewForm");
		ReviewVO vo = reviewDao.getUpdateReviewForm(rnum);
		mav.addObject("vo", vo);
		return mav;
	}

	// ���� ����
	@RequestMapping("/updatereview")
	public ModelAndView updateReview(HttpSession session, ReviewVO vo) {
		ModelAndView mav = new ModelAndView();
		reviewDao.getUpdateReview(vo);
		MemberVO mvo = (MemberVO) session.getAttribute("map");
		String madmin = mvo.getMadmin();
		if (madmin.equals("0")) {
			mav.setViewName("redirect:gaguAdminDetail?gnum=" + vo.getGnum());
		} else {
			mav.setViewName("redirect:gaguShopDetail?gnum=" + vo.getGnum());
		}
		mav.addObject("vo", vo);
		return mav;
	}

	// ���� ����
	@RequestMapping("/deletereview")
	public ModelAndView deleteReview(HttpSession session, ReviewVO vo) {
		ModelAndView mav = new ModelAndView();
		MemberVO mvo = (MemberVO) session.getAttribute("map");
		String madmin = mvo.getMadmin();
		if (madmin.equals("0")) {
			mav.setViewName("redirect:gaguAdminDetail?gnum=" + vo.getGnum());
		} else {
			mav.setViewName("redirect:gaguShopDetail?gnum=" + vo.getGnum());
		}
		reviewDao.getDeleteReview(vo.getRnum());
		return mav;
	}

}
