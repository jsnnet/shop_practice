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

	// ��ٱ��Ͽ��� ����â���� ����
	@RequestMapping("/gorder")
	public ModelAndView gorder1(MemberVO vo, CartVO cto, GaguVO gto,
			@RequestParam(value = "chbox[]", required = false) String[] chbox, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int priceSum = 0;
		try {
			//���� ���� Null�� �ƴϸ� ����
			session.getAttribute("map");
			mav.setViewName("gorder");
			//���� ������ ��ǰ ��� ����Ʈ
			MemberVO mem = gorder.gorderlist(chbox);
			List<CartVO> list = mem.getCart();
			//���� �� ��ǰ���� �ݾ��� ����
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
	//��ǰ ������������ ���� â �̵�
	@RequestMapping("/gorderDet")
	public ModelAndView gorderDet(MemberVO vo, CartVO cto, GaguVO gto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int priceSum = 0;
		try {
			//���� ���� Null�� �ƴϸ� ����
			vo = (MemberVO) session.getAttribute("map");
			//��ٱ��Ͽ� ��ǰ ���
			cartdao.inCart(vo, gto, cto);
			//cnum ��������
			cto = gorder.gorderCnum();
			//�迭 �ʱ�ȭ
			String[] chbox = new String[1];
			chbox[0] = String.valueOf(cto.getCnum());
			session.getAttribute("map");
			mav.setViewName("gorder");
			//���� ������ ��ǰ ��� ����Ʈ
			MemberVO mem = gorder.gorderlist(chbox);
			List<CartVO> list = mem.getCart();
			//���� �� ��ǰ���� �ݾ��� ����
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
	// ���� ������������ ����
	@RequestMapping("/gordersubmit")
	public ModelAndView gorderDetail(GorderListVO glvo, GorderVO gvo, HttpSession session) {
		ModelAndView mav = new ModelAndView("gorderend");
		//mnum�� ���ǿ��� ������
		MemberVO vo = (MemberVO) session.getAttribute("map");
		int mnum = vo.getMnum();
		gvo.setMnum(mnum);
		try {//Ʈ������ ó��
			gorderService.twoadd(glvo, gvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}
