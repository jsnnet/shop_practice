package kr.co.kosmo.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.dto.MemberVO;

@Controller
public class JoinController {
	
	@Autowired
	private MemberDaoInter memberDaoInter;
	
	// ȸ������ ��
	@RequestMapping("/signinform")
	public String goSigninForm() {
		return "signinForm";
	}
	// ȸ������
	@RequestMapping("/memberjoin")
	public String memberJoin(MemberVO vo) {
		memberDaoInter.addMember(vo);
		return "redirect:/main";
	}
	
	// ���̵� üũ
	@RequestMapping("/idcheck")
	public String idCheck(@RequestParam("mid") String mid, Model m) {
		int cnt = memberDaoInter.idChk(mid);
		m.addAttribute("cnt", cnt);
		return "idchk";
	}
}