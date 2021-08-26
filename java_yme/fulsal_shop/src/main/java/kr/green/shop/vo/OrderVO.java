package kr.green.shop.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	private int or_num;
	private String or_me_id;
	private String or_title; //주문번호
	private Date or_date;
	private String or_paytype;
	private String or_name;
	private String or_phone;
	private String or_email;
	private String or_state;
	private int or_price;
	private String or_cancle;
	private String or_message;
	
	public String getOr_DateStr() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(or_date);
	}
}
