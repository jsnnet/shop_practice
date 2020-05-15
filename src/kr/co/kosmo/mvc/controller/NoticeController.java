package kr.co.kosmo.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.NoticeDao;
import kr.co.kosmo.mvc.dto.NoticeVO;
import kr.co.kosmo.mvc.dto.PageVO;
import kr.co.kosmo.mvc.dto.QnAVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeDao dao;
	
	//공지사항 작성폼
	@RequestMapping("/noticeForm")
	public ModelAndView notice_form() {
		ModelAndView mav = new ModelAndView("notice_form");
		return mav;
	}
	//공지사항 리스트
	@RequestMapping("/notice_list")
	public ModelAndView noticeList(int page, String searchType,String searchValue) {
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
		int totalRows = dao.notice_total(svo);
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
		ModelAndView mav = new ModelAndView("notice_list");
		List<NoticeVO> list = dao.notice_list(svo);
		
		mav.addObject("list", list);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("searchType", searchType);
		mav.addObject("searchValue", searchValue);
		return mav;

	}
	//공지사항 작성후 DB저장
	@RequestMapping("notice_write")
	public ModelAndView notice_write(NoticeVO vo) {
		ModelAndView mav = new ModelAndView("redirect:notice_list?page=1");
		dao.notice_ins(vo);
		return mav;
	}
	
	//공지사항 상세보기
	@RequestMapping("notice_detail")
	public ModelAndView notice_detail(@RequestParam("num")int num) {
		ModelAndView mav = new ModelAndView("notice_detail");
		NoticeVO vo = dao.notice_detail(num);
		mav.addObject("vo",vo);
		return mav;
	}
	
	//공지사항 삭제
	@RequestMapping("notice_delete")
	public String notice_delete(@RequestParam("num")int num) {
		dao.notice_delete(num);
		return "redirect:notice_list?page=1";
	}
	
	//공지사항 수정폼이동
	@RequestMapping("notice_upform")
	public ModelAndView notice_Upform(int num) {
		ModelAndView mav= new ModelAndView("notice_Upform");
		NoticeVO vo= dao.notice_detail(num);
		mav.addObject("vo",vo);
		return mav;
	}
	
	//공지사항 업데이트
	@RequestMapping("notice_update")
	public String notice_update(NoticeVO vo) {
		dao.notice_update(vo);
		return "redirect:notice_detail?num="+vo.getNnum();
	}
	
}
