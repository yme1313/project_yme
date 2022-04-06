package kr.enteritech.homepage.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.enteritech.homepage.pagination.Criteria;
import kr.enteritech.homepage.vo.MemberVO;
import kr.enteritech.homepage.vo.OrderVO;

public interface OrderDAO {

	void insertOrder(OrderVO ord);

	ArrayList<OrderVO> getOrderList(@Param("cri")Criteria cri, @Param("user")MemberVO user);

	int getTotalCount(@Param("cri")Criteria cri, @Param("user")MemberVO user);

	OrderVO getOrder(int or_num);

	void cancleOrder(OrderVO order);

	ArrayList<OrderVO> getOrderCancleList(@Param("cri")Criteria cri, @Param("user")MemberVO user);

	int getCancleTotalCount(@Param("cri")Criteria cri, @Param("user")MemberVO user);

	ArrayList<OrderVO> getAdminOrderList(@Param("cri")Criteria cri);

	int getAdminTotalCount(@Param("cri")Criteria cri);

	void updateOrderZero(OrderVO order);

	void updateOrderOK(OrderVO order);

	void erase(String me_id);

	ArrayList<OrderVO> getOrderReturnList(@Param("cri")Criteria cri, @Param("user")MemberVO user);

	int getReturnTotalCount(@Param("cri")Criteria cri, @Param("user")MemberVO user);

	void returnOrder(OrderVO order);

	void refundOrder(OrderVO order);

	ArrayList<String> getOrderFuNumsList(String or_me_id);

}
