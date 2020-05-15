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
	
	//상세보기에서 장바구니 추가
	@Override
	public void inCart(MemberVO vo, GaguVO gto, CartVO cto) {
		//세개의 값을 맵에 넣어서 보냄
		Map<String, Integer> parameters = new HashMap<String, Integer>();
		parameters.put("mnum", vo.getMnum());
		parameters.put("gnum", gto.getGnum());
		parameters.put("chit", cto.getChit());
		ss.insert("cart.incart", parameters);
	}
	//장바구니 리스트
	@Override
	public MemberVO selectCart(int mnum) {
		return ss.selectOne("cart.list",mnum);
	}
	//장바구니 삭제
	@Override
	public void delete(CartVO cto) {
		ss.delete("cart.delete", cto);
	}
	//장바구니 수량 수정
	@Override
	public void modify(CartVO cto) {
		ss.update("cart.update",cto);
	}
	//구매 완료 시 카트에 있는 정보 삭제
	@Override
	public void deleteCart(GorderListVO glvo) {
		ss.delete("gorder.delete",glvo);		
	}
}
