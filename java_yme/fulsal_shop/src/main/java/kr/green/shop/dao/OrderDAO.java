package kr.green.shop.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.OrderVO;

public interface OrderDAO {

	void insertOrder(OrderVO ord);

	ArrayList<OrderVO> getOrderList(@Param("cri")Criteria cri, @Param("user")MemberVO user);

	int getTotalCount(@Param("cri")Criteria cri, @Param("user")MemberVO user);

}
