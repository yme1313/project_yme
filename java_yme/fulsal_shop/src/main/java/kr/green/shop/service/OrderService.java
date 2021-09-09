package kr.green.shop.service;

import java.util.ArrayList;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.OrderVO;

public interface OrderService {

	void insertOrder(OrderVO order, MemberVO user);

	ArrayList<OrderVO> getOrderList(Criteria cri, MemberVO user);

	int getTotalCount(Criteria cri, MemberVO user);

	OrderVO getOrder(int or_num);

	void cancleOrder(OrderVO order);

	ArrayList<OrderVO> getOrderCancleList(Criteria cri, MemberVO user);

	int getCancleTotalCount(Criteria cri, MemberVO user);

	ArrayList<OrderVO> getAdminOrderList(Criteria cri, MemberVO user);

	int getAdminTotalCount(Criteria cri);

	String updateOrderZero(OrderVO order);

	void updateOrderOK(OrderVO order);

	ArrayList<OrderVO> getOrderReturnList(Criteria cri, MemberVO user);

	int getReturnTotalCount(Criteria cri, MemberVO user);

	String returnOrder(OrderVO order);

	String refundOrder(OrderVO order);

	ArrayList<String> getOrderFuNumsList(String or_me_id);

}
