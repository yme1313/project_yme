package kr.enteritech.homepage.vo;

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
	private String or_size;
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
	private String or_refund;
	private String or_returntype;
	private String or_approve;
	
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
		} else if(or_paytype.equals("kakaopay")) {
			return "카카오페이";
		}
		return "";
	}
	public String getRefundStr() {
		if(or_refund.equals("Y")) {
			return "환불완료";
		} else if(or_refund.equals("N")) {
			return "환불대기중";
		}
		return "";
	}
	public String getStateStr() {
		if(or_state.equals("교환반품접수")) {
			return "교환/반품접수";
		}
		return or_state;
	}
	public String getApproveStr() {
		if(or_approve.equals("Y")) {
			return "승인완료";
		} else {
			return "승인대기";
		}
	}
}
