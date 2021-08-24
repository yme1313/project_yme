package kr.green.shop.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	private int ca_num;
	private int ca_fu_num;
	private String ca_me_id;
	private String ca_size;
	private String ca_count;
	private int ca_price;
	private String ca_valid;
	private Date ca_regdate;
	
	//상품정보
	private int fu_num;
	private String fu_type;
	private String fu_name;
	private String fu_brand;
	private String fu_img;
	private String fu_info;
	private int fu_price;
	
	public String getDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(ca_regdate);
	}
	public String getDateTime() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return format.format(ca_regdate);
	}
}
