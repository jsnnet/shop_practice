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
	//구매 목록 리스트
	@Override
	public MemberVO gorderlist(String[] chbox) {
		//배열의 값을 리스트에 넣어서 매퍼로 보냄
		List<Integer> list = new ArrayList<Integer>();
		for(String e : chbox) {
			list.add(Integer.parseInt(e));
		}
		return ss.selectOne("gorder.gorderlist",list);
	}
	//주문 시 구매테이블에 추가 한다.
	@Override
	public void gorderinsert(GorderVO govo) {
		ss.insert("gorder.gorderin",govo);
	}
	//상품상세페이지에서 구매
	@Override
	public CartVO gorderCnum() {
	   return ss.selectOne("gorder.cnum");
	}
}
