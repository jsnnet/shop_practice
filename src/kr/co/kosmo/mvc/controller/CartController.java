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
	
	// �ܺο��� ��ٱ���
		@RequestMapping("/sangpumDetail")
		public ModelAndView cartView(MemberVO vo, GaguVO dto,
				HttpSession session) {
			ModelAndView mav = new ModelAndView("cartList");
			try {
				mav.setViewName("cartList");
				//���ǿ��� ȸ�� ���� ���� ���µ� Null�̸� �α��������� �̵�
				vo = (MemberVO) session.getAttribute("map");
				int mnum = vo.getMnum();
				//��ٱ��� ����Ʈ
				vo = cartdao.selectCart(mnum);
				mav.addObject("vo",vo);
			} catch (NullPointerException e) {
				mav.setViewName("redirect:loginform"); 
			}
			return mav;
		}
	
	// ��ٱ��� controller
	@RequestMapping("/cart")
	public ModelAndView cartViewinsert(MemberVO vo, CartVO cto, GaguVO gto,HttpSession session) {
		boolean check;
		ModelAndView mav = new ModelAndView("cartList");
		try {
			//���ǿ��� ȸ�� ���� ���� ���µ� Null�̸� �α��������� �̵�
			MemberVO mvo = (MemberVO) session.getAttribute("map");
			 int mnum = mvo.getMnum();
			vo.setMnum(mnum);
			//��ǰ ������������ ������ ���ǿ��� true���� �޾� ��
			check = (boolean) session.getAttribute("check");
			if(check) {
				//��ٱ��Ͽ� ��ǰ ���
				cartdao.inCart(vo, gto, cto);
				session.setAttribute("check", false);
			}
			//��ٱ��� ����Ʈ
			vo = cartdao.selectCart(mnum);
			mav.addObject("vo",vo);
			} catch (NullPointerException e) {
				mav.setViewName("redirect:loginform"); 
			}
			return mav;
		}

	// ��ٱ��� ��ǰ ����
	@PostMapping("/deleteCartSel")					//�迭�� ���� �޾ƿ�
	public void DelecteSel(MemberVO vo, CartVO cto, String[] chbox, HttpSession session) {
		vo = (MemberVO) session.getAttribute("map");
		int mnum = vo.getMnum();
		int result = 0;
		int cnum = 0;
		if (String.valueOf(mnum) != null) {
			cto.setMnum(mnum);
			//�迭�� cnum�� �޾Ƽ� ��� ���� Mapper�� ����
			for (String e : chbox) {
				cnum = Integer.parseInt(e);
				cto.setCnum(cnum);
				cartdao.delete(cto);
			}
		}
	}
	//������ �ϳ��� ���� ����
	@PostMapping(value = "/deleteCart")
	public void Delecte(MemberVO vo, CartVO cto, @RequestParam(value = "chbox[]") List<String> chArr,
			HttpSession session) {
		vo = (MemberVO) session.getAttribute("map");
		int mnum = vo.getMnum();
		int result = 0;
		int cnum = 0;
		if (String.valueOf(mnum) != null) {
			cto.setMnum(mnum);
			//�迭�� cnum�� �޾Ƽ� ��� ���� Mapper�� ����
			for (String e : chArr) {
				cnum = Integer.parseInt(e);
				cto.setCnum(cnum);
				cartdao.delete(cto);
			}
		}
	}

	// ��ٱ��� ���� ����
	@PostMapping("/modefy")
	public void modefy(MemberVO vo, CartVO cto, GaguVO gto, HttpSession session) {
		vo = (MemberVO) session.getAttribute("map");
		int mnum = vo.getMnum();
		cartdao.modify(cto);
	}

	//üũ�Ѱ� �հ�
	@ResponseBody
	@GetMapping("/checkSum")
	public String checkSum(@RequestParam(value = "checkS[]") List<Integer> check) {
		//���ڿ�  ',' �ֱ����� �޼���
		DecimalFormat formatter = new DecimalFormat("###,###");
		int sum = 0;
		for(Integer e : check ) {
			sum += e;
		}
		String sumformat =  formatter.format(sum);	
		return sumformat;
	}
}
