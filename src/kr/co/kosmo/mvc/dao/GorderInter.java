package kr.co.kosmo.mvc.dao;




import kr.co.kosmo.mvc.dto.CartVO;
import kr.co.kosmo.mvc.dto.GorderVO;
import kr.co.kosmo.mvc.dto.MemberVO;

public interface GorderInter {
	public MemberVO gorderlist(String[] chbox);
	public void gorderinsert(GorderVO govo);
	public CartVO gorderCnum();
}
