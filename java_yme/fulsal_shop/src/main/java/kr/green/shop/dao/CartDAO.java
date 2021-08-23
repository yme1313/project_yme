package kr.green.shop.dao;

import java.util.ArrayList;

import kr.green.shop.vo.CartVO;

public interface CartDAO {

	void insertCart(CartVO cart);

	ArrayList<CartVO> getCartList();

}
