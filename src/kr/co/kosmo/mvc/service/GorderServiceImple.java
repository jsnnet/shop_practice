package kr.co.kosmo.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.kosmo.mvc.controller.CartController;
import kr.co.kosmo.mvc.dao.CartInter;
import kr.co.kosmo.mvc.dao.GorderDetailInter;
import kr.co.kosmo.mvc.dao.GorderInter;
import kr.co.kosmo.mvc.dto.GorderListVO;
import kr.co.kosmo.mvc.dto.GorderVO;
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class,readOnly = true)
@Service
public class GorderServiceImple implements GorderServiceInter{
	@Autowired
	private GorderInter gorder;
	@Autowired
	private GorderDetailInter gorderDetail;
	@Autowired
	public CartInter cartDao;
	//트렌젝션
	@Override
	public void twoadd(GorderListVO glvo, GorderVO gvo) throws Exception {
		//구매 시 gorder 테이블 추가
		gorder.gorderinsert(gvo);
		//구매 시 상품 상세 내역 gorderdetail 추가
		gorderDetail.gorderdetailinsert(glvo);
		//구매 시 장바구니에 등록 되어 있는 상품 삭제
		cartDao.deleteCart(glvo);
		
	}

}
