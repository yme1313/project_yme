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
		if(cart == null || user == null || !cart.getCa_me_id().equals(user.getMe_id())) {
			return"FAIL";
		}
		CartVO dbcart = cartDao.getDbCart(cart);
		//장바구니 담을시 아이디, 상품, 사이즈가 중복되면 update, 아니면 insert
		if(dbcart == null) {
			cartDao.insertCart(cart);
		} else {
			String cart_id = cart.getCa_me_id();
			int cart_fu_num = cart.getCa_fu_num();
			String cart_size = cart.getCa_size();
			String dbcart_id = dbcart.getCa_me_id();
			int dbcart_fu_num = dbcart.getCa_fu_num();
			String dbcart_size = dbcart.getCa_size();
			if(cart_id.equals(dbcart_id) && cart_fu_num == dbcart_fu_num && cart_size.equals(dbcart_size)) {
				cartDao.updateCart(cart);
			}
		}
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

	@Override
	public CartVO getDeleteCart(Integer num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deletdOrderCart(Integer[] ca_num) {
		if(ca_num != null) {
			for(Integer num : ca_num) {
				cartDao.deletdOrderCart(num);
			}
		}
		
	}










}
