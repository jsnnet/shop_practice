package kr.co.kosmo.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.QnACommDao;
import kr.co.kosmo.mvc.dto.QnaCommVO;

@Controller
public class QnACommController {
	
	@Autowired
	private QnACommDao dao;
	
	@RequestMapping(value = "qnacomm_insert")
	public ModelAndView qnac_Reple(QnaCommVO vo) {
		ModelAndView mav = new ModelAndView("redirect:qna_detailForm?num="+vo.getQnum());
		dao.qnacomm_ins(vo);
		return mav;
	}
	
	@RequestMapping("qnacomm_delete")
	public ModelAndView qnacomm_del(@RequestParam("qcnum")int qcnum,@RequestParam("qnum")int qnum) {
		ModelAndView mav = new ModelAndView("redirect:qna_detailForm?num="+qnum);
		dao.qnacomm_delete(qcnum);
		return mav;
	}
	
	@RequestMapping("qnacomm_upform")
	public ModelAndView qnacomm_upform(@RequestParam("qcnum")int qcnum,@RequestParam("qnum")int qnum) {
		ModelAndView mav = new ModelAndView("qnacomm_upform");
		QnaCommVO vo = dao.qnacomm_detail(qcnum);
		mav.addObject("vo",vo);
		mav.addObject("qnum",qnum);
		return mav;
	}
	
	@RequestMapping("qnacomm_update")
	public ModelAndView qnacomm_update(QnaCommVO vo) {
		ModelAndView mav = new ModelAndView("redirect:qna_detailForm?num="+vo.getQnum());
		dao.qnacomm_update(vo);
		return mav;
	}
	
}
