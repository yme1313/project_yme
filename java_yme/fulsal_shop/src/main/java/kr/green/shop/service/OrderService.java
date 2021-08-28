package kr.green.shop.service;

import java.util.ArrayList;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.OrderVO;

public interface OrderService {

	void insertOrder(OrderVO order, MemberVO user);

	ArrayList<OrderVO> getOrderList(Criteria cri, MemberVO user);

	int getTotalCount(Criteria cri, MemberVO user);

}
