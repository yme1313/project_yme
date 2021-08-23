package kr.green.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
	public ArrayList<CartVO> getCartList() {	
		return cartDao.getCartList();
	}
}
