package kr.co.kosmo.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.MemberDao;
import kr.co.kosmo.mvc.dto.AttendVO;
import kr.co.kosmo.mvc.dto.GorderVO;
import kr.co.kosmo.mvc.dto.MemberVO;
import kr.co.kosmo.mvc.dto.QnAVO;

@Controller
public class MypageController {

	// ���������� dao�� �ҷ��������� autowired
	@Autowired
	MemberDao memberdao;

	// ���������� ������ �������� ����������
	@RequestMapping("/mypageinfo")
	public ModelAndView mypageinfo() {
		ModelAndView mav = new ModelAndView("mypageinfo");
		return mav;
	}

	// ���������� ȸ������,Ż���������� �̵��Ǵ���
	@RequestMapping("/mypageform")
	public ModelAndView mypage(HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("map");
		String mid = mvo.getMid();
		ModelAndView mav = new ModelAndView("mypageform");
		MemberVO vo = memberdao.insert(mid);
		mav.addObject("list", vo);
		return mav;
	}

	// ���������� �������
	@RequestMapping("/upmember")
	public ModelAndView updateMember1(MemberVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:mypageform");
		memberdao.updateMember(vo);
		HttpSession session = request.getSession();
		MemberVO map = memberdao.loginCheck(vo);
		session.setAttribute("map", map);
		return mav;

	}

	// ���������� �������
	@RequestMapping("/memberDelete")
	public ModelAndView delmember(HttpSession session, String mid) {
		// String mid = (String) session.getAttribute("mid");
		ModelAndView mav = new ModelAndView("redirect:/");
		memberdao.delMember(mid);
		try {
			session.invalidate();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		}
		return mav;
	}
	// ���������� �⼮üũ

	// ���������� ���ų�����ȸ
	@RequestMapping("purchaseHistory")
	public ModelAndView mypurchaseForm(@RequestParam("mnum") int mnum) {
		ModelAndView mav = new ModelAndView("mypagepurchase");
		List<GorderVO> list = memberdao.mypurchase(mnum);
		mav.addObject("list", list);
		return mav;
	}

	// ���ų��� �󼼺���
	@RequestMapping("purchaseDetail")
	public ModelAndView mypurchaseDetail(@RequestParam("onum") int onum) {
		ModelAndView mav = new ModelAndView("mypurchase_Detail");
		List<GorderVO> list = memberdao.mypurchaseDetail(onum);
		mav.addObject("list", list);
		return mav;
	}

	// ���������� ���ǻ��� ��ȸ
	@RequestMapping("myqnapage")
	public ModelAndView myqnapage1(@RequestParam("mid") String mid) {
		ModelAndView mav = new ModelAndView("mypageqna");
		List<QnAVO> list = memberdao.myqna(mid);
		mav.addObject("list", list);
		return mav;

	}

	@RequestMapping("attend")
	public ModelAndView myattend(AttendVO vo, HttpSession session) {
		List<AttendVO> vlist = new ArrayList<AttendVO>();
		MemberVO mvo = (MemberVO) session.getAttribute("map");
		int mnum = mvo.getMnum();
		ModelAndView mav = new ModelAndView("mypageattend");
		vlist = memberdao.attendmbr(mnum);
		mav.addObject("vlist", vlist);
		return mav;
	}

	// ���������� ������ �̵�����
	@GetMapping("/calendardate")
	@ResponseBody
	public List<AttendVO> viewcal(AttendVO vo, HttpSession session) {

		List<AttendVO> vlist = new ArrayList<AttendVO>();
		MemberVO mvo = (MemberVO) session.getAttribute("map");
		int mnum = mvo.getMnum();

		vlist = memberdao.attendmbr(mnum);

		return vlist;

	}

	@GetMapping(value = "calendarcheck")
	@ResponseBody
	public List<AttendVO> test2(AttendVO vo, HttpSession session) {
		List<AttendVO> vlist = new ArrayList<AttendVO>();
		MemberVO mvo = (MemberVO) session.getAttribute("map");
		int mnum = mvo.getMnum();
		int calCheck = memberdao.attendCheck(mnum);
		if (calCheck == 0) {
			vo.setTitle("�⼮");
			vo.setMnum(mnum);
			memberdao.attCalendar(vo);
			vlist = memberdao.attendToday(mnum);
			return vlist;
		}

		return null;
	}
}
