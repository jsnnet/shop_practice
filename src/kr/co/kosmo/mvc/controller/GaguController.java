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
		int rowsPerPage = 9; // ���������� ������ ���� ��
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
		svo.setSearchValue(String.valueOf(ginum));

		// ��ü ���ڵ� ��
		int totalRows = dao.getGaguTotal(ginum);
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

	// ������, ������
	@SuppressWarnings("unchecked")
	@GetMapping(value = "previewNext")
	public ModelAndView previewNext(int gnum, int pnType, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ArrayList<Integer> gnums = (ArrayList<Integer>) session.getAttribute("gnums");
		if (gnums != null) {
			int resultgnum = 0;
			if (pnType == 0) {
				// �����϶�
				if (gnums.indexOf(gnum) > 0) {
					// ������ ó���� �ƴҶ�
					resultgnum = gnums.get(gnums.indexOf(gnum) - 1);
				} else {
					// ������ ó���϶�
					resultgnum = gnum;
				}
			} else {
				// �����϶�
				if (gnums.indexOf(gnum) < gnums.size() - 1) {
					// ������ �������� �ƴҶ�
					resultgnum = gnums.get(gnums.indexOf(gnum) + 1);
				} else {
					// ������ �������϶�
					resultgnum = gnum;
				}
			}
			mav.setViewName("redirect:gaguShopDetail?gnum=" + resultgnum);
		} else {
			mav.setViewName("redirect:gaguShopDetail?gnum=" + gnum);
		}
		return mav;
	}

	// ���� �������� �̵� + ����
	@RequestMapping(value = "gaguShopDetail")
	public ModelAndView gaguDetail(HttpServletRequest request, int gnum, @RequestParam(defaultValue = "1") int page,
			SearchVO svo, HttpServletResponse response, HttpSession session) {
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
		int totalRows = reviewDao.totalCount(svo.getGnum());
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
		// ---------------------------------------------------
		ModelAndView mav = new ModelAndView("gaguShopDetail");
		GaguVO vo = dao.gaguDetail(svo.getGnum());
		List<ReviewVO> rlist = reviewDao.getReviewList(svo);
		// ���� list�� ���� ������� ��
		int rcount = reviewDao.getReviewCount(svo.getGnum());
		mav.addObject("rcount", rcount);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("rlist", rlist);
		mav.addObject("vo", vo);
		// ---------------------------------------------------
		// ��ٱ��� insert �񱳰�
		session.setAttribute("check", true);
		// ---------------------------------------------------
		//�ֱ� �� ��ǰ ��Ű
		Cookie lateCookie;
		String cookieValue;
		String addcookieValue = "";
		//��Ű �� �޾ƿ���
		Cookie[] getCookie = request.getCookies();
		//map �ʱ�ȭ
		Map<String, String> cookiemap = new HashMap<String, String>();
		//map�� ��Ű �� �ֱ�
		for (Cookie cookie : getCookie) {
			cookiemap.put(cookie.getName(), cookie.getValue());
			for (String mapkey : cookiemap.keySet()) {
				//��Ű�� key���� ���� �� �ֱ� �� ��ǰ key ��Ű �߰�
				if (!mapkey.equals("key")) {
					//��Ű�� ���� �� ����
					cookieValue = vo.getGnum() + "/" + vo.getGpicture() + "#";
					//��Ű ���� �� �� ����
					lateCookie = new Cookie("key", cookieValue);
					//��Ű 7�� �� �ڵ� ����
					lateCookie.setMaxAge(60 * 60 * 24 * 7);
					//��Ű Ȱ��ȭ
					response.addCookie(lateCookie);
				//��Ű key�� ���� ��
				} else if (mapkey.equals("key")) {
					//��Ű���� ���� ���� '#'���� ����
					String[] cookieval = cookiemap.get(mapkey).split("#");
					cookieValue = vo.getGnum() + "/" + vo.getGpicture() + "#";
					//�ߺ� ��ǰ üũ �� �ֱ� �� ��ǰ �տ� ���
					for (String e : cookieval) {
						if (!e.equals(cookieValue.split("#")[0])) {
							cookieValue += e + "#";
						}
					}
					//�ߺ���ǰ üũ �� ��Ű ���� 5���� �����ϱ� ���ؼ� '#'���� �ε����� ����
					cookieval = cookieValue.split("#");
					//���� Ȯ�� �� 5���� ���� �� �缳��
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

	// [�ӽ÷� ���� DB�� ���� ��]
	@GetMapping(value = "/dbSaveForm")
	public String dbSave() {
		return "dbSaveForm";
	}

	// [�ӽ÷� ���� DB�� ���� ��] �˰���
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
