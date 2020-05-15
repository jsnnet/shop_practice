package kr.co.kosmo.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.StockInter;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.PageVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Controller
public class StockController {
	@Autowired
	private StockInter stockDao;

	@RequestMapping("/stockFrom")
	public ModelAndView stockAdminList(HttpServletRequest request, HttpServletResponse response, String searchType,
			String searchValue, @RequestParam(defaultValue = "1") int page) {
		ModelAndView mav = new ModelAndView("stockList");
		// ------------------------------------------------
		PageVO pageInfo = new PageVO();
		int rowsPerPage = 10; // ���������� ������ ���� ��
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
		SearchVO svo = new SearchVO();
		svo.setBegin(String.valueOf(startRow));
		svo.setEnd(String.valueOf(endRow));
		svo.setSearchType(searchType);
		svo.setSearchValue(searchValue);
		// ��ü ���ڵ� ��
		int totalRows = stockDao.gagu_total(svo);
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

		// ------------------------------------------------
		List<GaguVO> gvo = stockDao.gagu_list(svo);
		List<GaguVO> stvo = stockDao.stock();
		mav.addObject("gvo", gvo);
		mav.addObject("stvo", stvo);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("searchType", searchType);
		mav.addObject("searchValue", searchValue);
		return mav;
	}
	//��� ������ ������Ʈ
	@ResponseBody
	@PostMapping("/stockUp")
	public List<GaguVO> stockUp(int gnum, int stock) {
		stockDao.stockUp(gnum, stock);
		List<GaguVO> stvo = stockDao.stock();
		return stvo;
	}
}
