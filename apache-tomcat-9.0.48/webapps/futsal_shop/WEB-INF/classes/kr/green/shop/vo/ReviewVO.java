package kr.green.shop.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReviewVO {
	private int rv_num;
	private int rv_fu_num;
	private String rv_me_id;
	private String rv_star;
	private String rv_contents;
	private String rv_valid;
	private Date rv_regdate;
	
	public String getRegDateStr() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(rv_regdate);
	}
	
	public String getStarStr() {
		if(rv_star.equals("1")) {
			return "★";
		} else if(rv_star.equals("2")) {
			return "★★";
		} else if(rv_star.equals("3")) {
			return "★★★";
		} else if(rv_star.equals("4")) {
			return "★★★★";
		} else if(rv_star.equals("5")) {
			return "★★★★★";
		}
		return "";
	}
	
}
