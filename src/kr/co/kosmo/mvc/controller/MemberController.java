package kr.co.kosmo.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.AdminMemberDao;
import kr.co.kosmo.mvc.dto.MemberVO;
import kr.co.kosmo.mvc.dto.PageVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Controller
public class MemberController {

	@Autowired
	private AdminMemberDao dao;

	// ȸ����� ������ �̵�
	@RequestMapping("/addmemberform")
	public ModelAndView addAdminMemberForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("addMember");
		return mav;
	}

	// ȸ����� �� list�� �̵�
	@RequestMapping("/addmember")
	public ModelAndView addAdminMember(HttpServletRequest request, HttpServletResponse response, MemberVO vo) {
		ModelAndView mav = new ModelAndView("redirect:memberlist");
		dao.getAddMember(vo);
		return mav;
	}

	// ȸ������Ʈ
	@RequestMapping("/memberlist")
	public ModelAndView listAdminMember(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(defaultValue = "1") int page, MemberVO vo, SearchVO svo) {
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
		int totalRows = dao.totalCount(svo);

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

		ModelAndView mav = new ModelAndView("memberList");
		List<MemberVO> list = dao.getMemberList(svo);
		mav.addObject("list", list);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("searchType", svo.getSearchType());
		mav.addObject("searchValue", svo.getSearchValue());
		return mav;
	}

	// ȸ�� ���� ���� ������ �̵�
	@RequestMapping("/updatememberform")
	public ModelAndView updateAdminMemberForm(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("mnum") int mnum) {
		ModelAndView mav = new ModelAndView();
		MemberVO vo = dao.getUpdateMemberForm(mnum);
		mav.setViewName("updateForm");
		mav.addObject("vo", vo);
		return mav;
	}

	// ȸ�� ���� ����
	@RequestMapping("/updatemember")
	public ModelAndView updateAdminMember(HttpServletRequest request, HttpServletResponse response, MemberVO vo) {
		ModelAndView mav = new ModelAndView("redirect:memberlist");
		dao.getUpdateMember(vo);
		return mav;
	}

	// ȸ�� ���� ����
	@RequestMapping("/deletemember")
	public ModelAndView deleteAdminMember(HttpServletRequest request, HttpServletResponse response, int mnum) {
		ModelAndView mav = new ModelAndView("redirect:memberlist");
		dao.getDeleteMember(mnum);
		return mav;
	}

}
