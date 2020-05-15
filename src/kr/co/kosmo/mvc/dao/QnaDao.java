package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.QnAVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Repository
public class QnaDao {
	@Autowired
	private SqlSessionTemplate ss;
	
	public void qna_write(QnAVO vo) {
		ss.insert("qna.ins",vo);
	}
	
	public int qna_total(SearchVO vo){
		return ss.selectOne("qna.total",vo);
	}
	
	public List<QnAVO> qna_list(SearchVO vo){
		List<QnAVO> list = ss.selectList("qna.list",vo);
		return list;
	}
	
	public void qna_delete(int num) {
		ss.delete("qna.delete",num);
	}
	
	public QnAVO qna_detail(int num) {
		return ss.selectOne("qna.detail",num);
	}
	
	public void qna_update(QnAVO vo) {
		ss.update("qna.update",vo);
	}
	
}
