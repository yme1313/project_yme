package kr.green.shop.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.green.shop.dao.CartDAO;
import kr.green.shop.vo.CartVO;
import kr.green.shop.vo.MemberVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CartServiceImp implements CartService{
	
	CartDAO cartDao;
	
	@Override
	public String insertCart(CartVO cart, MemberVO user) {
		if(cart == null || user == null) {
			return"FAIL";
		}
		cart.setCa_me_id(user.getMe_id());
		cartDao.insertCart(cart);	
		return "OK";
	}

	@Override
	public ArrayList<CartVO> getCartList(MemberVO user) {	
		if(user == null) {
			return null;
		}
		return cartDao.getCartList(user);
	}
	
	@Override
	public CartVO getCartNum(int ca_num) {
		if(ca_num <=0) {
			return null;
		}
		return cartDao.getCartNum(ca_num);
	}
	
	@Override
	public String deleteCart(CartVO dbCart, MemberVO user) {
		if(dbCart == null || user == null) {
			return "FAIL";
		}
		cartDao.deleteCart(dbCart);
		return "OK";
	}

	@Override
	public void selectDelCart(CartVO cart) {
		if(cart == null) {
			return;
		}
		cartDao.deleteCart(cart);
		
	}

	@Override
	public CartVO getOrderCart(Integer num) {
		return cartDao.getCart(num);
	}






}
