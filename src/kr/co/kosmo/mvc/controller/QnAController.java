package kr.co.kosmo.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.QnACommDao;
import kr.co.kosmo.mvc.dao.QnaDao;
import kr.co.kosmo.mvc.dto.PageVO;
import kr.co.kosmo.mvc.dto.QnAVO;
import kr.co.kosmo.mvc.dto.SearchVO;
import kr.co.kosmo.mvc.dto.QnaCommVO;

@Controller
public class QnAController {

	@Autowired
	private QnaDao dao;

	@Autowired
	private QnACommDao cdao;

	// QnA작성하는 폼으로 이동
	@RequestMapping("/qnaform")
	public ModelAndView qnaform() {
		ModelAndView mav = new ModelAndView("qnaform");
		return mav;
	}

	// 작성후 DB저장
	@RequestMapping("/qna_write")
	public ModelAndView qnaWrite(QnAVO vo) {
		ModelAndView mav = new ModelAndView("redirect:qna_list?page=1");
		dao.qna_write(vo);
		return mav;
	}

	// QnA리스트조회
	@RequestMapping(value = "qna_list")
	public ModelAndView qnaList(String searchType, String searchValue, @RequestParam(defaultValue = "1") int page) {
		PageVO pageInfo = new PageVO();
		int rowsPerPage = 5; // 한페이지당 보여줄 라인 수
		int pagesPerBlock = 5; // 한페이지당 보여줄 블록 수
		int currentPage = page; // 현재 페이지
		int currentBlock = 0; // 현재 블록수

		if (currentPage % pagesPerBlock == 0) { // 현재 블록에 대한 연산
			currentBlock = currentPage / pagesPerBlock;
		} else {
			currentBlock = currentPage / pagesPerBlock + 1;
		}

		int startRow = (currentPage - 1) * rowsPerPage + 1;
		int endRow = currentPage * rowsPerPage;

		SearchVO svo = new SearchVO();
		svo.setBegin(String.valueOf(startRow));
		svo.setEnd(String.valueOf(endRow));
		svo.setSearchType(searchType);
		svo.setSearchValue(searchValue);

		// 전체 레코드 수
		int totalRows = dao.qna_total(svo);

		int totalPages = 0;

		// 전체 페이지를 구하는 공식
		if (totalRows % rowsPerPage == 0) {
			totalPages = totalRows / rowsPerPage;
		} else {
			totalPages = totalRows / rowsPerPage + 1;
		}

		// 전체 블록을 구하는 공식
		int totalBlocks = 0;
		if (totalPages % pagesPerBlock == 0) {
			totalBlocks = totalPages / pagesPerBlock;
		} else {
			totalBlocks = totalPages / pagesPerBlock + 1;
		}

		// PageVO에 setter로 값을 주입.
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setCurrentBlock(currentBlock);
		pageInfo.setRowsPerPage(rowsPerPage);
		pageInfo.setPagesPerBlock(pagesPerBlock);
		pageInfo.setStartRows(startRow);
		pageInfo.setEndRows(endRow);
		pageInfo.setTotalRows(totalRows);
		pageInfo.setTotalPages(totalPages);
		pageInfo.setTotalBlocks(totalBlocks);
		// -------------------------------
		ModelAndView mav = new ModelAndView("qna_list");
		List<QnAVO> list = dao.qna_list(svo);
		
		mav.addObject("list", list);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("searchType", searchType);
		mav.addObject("searchValue", searchValue);
		return mav;
	}

	// QnA게시물 삭제
	@RequestMapping("/qna_delete")
	public ModelAndView qnaDelete(@RequestParam("num") int num) {
		ModelAndView mav = new ModelAndView();
		dao.qna_delete(num);
		mav.setViewName("redirect:qna_list?page=1");
		return mav;
	}

	// QnA게시물 수정폼이동
	@RequestMapping("/qna_upform")
	public ModelAndView qnaUpForm(@RequestParam("num") int num) {
		ModelAndView mav = new ModelAndView();
		QnAVO vo = dao.qna_detail(num);
		mav.addObject("vo", vo);
		mav.setViewName("qna_Upform");
		return mav;
	}

	// QnA게시물 업데이트
	@PostMapping("/qna_update")
	public ModelAndView qnaUpdate(QnAVO vo) {
		ModelAndView mav = new ModelAndView("redirect:qna_detailForm?num=" + vo.getQnum());
		dao.qna_update(vo);
		return mav;
	}

	// QnA상세보기
	@RequestMapping("/qna_detailForm")
	public ModelAndView qnaDetail(@RequestParam("num") int num) {
		ModelAndView mav = new ModelAndView("qna_detail");
		QnAVO vo = dao.qna_detail(num);
		List<QnaCommVO> list = cdao.qnacomm_list(num);
		mav.addObject("vo", vo);
		mav.addObject("list", list);
		return mav;
	}
}
