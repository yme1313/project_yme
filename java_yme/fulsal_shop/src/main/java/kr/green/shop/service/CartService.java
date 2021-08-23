package kr.green.shop.service;

import java.util.ArrayList;

import kr.green.shop.vo.CartVO;
import kr.green.shop.vo.MemberVO;

public interface CartService {

	String insertCart(CartVO cart, MemberVO user);

	ArrayList<CartVO> getCartList();

}
