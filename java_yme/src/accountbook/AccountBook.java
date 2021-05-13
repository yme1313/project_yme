package accountbook;

public class AccountBook {
	/* 클래스명 : AccountBook
	 * - 수입 내역, 지출 내역을 관리하기 위한 가계부 클라스
	 */
	// 수입내역, 지출내역배열 필요
	private String inMoney[];
	private String outMoney[];
	private String type;
	
	public String[] getInMoney() {
		return inMoney;
	}
	public void setInMoney(String[] inMoney) {
		this.inMoney = inMoney;
	}
	public String[] getOutMoney() {
		return outMoney;
	}
	public void setOutMoney(String[] outMoney) {
		this.outMoney = outMoney;
	}
	
	public AccountBook(String[] inMoney, String[] outMoney) {
		this.inMoney = inMoney;
		this.outMoney = outMoney;
	}

	
	/* 기능 : type이 "수입"인 경우 
	 * 매개변수 : 수입내역 배열
	 * 리턴타입 : 없음
	 * 메소드명 : inPrint 
	 */ 
	public void inPrint() {
		
	}
	/* 기능 : 지출내역을 저장한 배열을 출력하는 메소드
	 * 매개변수 : 지출내역 배열
	 * 리턴타입 : 없음
	 * 메소드명 : outPrint 
	 */ 
	
 
}

