package kr.co.kosmo.mvc.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aopalliance.intercept.Joinpoint;
import org.apache.catalina.Session;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.CartDao;
import kr.co.kosmo.mvc.dao.CartInter;
import kr.co.kosmo.mvc.dto.CartVO;
import kr.co.kosmo.mvc.dto.GaguItemVO;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.MemberVO;

@Controller
public class CartController {
	
	@Autowired
	private CartInter cartdao;
	
	// 외부에서 장바구니
		@RequestMapping("/sangpumDetail")
		public ModelAndView cartView(MemberVO vo, GaguVO dto,
				HttpSession session) {
			ModelAndView mav = new ModelAndView("cartList");
			try {
				mav.setViewName("cartList");
				//세션에서 회원 정보 갔고 오는데 Null이면 로그인폼으로 이동
				vo = (MemberVO) session.getAttribute("map");
				int mnum = vo.getMnum();
				//장바구니 리스트
				vo = cartdao.selectCart(mnum);
				mav.addObject("vo",vo);
			} catch (NullPointerException e) {
				mav.setViewName("redirect:loginform"); 
			}
			return mav;
		}
	
	// 장바구니 controller
	@RequestMapping("/cart")
	public ModelAndView cartViewinsert(MemberVO vo, CartVO cto, GaguVO gto,HttpSession session) {
		boolean check;
		ModelAndView mav = new ModelAndView("cartList");
		try {
			//세션에서 회원 정보 갔고 오는데 Null이면 로그인폼으로 이동
			MemberVO mvo = (MemberVO) session.getAttribute("map");
			 int mnum = mvo.getMnum();
			vo.setMnum(mnum);
			//상품 상세페이지에서 들어오면 세션에서 true값을 받아 옴
			check = (boolean) session.getAttribute("check");
			if(check) {
				//장바구니에 상품 담기
				cartdao.inCart(vo, gto, cto);
				session.setAttribute("check", false);
			}
			//장바구니 리스트
			vo = cartdao.selectCart(mnum);
			mav.addObject("vo",vo);
			} catch (NullPointerException e) {
				mav.setViewName("redirect:loginform"); 
			}
			return mav;
		}

	// 장바구니 상품 삭제
	@PostMapping("/deleteCartSel")					//배열로 값을 받아옴
	public void DelecteSel(MemberVO vo, CartVO cto, String[] chbox, HttpSession session) {
		vo = (MemberVO) session.getAttribute("map");
		int mnum = vo.getMnum();
		int result = 0;
		int cnum = 0;
		if (String.valueOf(mnum) != null) {
			cto.setMnum(mnum);
			//배열의 cnum을 받아서 담고 삭제 Mapper로 보냄
			for (String e : chbox) {
				cnum = Integer.parseInt(e);
				cto.setCnum(cnum);
				cartdao.delete(cto);
			}
		}
	}
	//선택한 하나의 값을 지움
	@PostMapping(value = "/deleteCart")
	public void Delecte(MemberVO vo, CartVO cto, @RequestParam(value = "chbox[]") List<String> chArr,
			HttpSession session) {
		vo = (MemberVO) session.getAttribute("map");
		int mnum = vo.getMnum();
		int result = 0;
		int cnum = 0;
		if (String.valueOf(mnum) != null) {
			cto.setMnum(mnum);
			//배열의 cnum을 받아서 담고 삭제 Mapper로 보냄
			for (String e : chArr) {
				cnum = Integer.parseInt(e);
				cto.setCnum(cnum);
				cartdao.delete(cto);
			}
		}
	}

	// 장바구니 수량 수정
	@PostMapping("/modefy")
	public void modefy(MemberVO vo, CartVO cto, GaguVO gto, HttpSession session) {
		vo = (MemberVO) session.getAttribute("map");
		int mnum = vo.getMnum();
		cartdao.modify(cto);
	}

	//체크한것 합계
	@ResponseBody
	@GetMapping("/checkSum")
	public String checkSum(@RequestParam(value = "checkS[]") List<Integer> check) {
		//숫자에  ',' 넣기위한 메서드
		DecimalFormat formatter = new DecimalFormat("###,###");
		int sum = 0;
		for(Integer e : check ) {
			sum += e;
		}
		String sumformat =  formatter.format(sum);	
		return sumformat;
	}
}
