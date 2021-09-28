package kr.green.shop.vo;

import lombok.Data;

@Data
public class MemberVO {
	private String me_id;
	private String me_pw;
	private String me_name;
	private String me_phone;
	private int me_birth;
	private String me_gender;
	private String me_email;
	private int me_postnum;
	private String me_add1;
	private String me_add2;
	private String me_add3;
	private String me_add4;
	private String me_authority;
	private String useCookie;
	private Boolean agree;
	
	public String getAuthorityStr() {
		if(me_authority.equals("USER")) {
			return "회원";
		}
		if(me_authority.equals("SUB ADMIN")) {
			return "보조 관리자";
		}
		if(me_authority.equals("ADMIN")) {
			return "관리자";
		}
		return "";
	}
	
	
}
