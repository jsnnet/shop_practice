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
	
	//�������� �ۼ���
	@RequestMapping("/noticeForm")
	public ModelAndView notice_form() {
		ModelAndView mav = new ModelAndView("notice_form");
		return mav;
	}
	//�������� ����Ʈ
	@RequestMapping("/notice_list")
	public ModelAndView noticeList(int page, String searchType,String searchValue) {
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

		SearchVO svo = new SearchVO();
		svo.setBegin(String.valueOf(startRow));
		svo.setEnd(String.valueOf(endRow));
		svo.setSearchType(searchType);
		svo.setSearchValue(searchValue);

		// ��ü ���ڵ� ��
		int totalRows = dao.notice_total(svo);
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
		// -------------------------------
		ModelAndView mav = new ModelAndView("notice_list");
		List<NoticeVO> list = dao.notice_list(svo);
		
		mav.addObject("list", list);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("searchType", searchType);
		mav.addObject("searchValue", searchValue);
		return mav;

	}
	//�������� �ۼ��� DB����
	@RequestMapping("notice_write")
	public ModelAndView notice_write(NoticeVO vo) {
		ModelAndView mav = new ModelAndView("redirect:notice_list?page=1");
		dao.notice_ins(vo);
		return mav;
	}
	
	//�������� �󼼺���
	@RequestMapping("notice_detail")
	public ModelAndView notice_detail(@RequestParam("num")int num) {
		ModelAndView mav = new ModelAndView("notice_detail");
		NoticeVO vo = dao.notice_detail(num);
		mav.addObject("vo",vo);
		return mav;
	}
	
	//�������� ����
	@RequestMapping("notice_delete")
	public String notice_delete(@RequestParam("num")int num) {
		dao.notice_delete(num);
		return "redirect:notice_list?page=1";
	}
	
	//�������� �������̵�
	@RequestMapping("notice_upform")
	public ModelAndView notice_Upform(int num) {
		ModelAndView mav= new ModelAndView("notice_Upform");
		NoticeVO vo= dao.notice_detail(num);
		mav.addObject("vo",vo);
		return mav;
	}
	
	//�������� ������Ʈ
	@RequestMapping("notice_update")
	public String notice_update(NoticeVO vo) {
		dao.notice_update(vo);
		return "redirect:notice_detail?num="+vo.getNnum();
	}
	
}
