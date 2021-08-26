package kr.green.shop.dao;

import java.util.ArrayList;

import kr.green.shop.vo.CartVO;
import kr.green.shop.vo.MemberVO;

public interface CartDAO {

	void insertCart(CartVO cart);

	ArrayList<CartVO> getCartList(MemberVO user);

	CartVO getCartNum(int ca_num);

	void deleteCart(CartVO dbCart);

	void selectDelCart(CartVO cart);

	CartVO getCart(int num);

}
