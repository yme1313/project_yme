package kr.green.shop.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	private int or_num;
	private String or_me_id;
	private int or_fu_num;
	private Date or_date;
	private String or_paytype;
	private String or_card;
	private int or_installment;
	private String or_name;
	private String or_phone;
	private String or_email;
	private String or_state;
	private int or_count;
	private int or_price;
	private String or_cancle;
	private int deliever;
	private String message;
	
	public String getOr_DateStr() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(or_date);
	}
}
