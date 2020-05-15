package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.NoticeVO;
import kr.co.kosmo.mvc.dto.SearchVO;

@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public void notice_ins(NoticeVO vo) {
		ss.insert("notice.ins",vo);
	}
	
	public int notice_total(SearchVO vo){
		return ss.selectOne("notice.total",vo);
	}
	
	public List<NoticeVO> notice_list(SearchVO vo){
		return ss.selectList("notice.list",vo);
	}
	
	public NoticeVO notice_detail(int num) {
		return ss.selectOne("notice.detail",num);
	}
	
	public void notice_delete(int num) {
		ss.delete("notice.delete",num);
	}
	
	public void notice_update(NoticeVO vo) {
		ss.update("notice.update",vo);
	}
}
