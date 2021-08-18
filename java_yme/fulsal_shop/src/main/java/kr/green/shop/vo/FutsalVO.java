package kr.green.shop.vo;

import lombok.Data;

@Data
public class FutsalVO {

	private int fu_num;
	private String fu_type;
	private String fu_name;
	private String fu_brand;
	private String fu_img;
	private String fu_info;
	private int fu_price;
	private String fu_valid;
	private String fu_size;
	private int fu_stock;
	public FutsalVO(){}
}
