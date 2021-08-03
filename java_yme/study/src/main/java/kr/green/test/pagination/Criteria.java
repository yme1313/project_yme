package kr.green.test.pagination;

import lombok.Data;

@Data
public class Criteria {
	private int page; 
	private int perPageNum;
	private String type;//게시글 타입
	private String sortType; // id, authority
	private String sort; //desc, asc
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.sortType = "id";
		this.sort = "asc";
		this.type = "NORMAL";
	}
	public Criteria(int page, int perPageNum) {
		this();
		this.page = page;
		this.perPageNum = perPageNum;
	}

	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}
	public String getNotSort() {
		if(sort.equals("asc")) {
			return "desc";
		} else {
			return "asc";
		}
	}
	
}