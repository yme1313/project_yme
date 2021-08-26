package kr.green.shop.service;

import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.OrderVO;

public interface OrderService {

	void insertOrder(OrderVO ord, MemberVO user);

}
