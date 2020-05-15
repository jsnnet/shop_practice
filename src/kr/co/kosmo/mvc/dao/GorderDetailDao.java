package kr.co.kosmo.mvc.dao;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.GorderListVO;



@Repository
public class GorderDetailDao implements GorderDetailInter{
	@Autowired
	SqlSessionTemplate ss;
	//주문 시 구매 상세 테이블에 구매 한 목록을 넣는다.
	@Override
	public void gorderdetailinsert(GorderListVO glvo) {
		ss.insert("gorder.gorderdetailin",glvo);
	}
}
