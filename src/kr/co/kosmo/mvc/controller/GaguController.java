package kr.co.kosmo.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.GaguAdminDao;
import kr.co.kosmo.mvc.dao.GaguDao;
import kr.co.kosmo.mvc.dao.ReviewDao;
import kr.co.kosmo.mvc.dto.GaguItemVO;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.PageVO;
import kr.co.kosmo.mvc.dto.ReviewVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Controller
public class GaguController {

	@Autowired
	private GaguDao dao;

	@Autowired
	private ReviewDao reviewDao;

	@GetMapping(value = "/gaguShop")
	public ModelAndView gaguListView(@RequestParam("ginum") int ginum, HttpSession session,
			@RequestParam(defaultValue = "1") int page) {
		PageVO pageInfo = new PageVO();
		int rowsPerPage = 9; // 한페이지당 보여줄 라인 수
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
		svo.setSearchValue(String.valueOf(ginum));

		// 전체 레코드 수
		int totalRows = dao.getGaguTotal(ginum);
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

		ModelAndView mav = new ModelAndView();
		List<GaguVO> list = dao.getGaguList(svo);
		GaguItemVO gvo = dao.getGaguItemList(ginum);

		ArrayList<Integer> gnums = new ArrayList<>();
		for (GaguVO gaguVO : list) {
			gnums.add(gaguVO.getGnum());
		}
		session.setAttribute("gnums", gnums);
		mav.addObject("list", list);
		mav.addObject("gvo", gvo);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("searchType", svo.getSearchType());
		mav.addObject("searchValue", svo.getSearchValue());
		mav.addObject("ginum", ginum);
		mav.setViewName("gaguShop");
		return mav;
	}

	// 이전글, 다음글
	@SuppressWarnings("unchecked")
	@GetMapping(value = "previewNext")
	public ModelAndView previewNext(int gnum, int pnType, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ArrayList<Integer> gnums = (ArrayList<Integer>) session.getAttribute("gnums");
		if (gnums != null) {
			int resultgnum = 0;
			if (pnType == 0) {
				// 이전일때
				if (gnums.indexOf(gnum) > 0) {
					// 순서가 처음이 아닐때
					resultgnum = gnums.get(gnums.indexOf(gnum) - 1);
				} else {
					// 순서가 처음일때
					resultgnum = gnum;
				}
			} else {
				// 이후일때
				if (gnums.indexOf(gnum) < gnums.size() - 1) {
					// 순서가 마지막이 아닐때
					resultgnum = gnums.get(gnums.indexOf(gnum) + 1);
				} else {
					// 순서가 마지막일때
					resultgnum = gnum;
				}
			}
			mav.setViewName("redirect:gaguShopDetail?gnum=" + resultgnum);
		} else {
			mav.setViewName("redirect:gaguShopDetail?gnum=" + gnum);
		}
		return mav;
	}

	// 가구 상세페이지 이동 + 리뷰
	@RequestMapping(value = "gaguShopDetail")
	public ModelAndView gaguDetail(HttpServletRequest request, int gnum, @RequestParam(defaultValue = "1") int page,
			SearchVO svo, HttpServletResponse response, HttpSession session) {
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
		int totalRows = reviewDao.totalCount(svo.getGnum());
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
		ModelAndView mav = new ModelAndView("gaguShopDetail");
		GaguVO vo = dao.gaguDetail(svo.getGnum());
		List<ReviewVO> rlist = reviewDao.getReviewList(svo);
		// 리뷰 list에 값이 들어있을 때
		int rcount = reviewDao.getReviewCount(svo.getGnum());
		mav.addObject("rcount", rcount);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("rlist", rlist);
		mav.addObject("vo", vo);
		// ---------------------------------------------------
		// 장바구니 insert 비교값
		session.setAttribute("check", true);
		// ---------------------------------------------------
		//최근 본 상품 쿠키
		Cookie lateCookie;
		String cookieValue;
		String addcookieValue = "";
		//쿠키 값 받아오기
		Cookie[] getCookie = request.getCookies();
		//map 초기화
		Map<String, String> cookiemap = new HashMap<String, String>();
		//map에 쿠키 값 넣기
		for (Cookie cookie : getCookie) {
			cookiemap.put(cookie.getName(), cookie.getValue());
			for (String mapkey : cookiemap.keySet()) {
				//쿠키에 key값이 없을 시 최근 본 상품 key 쿠키 추가
				if (!mapkey.equals("key")) {
					//쿠키에 넣을 값 설정
					cookieValue = vo.getGnum() + "/" + vo.getGpicture() + "#";
					//쿠키 생성 및 값 저장
					lateCookie = new Cookie("key", cookieValue);
					//쿠키 7일 후 자동 삭제
					lateCookie.setMaxAge(60 * 60 * 24 * 7);
					//쿠키 활성화
					response.addCookie(lateCookie);
				//쿠키 key가 있을 시
				} else if (mapkey.equals("key")) {
					//쿠키에서 받은 값을 '#'으로 나눔
					String[] cookieval = cookiemap.get(mapkey).split("#");
					cookieValue = vo.getGnum() + "/" + vo.getGpicture() + "#";
					//중복 상품 체크 및 최근 본 상품 앞에 등록
					for (String e : cookieval) {
						if (!e.equals(cookieValue.split("#")[0])) {
							cookieValue += e + "#";
						}
					}
					//중복상품 체크 후 쿠키 갯수 5개로 제한하기 위해서 '#'으로 인덱스를 나눔
					cookieval = cookieValue.split("#");
					//갯수 확인 후 5개가 넘을 시 재설정
					if (cookieval.length >= 5) {
						addcookieValue = cookieval[0] + "#" + cookieval[1] + "#" + cookieval[2] + "#" + cookieval[3]
								+ "#" + cookieval[4] + "#";
						lateCookie = new Cookie("key", addcookieValue);
						lateCookie.setMaxAge(60 * 60 * 24 * 7);
						response.addCookie(lateCookie);
					} else {
						lateCookie = new Cookie("key", cookieValue);
						lateCookie.setMaxAge(60 * 60 * 24 * 7);
						response.addCookie(lateCookie);
					}
				}
			}
		}
		return mav;
	}

	// [임시로 만든 DB에 저장 폼]
	@GetMapping(value = "/dbSaveForm")
	public String dbSave() {
		return "dbSaveForm";
	}

	// [임시로 만든 DB에 저장 폼] 알고리즘
	@RequestMapping(value = "/dbsave", method = RequestMethod.POST)
	public ModelAndView save(GaguVO vo, HttpServletRequest request) {
		String img_path = "resources\\imgfile";
		String r_path = request.getSession().getServletContext().getRealPath("/");
		String oriFn = vo.getMultipartFile().getOriginalFilename();
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\");
		path.append(oriFn);
		File f = new File(path.toString());
		try {
			vo.getMultipartFile().transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		vo.setGpicture(vo.getMultipartFile().getOriginalFilename());
		dao.saveGagu(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:dbSaveForm");
		return mav;
	}

}
