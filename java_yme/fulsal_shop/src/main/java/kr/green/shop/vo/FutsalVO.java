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
	
	//사이즈 정보
	private String op_size;
	private int ca_count;

	
	public FutsalVO(){}
}
