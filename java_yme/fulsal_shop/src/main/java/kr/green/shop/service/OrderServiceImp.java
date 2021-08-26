package kr.green.shop.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;

import kr.green.shop.dao.OrderDAO;
import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.OrderVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OrderServiceImp implements OrderService{
	OrderDAO orderDao;
	
	@Override
	public void insertOrder(OrderVO ord, MemberVO user) {
		if(!ord.getOr_me_id().equals(user.getMe_id())) {
			return;
		}
		ord.setOr_title(makeOr_title());
		orderDao.insertOrder(ord);
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

}
