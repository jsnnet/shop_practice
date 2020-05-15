package kr.co.kosmo.mvc.dao;

import kr.co.kosmo.mvc.dto.CartVO;
import kr.co.kosmo.mvc.dto.GaguVO;
import kr.co.kosmo.mvc.dto.GorderListVO;
import kr.co.kosmo.mvc.dto.MemberVO;

public interface CartInter {
	//��ٱ��� ��ǰ �߰�
	public void inCart(MemberVO vo, GaguVO gto, CartVO cto);
	//��ٱ��� ����Ʈ �̱�
	public MemberVO selectCart(int mnum);
	//��ٱ��� ����
	public void delete(CartVO cto);
	//��ٱ��� ���� ����
	public void modify(CartVO cto);
	//���� �Ϸ� �� īƮ�� �ִ� ���� ����
	public void deleteCart(GorderListVO glvo);
}
