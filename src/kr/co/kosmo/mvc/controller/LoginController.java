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

	// 로그인 폼
	@RequestMapping("/loginform")
	public String goLoginForm(HttpServletRequest request) {

		// 로그인 버튼 클릭 전 페이지 주소 저장
		HttpSession session = request.getSession();
		session.setAttribute("preurl", request.getHeader("Referer"));
		return "loginForm";
	}

	// 로그인
	@PostMapping("success")
	public ModelAndView successlogin(HttpServletRequest request, MemberVO mvo) {
		MemberVO map = memberDaoInter.loginCheck(mvo);
		HttpSession session = request.getSession();
		// 로그인 후 전 페이지로 이동
		String preurl = (String) session.getAttribute("preurl");
		String[] preurlarr = preurl.split("/", -1);
		String finalpreurl = "main";
		ModelAndView mav = new ModelAndView();
		if (map == null) {
			mav.setViewName("error");
		} else {
			session.setAttribute("map", map);
			// 로그인 후 전 페이지로 이동
			if (!map.getMadmin().equals("0") && !preurlarr[preurlarr.length - 1].equals("")
					&& !preurlarr[preurlarr.length - 1].equals("loginform")) {
				finalpreurl = preurlarr[preurlarr.length - 1];
			}
			mav.setViewName("redirect:/" + finalpreurl);
		}
		return mav;
	}

	// 아이디, 비밀번호 일치 여부 검사
	@PostMapping("/loginProcess")
	public ModelAndView loginProcess(HttpSession session, MemberVO vo, HttpServletRequest request) {
		int cnt = memberDaoInter.idpwdCheck(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("idchk");
		mav.addObject("cnt", cnt);
		return mav;
	}

	// 로그아웃
	@GetMapping("/logout")
	public ModelAndView successloginOutProcess(HttpSession session, HttpServletRequest request) {
		session.invalidate(); // 로그인한 사용자의 세션 삭제
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}

	// 로그인 로그 기록 출력 + 페이징
	@RequestMapping("/mylogpage")
	public ModelAndView noticeList(@RequestParam("page") int page, HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("map");
		PageVO pageInfo = new PageVO();
		int rowsPerPage = 10; // 한페이지당 보여줄 라인 수
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
		int mnum = mvo.getMnum();
		SearchVO svo = new SearchVO();
		svo.setBegin(String.valueOf(startRow));
		svo.setEnd(String.valueOf(endRow));
		svo.setSearchType(String.valueOf(mnum));

		// 전체 레코드 수
		int totalRows = memberDaoInter.getTotalCount(mnum);
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
		ModelAndView mav = new ModelAndView("myLogPage");
		List<LoginLoggerVO> list = memberDaoInter.myLogPage(svo);

		mav.addObject("list", list);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("mnum", mnum);

		return mav;
	}
}
