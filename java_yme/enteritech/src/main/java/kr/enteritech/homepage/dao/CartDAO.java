package kr.enteritech.homepage.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.enteritech.homepage.vo.CartVO;
import kr.enteritech.homepage.vo.MemberVO;

public interface CartDAO {

	void insertCart(CartVO cart);

	ArrayList<CartVO> getCartList(MemberVO user);

	CartVO getCartNum(int ca_num);

	void deleteCart(CartVO dbCart);

	void selectDelCart(CartVO cart);

	CartVO getCart(int num);

	void deletdOrderCart(Integer num);

	void erase(String me_id);

	void updateCart(CartVO cart);

	CartVO getDbCart(CartVO cart);

	void updateCount(@Param("ca_num")int ca_num, @Param("ca_count")int ca_count, @Param("ca_price")int ca_price);


}
