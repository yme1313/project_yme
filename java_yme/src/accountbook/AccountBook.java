package accountbook;

public class AccountBook {
	/* 클래스명 : AccountBook
	 * - 수입 내역, 지출 내역을 관리하기 위한 가계부 클라스
	 */
	// 수입내역, 지출내역배열 필요
	private String type; //수입or지출
	private String date; //날짜
	private String paymentType; //결제타입 : 현금/은행/카드 
	private String category; //분류 : 식비/교통/건강 등
	private int cost; //금액
	private String contents; //내용 
	
	private Item arr[]; //가계부 내역들
	private int count; //저장된 내역들 갯수
	private int total; //내역에 기입된 금액의 총량 (+는 수입, -는 지출)
	
	
	public Item[] getArr() {
		return arr;
	}
	public void setArr(Item[] arr) {
		this.arr = arr;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	
	/* 기능 : 작성한 가계부 내역을 배열에 저장하는 메소드
	* 매개변수 : 
	* 리턴타입 : void
	* 메소드명 : itemList
	*/
	public void itemList(Item item) {
		Item tmpItem = new Item(type, date, paymentType, category, cost, contents);
		arr[count] = tmpItem;
		count++;
	}
		
	/* 기능 : 등록된 가계부 수정
	* 매개변수 : 
	* 리턴타입 : void
	* 메소드명 : editList
	*/
	public void editList(Item item) {
	}
	
	/* 기능 : 등록된 가계부 삭제
	* 매개변수 : 
	* 리턴타입 : void
	* 메소드명 : 
	*/
	
	/* 기능 : 가계부 상세 목록 확인
	* 매개변수 : 
	* 리턴타입 : void
	* 메소드명 : 
	*/
	

}
	
	


