package kr.co.kosmo.mvc.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.CartInter;
import kr.co.kosmo.mvc.dao.GorderInter;
import kr.co.kosmo.mvc.dto.CartVO;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.GorderDetailVO;
import kr.co.kosmo.mvc.dto.GorderListVO;
import kr.co.kosmo.mvc.dto.GorderVO;
import kr.co.kosmo.mvc.dto.MemberVO;
import kr.co.kosmo.mvc.service.GorderServiceInter;

@Controller
public class GorderController {
	@Autowired
	private GorderInter gorder;
	@Autowired
	private GorderServiceInter gorderService;
	@Autowired
	private CartInter cartdao;

	// 장바구니에서 구매창으로 전달
	@RequestMapping("/gorder")
	public ModelAndView gorder1(MemberVO vo, CartVO cto, GaguVO gto,
			@RequestParam(value = "chbox[]", required = false) String[] chbox, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int priceSum = 0;
		try {
			//세션 값이 Null이 아니면 실행
			session.getAttribute("map");
			mav.setViewName("gorder");
			//구매 선택한 상품 목록 리스트
			MemberVO mem = gorder.gorderlist(chbox);
			List<CartVO> list = mem.getCart();
			//구매 할 상품들의 금액의 총합
			for (CartVO e : list) {
				priceSum += e.getGagu().getGprice() * e.getChit();
			}
			mav.addObject("mem", mem);
			mav.addObject("list", list);
			mav.addObject("priceSum", priceSum);
		} catch (NullPointerException e) {
			e.printStackTrace();
			mav.setViewName("redirect:loginform");
		}
		return mav;
	}
	//상품 상세페이지에서 구매 창 이동
	@RequestMapping("/gorderDet")
	public ModelAndView gorderDet(MemberVO vo, CartVO cto, GaguVO gto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int priceSum = 0;
		try {
			//세션 값이 Null이 아니면 실행
			vo = (MemberVO) session.getAttribute("map");
			//장바구니에 상품 등록
			cartdao.inCart(vo, gto, cto);
			//cnum 가져오기
			cto = gorder.gorderCnum();
			//배열 초기화
			String[] chbox = new String[1];
			chbox[0] = String.valueOf(cto.getCnum());
			session.getAttribute("map");
			mav.setViewName("gorder");
			//구매 선택한 상품 목록 리스트
			MemberVO mem = gorder.gorderlist(chbox);
			List<CartVO> list = mem.getCart();
			//구매 할 상품들의 금액의 총합
			for (CartVO e : list) {
				priceSum += e.getGagu().getGprice() * e.getChit();
			}
			mav.addObject("mem", mem);
			mav.addObject("list", list);
			mav.addObject("priceSum", priceSum);
		} catch (NullPointerException e) {
			e.printStackTrace();
			mav.setViewName("redirect:loginform");
		}
		return mav;
	}
	// 가구 상세페이지에서 구매
	@RequestMapping("/gordersubmit")
	public ModelAndView gorderDetail(GorderListVO glvo, GorderVO gvo, HttpSession session) {
		ModelAndView mav = new ModelAndView("gorderend");
		//mnum값 세션에서 가져옴
		MemberVO vo = (MemberVO) session.getAttribute("map");
		int mnum = vo.getMnum();
		gvo.setMnum(mnum);
		try {//트렌젝션 처리
			gorderService.twoadd(glvo, gvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}
