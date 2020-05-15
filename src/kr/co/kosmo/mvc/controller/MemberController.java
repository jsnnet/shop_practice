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

	// 회원등록 폼으로 이동
	@RequestMapping("/addmemberform")
	public ModelAndView addAdminMemberForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("addMember");
		return mav;
	}

	// 회원등록 후 list로 이동
	@RequestMapping("/addmember")
	public ModelAndView addAdminMember(HttpServletRequest request, HttpServletResponse response, MemberVO vo) {
		ModelAndView mav = new ModelAndView("redirect:memberlist");
		dao.getAddMember(vo);
		return mav;
	}

	// 회원리스트
	@RequestMapping("/memberlist")
	public ModelAndView listAdminMember(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(defaultValue = "1") int page, MemberVO vo, SearchVO svo) {
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
		svo.setBegin(String.valueOf(startRow));
		svo.setEnd(String.valueOf(endRow));

		// 전체 레코드 수
		int totalRows = dao.totalCount(svo);

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

		ModelAndView mav = new ModelAndView("memberList");
		List<MemberVO> list = dao.getMemberList(svo);
		mav.addObject("list", list);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("searchType", svo.getSearchType());
		mav.addObject("searchValue", svo.getSearchValue());
		return mav;
	}

	// 회원 정보 수정 폼으로 이동
	@RequestMapping("/updatememberform")
	public ModelAndView updateAdminMemberForm(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("mnum") int mnum) {
		ModelAndView mav = new ModelAndView();
		MemberVO vo = dao.getUpdateMemberForm(mnum);
		mav.setViewName("updateForm");
		mav.addObject("vo", vo);
		return mav;
	}

	// 회원 정보 수정
	@RequestMapping("/updatemember")
	public ModelAndView updateAdminMember(HttpServletRequest request, HttpServletResponse response, MemberVO vo) {
		ModelAndView mav = new ModelAndView("redirect:memberlist");
		dao.getUpdateMember(vo);
		return mav;
	}

	// 회원 정보 삭제
	@RequestMapping("/deletemember")
	public ModelAndView deleteAdminMember(HttpServletRequest request, HttpServletResponse response, int mnum) {
		ModelAndView mav = new ModelAndView("redirect:memberlist");
		dao.getDeleteMember(mnum);
		return mav;
	}

}
