package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.QnaCommVO;

@Repository
public class QnACommDao {
	@Autowired
	private SqlSessionTemplate ss;
	
	public void qnacomm_ins(QnaCommVO vo) {
		ss.insert("qnacomm.ins",vo);
	}
	
	public List<QnaCommVO> qnacomm_list(int qnum){
		return ss.selectList("qnacomm.list",qnum);
	}
	
	public void qnacomm_delete(int qcnum) {
		ss.delete("qnacomm.delete",qcnum);
	}
	
	public QnaCommVO qnacomm_detail(int qcnum) {
		return ss.selectOne("qnacomm.detail",qcnum);
	}
	
	public void qnacomm_update(QnaCommVO vo) {
		ss.update("qnacomm.update",vo);
	}
}
