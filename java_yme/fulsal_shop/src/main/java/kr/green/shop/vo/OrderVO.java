package kr.green.shop.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	private int or_num;
	private String or_me_id;
	private String or_title; //주문번호
	private String or_fuNums;
	private String or_count;
	private String or_goodsname;
	private Date or_date;
	private String or_paytype;
	private String or_name;
	private String or_phone;
	private String or_email;
	private String or_state;
	private int or_price;
	private String or_cancle;
	private String or_message;
	private int or_postnum;
	private String or_add1;
	private String or_add2;
	private String or_add3;
	private String or_add4;
	
	public String getOr_DateStr() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(or_date);
	}
	public String getPayStr() {
		if(or_paytype.equals("card")) {
			return "카드결제";
		} else if(or_paytype.equals("real-time")) {
			return "실시간 계좌이체";
		} else if(or_paytype.equals("without-bankbook")) {
			return "무통장 입금";
		}
		return "";
	}
}
