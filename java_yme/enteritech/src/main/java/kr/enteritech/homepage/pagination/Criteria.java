package kr.enteritech.homepage.pagination;

import lombok.Data;

@Data
public class Criteria {
	private int page; 
	private int perPageNum;
	private String bd_type;//게시글 타입
	private String fu_type;
	private String fu_brand;
	private int type;
	private String search;
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.bd_type = "ENQUIRY";
		this.fu_type = "의류";
		this.fu_brand = "나이키";
		this.search= "";
		this.type=0;
	}
	public Criteria(int page, int perPageNum) {
		this();
		this.page = page;
		this.perPageNum = perPageNum;
	}

	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}
}
