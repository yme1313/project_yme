package kr.green.shop.dao;

import java.util.ArrayList;

import kr.green.shop.vo.CartVO;

public interface CartDAO {

	void insertCart(CartVO cart);

	ArrayList<CartVO> getCartList();

	CartVO getCartNum(int ca_num);

	void deleteCart(CartVO dbCart);

	void selectDelCart(CartVO cart);

}
