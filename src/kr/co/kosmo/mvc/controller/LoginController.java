package kr.co.kosmo.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.dto.LoginLoggerVO;
import kr.co.kosmo.mvc.dto.MemberVO;
import kr.co.kosmo.mvc.dto.PageVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Controller
public class LoginController {

	@Autowired
	private MemberDaoInter memberDaoInter;

	// �α��� ��
	@RequestMapping("/loginform")
	public String goLoginForm(HttpServletRequest request) {

		// �α��� ��ư Ŭ�� �� ������ �ּ� ����
		HttpSession session = request.getSession();
		session.setAttribute("preurl", request.getHeader("Referer"));
		return "loginForm";
	}

	// �α���
	@PostMapping("success")
	public ModelAndView successlogin(HttpServletRequest request, MemberVO mvo) {
		MemberVO map = memberDaoInter.loginCheck(mvo);
		HttpSession session = request.getSession();
		// �α��� �� �� �������� �̵�
		String preurl = (String) session.getAttribute("preurl");
		String[] preurlarr = preurl.split("/", -1);
		String finalpreurl = "main";
		ModelAndView mav = new ModelAndView();
		if (map == null) {
			mav.setViewName("error");
		} else {
			session.setAttribute("map", map);
			// �α��� �� �� �������� �̵�
			if (!map.getMadmin().equals("0") && !preurlarr[preurlarr.length - 1].equals("")
					&& !preurlarr[preurlarr.length - 1].equals("loginform")) {
				finalpreurl = preurlarr[preurlarr.length - 1];
			}
			mav.setViewName("redirect:/" + finalpreurl);
		}
		return mav;
	}

	// ���̵�, ��й�ȣ ��ġ ���� �˻�
	@PostMapping("/loginProcess")
	public ModelAndView loginProcess(HttpSession session, MemberVO vo, HttpServletRequest request) {
		int cnt = memberDaoInter.idpwdCheck(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("idchk");
		mav.addObject("cnt", cnt);
		return mav;
	}

	// �α׾ƿ�
	@GetMapping("/logout")
	public ModelAndView successloginOutProcess(HttpSession session, HttpServletRequest request) {
		session.invalidate(); // �α����� ������� ���� ����
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}

	// �α��� �α� ��� ��� + ����¡
	@RequestMapping("/mylogpage")
	public ModelAndView noticeList(@RequestParam("page") int page, HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("map");
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
		int mnum = mvo.getMnum();
		SearchVO svo = new SearchVO();
		svo.setBegin(String.valueOf(startRow));
		svo.setEnd(String.valueOf(endRow));
		svo.setSearchType(String.valueOf(mnum));

		// ��ü ���ڵ� ��
		int totalRows = memberDaoInter.getTotalCount(mnum);
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
		ModelAndView mav = new ModelAndView("myLogPage");
		List<LoginLoggerVO> list = memberDaoInter.myLogPage(svo);

		mav.addObject("list", list);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("mnum", mnum);

		return mav;
	}
}
