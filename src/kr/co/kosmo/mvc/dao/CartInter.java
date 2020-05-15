package kr.co.kosmo.mvc.dao;

import kr.co.kosmo.mvc.dto.CartVO;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.GorderListVO;
import kr.co.kosmo.mvc.dto.MemberVO;

public interface CartInter {
	//장바구니 상품 추가
	public void inCart(MemberVO vo, GaguVO gto, CartVO cto);
	//장바구니 리스트 뽑기
	public MemberVO selectCart(int mnum);
	//장바구니 삭제
	public void delete(CartVO cto);
	//장바구니 수량 수정
	public void modify(CartVO cto);
	//구매 완료 시 카트에 있는 정보 삭제
	public void deleteCart(GorderListVO glvo);
}
