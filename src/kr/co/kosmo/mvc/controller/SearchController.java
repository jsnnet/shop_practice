package kr.co.kosmo.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.SearchDao;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.PageVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Controller
public class SearchController {
	@Autowired
	private SearchDao searchdao;

	@RequestMapping(value = "searchform")
	public ModelAndView searchFrom(@RequestParam(defaultValue = "1") int page, SearchVO svo, String sortValue) {
		PageVO pageInfo = new PageVO();
		int rowsPerPage = 12; // 한페이지당 보여줄 라인 수
		int pagesPerBlock = 10; // 한페이지당 보여줄 블록 수
		int currentPage = page; // 현재 페이지
		int currentBlock = 0; // 현재 블록수w
		if (currentPage % pagesPerBlock == 0) { // 현재 블록에 대한 연산
			currentBlock = currentPage / pagesPerBlock;
		} else {
			currentBlock = currentPage / pagesPerBlock + 1;
		}
		int startRow = (currentPage - 1) * rowsPerPage + 1;
		int endRow = currentPage * rowsPerPage;
		svo.setBegin(String.valueOf(startRow));
		svo.setEnd(String.valueOf(endRow));
		// 전체 레코드 수
		int totalRows = searchdao.totalcount(svo);
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
		// ---------------------------------------------------

		ModelAndView mav = new ModelAndView("searchform");
		List<GaguVO> list = searchdao.searchlist(svo);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("searchType", svo.getSearchType());
		mav.addObject("searchValue", svo.getSearchValue());
		mav.addObject("list", list);
		return mav;
	}

	@ResponseBody 
	@RequestMapping(value = "searchValueEx")
	public List<String> searchValueEx(String searchValue) {
		List<String> glist = searchdao.searchValueEx(searchValue);
		return glist;
	}

}
