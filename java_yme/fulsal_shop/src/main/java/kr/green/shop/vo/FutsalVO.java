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
	
	public String getSize() {
		if(op_size.equals("80")) {
			return "80(XXS)";
		} else if(op_size.equals("85")) {
			return "85(XS)";
		} else if(op_size.equals("90")) {
			return "90(S)";
		} else if(op_size.equals("95")) {
			return "95(M)";
		} else if(op_size.equals("100")) {
			return "100(L)";
		} else if(op_size.equals("105")) {
			return "105(XL)";
		} else if(op_size.equals("110")) {
			return "110(XXL)";
		}	
		return op_size;
	}
	
	public FutsalVO(){}
}
