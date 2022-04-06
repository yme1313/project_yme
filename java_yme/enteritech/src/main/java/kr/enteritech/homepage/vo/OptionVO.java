package kr.enteritech.homepage.vo;

import lombok.Data;

@Data
public class OptionVO {
	private int op_num;
	private int op_fu_num;
	private String op_size;
	private int op_count;
	
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
		} else if(op_size.equals("1")) {
			return "One-Size";
		}
		return op_size;
	}
}
