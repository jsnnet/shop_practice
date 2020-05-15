package kr.co.kosmo.mvc.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.CartVO;
import kr.co.kosmo.mvc.dto.GorderVO;
import kr.co.kosmo.mvc.dto.MemberVO;

@Repository
public class GorderDao implements GorderInter{
	@Autowired
	SqlSessionTemplate ss;
	//���� ��� ����Ʈ
	@Override
	public MemberVO gorderlist(String[] chbox) {
		//�迭�� ���� ����Ʈ�� �־ ���۷� ����
		List<Integer> list = new ArrayList<Integer>();
		for(String e : chbox) {
			list.add(Integer.parseInt(e));
		}
		return ss.selectOne("gorder.gorderlist",list);
	}
	//�ֹ� �� �������̺� �߰� �Ѵ�.
	@Override
	public void gorderinsert(GorderVO govo) {
		ss.insert("gorder.gorderin",govo);
	}
	//��ǰ������������ ����
	@Override
	public CartVO gorderCnum() {
	   return ss.selectOne("gorder.cnum");
	}
}
