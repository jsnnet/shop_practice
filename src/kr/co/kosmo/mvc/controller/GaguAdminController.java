package kr.co.kosmo.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.GaguAdminDaoInter;
import kr.co.kosmo.mvc.dao.ReviewDao;
import kr.co.kosmo.mvc.dto.GaguItemVO;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.PageVO;
import kr.co.kosmo.mvc.dto.ReviewVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Controller
public class GaguAdminController {

	@Autowired
	private GaguAdminDaoInter gaguAdminDao;

	@Autowired
	private ReviewDao reviewDao;

	// ���� �߰� ������ �̵�
	@GetMapping(value = "gaguAddForm")
	public ModelAndView gaguAdminAddForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("gaguAdminAdd");
		List<GaguItemVO> list = gaguAdminDao.gaguItemList();
		mav.addObject("list", list);
		return mav;
	}

	// ���� �߰�
	@PostMapping(value = "gaguAdd")
	public ModelAndView gaguAdminAdd(HttpServletRequest request, HttpServletResponse response, GaguVO vo) {
		String img_path = "resources\\images\\shop\\products";
		String img_path2 = "resources\\images\\detail";
		String r_path = request.getSession().getServletContext().getRealPath("/");
		String oriFn = vo.getMultipartFile().getOriginalFilename();
		String oriFn2 = vo.getMultipartFile2().getOriginalFilename();
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
		StringBuffer path2 = new StringBuffer();
		path2.append(r_path).append(img_path2).append("\\");
		path2.append(oriFn2);
		File f2 = new File(path2.toString());
		try {
			vo.getMultipartFile2().transferTo(f2);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		vo.setGdetail(vo.getMultipartFile2().getOriginalFilename());

		gaguAdminDao.gaguAdd(vo);
		return new ModelAndView("redirect:/gaguAdminForm");
	}

	// ������ �⺻������ + �˻� + ����¡
	@RequestMapping(value = "gaguAdminForm")
	public ModelAndView gaguAdminForm(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "1") int page,
			SearchVO svo, String sortValue) {
		PageVO pageInfo = new PageVO();
		int rowsPerPage = 12; // ���������� ������ ���� ��
		int pagesPerBlock = 10; // ���������� ������ ��� ��
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
		svo.setSortValue(sortValue);
		// ��ü ���ڵ� ��
		int totalRows = gaguAdminDao.totalCount(svo);
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

		ModelAndView mav = new ModelAndView("gaguAdminMain");
		List<GaguVO> list = gaguAdminDao.gaguList(svo);
		ArrayList<Integer> gnums = new ArrayList<>();
		for (GaguVO gaguVO : list) {
			gnums.add(gaguVO.getGnum());
		}
		HttpSession session = request.getSession();
		session.setAttribute("gnums", gnums);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("searchType", svo.getSearchType());
		mav.addObject("searchValue", svo.getSearchValue());
		mav.addObject("sortValue", svo.getSortValue());
		mav.addObject("list", list);
		return mav;
	}

	// ������ ��ǰ���� ������, ������
	@SuppressWarnings("unchecked")
	@GetMapping(value = "AdminpreviewNext")
	public ModelAndView gaguAdminpreviewNext(HttpServletRequest request, HttpServletResponse response, int gnum, int pnType) {
		ModelAndView mav = new ModelAndView();
		ArrayList<Integer> gnums = (ArrayList<Integer>) request.getSession().getAttribute("gnums");
		int resultgnum = 0;
		if (pnType == 0) {
			// ������ǰ�϶�
			if (gnums.indexOf(gnum) > 0) {
				// ������ ó���� �ƴҶ�
				resultgnum = gnums.get(gnums.indexOf(gnum) - 1);
			} else {
				// ������ ó���϶�
				resultgnum = gnum;
			}
		} else {
			// ���Ļ�ǰ�϶�
			if (gnums.indexOf(gnum) < gnums.size() - 1) {
				// ������ �������� �ƴҶ�
				resultgnum = gnums.get(gnums.indexOf(gnum) + 1);
			} else {
				// ������ �������϶�
				resultgnum = gnum;
			}
		}
		mav.setViewName("redirect:gaguAdminDetail?gnum=" + resultgnum);
		return mav;
	}

	// ������ ���� �������� �̵� + ����
	@RequestMapping(value = "gaguAdminDetail")
	public ModelAndView gaguAdminDetail(HttpServletRequest request, HttpServletResponse response, SearchVO svo,
			@RequestParam(defaultValue = "1") int page) {
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

		ModelAndView mav = new ModelAndView("gaguAdminDetail");
		GaguVO vo = gaguAdminDao.gaguDetail(svo.getGnum());
		List<ReviewVO> rlist = reviewDao.getReviewList(svo);

		int rcount = reviewDao.getReviewCount(svo.getGnum());
		mav.addObject("rcount", rcount);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("rlist", rlist);
		mav.addObject("vo", vo);
		return mav;
	}

	// ������ ���� ���������� �̵�
	@GetMapping(value = "gaguUpdateForm")
	public ModelAndView gaguAdminUpdateForm(HttpServletRequest request, HttpServletResponse response, int gnum) {
		ModelAndView mav = new ModelAndView("gaguUpdateForm");
		GaguVO vo = gaguAdminDao.gaguDetail(gnum);
		List<GaguItemVO> list = gaguAdminDao.gaguItemList();
		mav.addObject("list", list);
		mav.addObject("vo", vo);
		return mav;
	}

	// ������ ���� ����
	@PostMapping(value = "gaguUpdate")
	public ModelAndView gaguAdminUpdate(HttpServletRequest request, HttpServletResponse response, GaguVO vo) {
		String img_path = "resources\\images\\shop\\products";
		String img_path2 = "resources\\images\\detail";
		String r_path = request.getSession().getServletContext().getRealPath("/");
		String oriFn = vo.getMultipartFile().getOriginalFilename();
		String oriFn2 = vo.getMultipartFile2().getOriginalFilename();
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
		StringBuffer path2 = new StringBuffer();
		path2.append(r_path).append(img_path2).append("\\");
		path2.append(oriFn2);
		File f2 = new File(path2.toString());
		try {
			vo.getMultipartFile2().transferTo(f2);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		vo.setGdetail(vo.getMultipartFile2().getOriginalFilename());
		gaguAdminDao.gaguUpdate(vo);
		return new ModelAndView("redirect:/gaguAdminDetail?gnum=" + vo.getGnum());
	}

	// ������ ���� ����
	@GetMapping(value = "gaguDelete")
	public ModelAndView gaguAdminDelete(HttpServletRequest request, HttpServletResponse response, int gnum) {
		ModelAndView mav = new ModelAndView("redirect:/gaguAdminForm");
		gaguAdminDao.gaguDelete(gnum);
		return mav;
	}

//	// ������ ���� �˻� + JSON
//	@ResponseBody
//	@GetMapping(value = "gaguSearch")
//	public ResponseEntity<List<GaguVO>> gaguSearch(SearchVO vo) throws UnsupportedEncodingException {
//		String val = URLDecoder.decode(vo.getSearchValue(), "EUC-KR");
//		vo.setSearchValue(val);
//		List<GaguVO> list = gaguAdminDao.gaguSearch(vo);
//		try {
//			return new ResponseEntity<>(list, HttpStatus.OK);
//		} catch (Exception e) {
//			return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
//		}
//	}
}
