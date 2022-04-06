package kr.enteritech.homepage.service;

import java.util.ArrayList;

import kr.enteritech.homepage.vo.CartVO;
import kr.enteritech.homepage.vo.MemberVO;

public interface CartService {

	String insertCart(CartVO cart, MemberVO user);

	ArrayList<CartVO> getCartList(MemberVO user);

	CartVO getCartNum(int ca_num);

	String deleteCart(CartVO dbCart, MemberVO user);

	void selectDelCart(CartVO cart);

	CartVO getOrderCart(Integer num);

	void deletdOrderCart(Integer[] ca_num);

	String updateCount(String[] checkArr, String[] countArr, String[] priceArr);


}
