package kr.green.shop.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Service;

import kr.green.shop.dao.OrderDAO;
import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.OrderVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OrderServiceImp implements OrderService{
	OrderDAO orderDao;
	
	@Override
	public void insertOrder(OrderVO order, MemberVO user) {
		if(!order.getOr_me_id().equals(user.getMe_id())) {
			return;
		}
		order.setOr_title(makeOr_title());
		orderDao.insertOrder(order);
	}
	
	private String makeOr_title() {
		char c1=(char)(Math.random()*26+'A');
		char c2=(char)(Math.random()*26+'A');
		char c3=(char)(Math.random()*26+'A');
		
		Date d= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		String str =sdf.format(d);
		String orTitle=String.valueOf(c1)+c2+c3+str;
		return orTitle;
	}

	@Override
	public ArrayList<OrderVO> getOrderList(Criteria cri, MemberVO user) {
		if(user == null) {
			return null;
		}
		return orderDao.getOrderList(cri ,user);
	}


	@Override
	public int getTotalCount(Criteria cri, MemberVO user) {
		return orderDao.getTotalCount(cri, user);
	}
	
	@Override
	public ArrayList<OrderVO> getOrderCancleList(Criteria cri, MemberVO user) {
		if(user == null) {
			return null;
		}
		return orderDao.getOrderCancleList(cri ,user);
	}

	@Override
	public int getCancleTotalCount(Criteria cri, MemberVO user) {
		return orderDao.getCancleTotalCount(cri, user);
	}


	@Override
	public OrderVO getOrder(int or_num) {
		if(or_num <=0) {
			return null;
		}
		return orderDao.getOrder(or_num);
	}


	@Override
	public void cancleOrder(OrderVO order) {
		if(order == null) {
			return;
		}
		orderDao.cancleOrder(order);
	}


	@Override
	public ArrayList<OrderVO> getAdminOrderList(Criteria cri, MemberVO user) {
		if(user == null || user.getMe_authority().equals("USER")) {
			return null;
		}
		return orderDao.getAdminOrderList(cri);
	}


	@Override
	public int getAdminTotalCount(Criteria cri) {
		return orderDao.getAdminTotalCount(cri);
	}


	@Override
	public String updateOrderZero(OrderVO order) {
		if(order == null) {
			return"FAIL";
		}
		orderDao.updateOrderZero(order);
		return "OK";
	}


	@Override
	public void updateOrderOK(OrderVO order) {
		if(order==null) {
			return;
		}
		orderDao.updateOrderOK(order);
	}


	@Override
	public String returnGoods(OrderVO order, OrderVO ord) {
		if(order == null || ord == null || order.getOr_num() != ord.getOr_num()) {
			return "FAIL";
		}
		orderDao.returnGoods(order,ord);
		return "OK";
	}

	@Override
	public ArrayList<OrderVO> getOrderReturnList(Criteria cri, MemberVO user) {
		if(user == null) {
			return null;
		}
		return orderDao.getOrderReturnList(cri, user);
	}

	@Override
	public int getReturnTotalCount(Criteria cri, MemberVO user) {
		return orderDao.getReturnTotalCount(cri, user);
	}







}
