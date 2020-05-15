package kr.co.kosmo.mvc.dao;

import java.util.HashMap;
import java.util.Map;

import org.mvel2.ast.WithNode.ParmValuePair;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.dto.CartVO;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.GorderListVO;
import kr.co.kosmo.mvc.dto.MemberVO;
@Repository
public class CartDao implements CartInter{
	@Autowired
	SqlSessionTemplate ss;
	
	//�󼼺��⿡�� ��ٱ��� �߰�
	@Override
	public void inCart(MemberVO vo, GaguVO gto, CartVO cto) {
		//������ ���� �ʿ� �־ ����
		Map<String, Integer> parameters = new HashMap<String, Integer>();
		parameters.put("mnum", vo.getMnum());
		parameters.put("gnum", gto.getGnum());
		parameters.put("chit", cto.getChit());
		ss.insert("cart.incart", parameters);
	}
	//��ٱ��� ����Ʈ
	@Override
	public MemberVO selectCart(int mnum) {
		return ss.selectOne("cart.list",mnum);
	}
	//��ٱ��� ����
	@Override
	public void delete(CartVO cto) {
		ss.delete("cart.delete", cto);
	}
	//��ٱ��� ���� ����
	@Override
	public void modify(CartVO cto) {
		ss.update("cart.update",cto);
	}
	//���� �Ϸ� �� īƮ�� �ִ� ���� ����
	@Override
	public void deleteCart(GorderListVO glvo) {
		ss.delete("gorder.delete",glvo);		
	}
}
