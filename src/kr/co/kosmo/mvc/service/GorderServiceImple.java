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
	//Ʈ������
	@Override
	public void twoadd(GorderListVO glvo, GorderVO gvo) throws Exception {
		//���� �� gorder ���̺� �߰�
		gorder.gorderinsert(gvo);
		//���� �� ��ǰ �� ���� gorderdetail �߰�
		gorderDetail.gorderdetailinsert(glvo);
		//���� �� ��ٱ��Ͽ� ��� �Ǿ� �ִ� ��ǰ ����
		cartDao.deleteCart(glvo);
		
	}

}
