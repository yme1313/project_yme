package kr.green.shop.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	private int ca_num;
	private int ca_fu_num;
	private String ca_me_id;
	private String ca_count;
	private int ca_price;
	private String ca_valid;
	private Date ca_regdate;
	
	public String getDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(ca_regdate);
	}
	public String getDateTime() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(ca_regdate);
	}
}
