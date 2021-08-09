package kr.green.shop.pagination;

import lombok.Data;

@Data
public class Criteria {
	private int page; 
	private int perPageNum;
	private String bd_type;//게시글 타입
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.bd_type = "ENQUIRY";
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