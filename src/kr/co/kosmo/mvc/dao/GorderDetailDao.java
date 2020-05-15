package kr.co.kosmo.mvc.dao;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.GorderListVO;



@Repository
public class GorderDetailDao implements GorderDetailInter{
	@Autowired
	SqlSessionTemplate ss;
	//�ֹ� �� ���� �� ���̺� ���� �� ����� �ִ´�.
	@Override
	public void gorderdetailinsert(GorderListVO glvo) {
		ss.insert("gorder.gorderdetailin",glvo);
	}
}
