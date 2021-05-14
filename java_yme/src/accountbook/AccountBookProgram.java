package accountbook;

import java.util.Scanner;

public class AccountBookProgram {
	AccountBook2 book;
	Item item;
	Scanner scan = new Scanner(System.in);
	
	public AccountBookProgram() {
		book = new AccountBook2();
	}
	public AccountBookProgram(int max) {
		book = new AccountBook2(max);
	}

	/* 기능 : 내역을 입력받아 가계부에 저장되는 메소드
	 * 매개변수 : 없음
	 * 리턴타입 : 없음
	 * 메소드명 : insertAcBook
	 */
	public void insertAcBook() {
		Item item = createItem();
		book.insert(item);
	
	}
	
	/* 기능 : 수정할 내역의 번호와 내역 정보를 입력받아 내용을 수정하는 메소드
	 * 매개변수 : Item item
	 * 리턴타입 : 없음
	 * 메소드명 : updateAcBook
	 */
	public void updateAcBook(Item item) {
		System.out.print("수정할 번호를 입력하세요 : ");
		int index= scan.nextInt();
		Item item1 = createItem();
		book.update(index-1, item1);
	}

	/* 기능 : 삭제할 번호를 입력받아 내역을 삭제하는 메소드
	 * 매개변수 : 
	 * 리턴타입 : 없음
	 * 메소드명 : deleteAcBook
	 * */
	public void deleteAcBook() {
		System.out.print("삭제할 번호를 입력하세요 : ");
		int index= scan.nextInt();
		book.delete(index-1);
	}
	
	/* 기능 : 내역 전체 출력하는 메소드
	 * */
	public void detailList() {
		book.printItemListDetail();
	}
	
	/* 기능 : 내역 전체를 간략히 출력하는 메소드
	 * */
	public void simpleList() {
		book.printItemSimple();
	}
	
	/* 기능 : 확인할 내역 번호를 입력받아 내역을 상세히 출력하는 메소드
	 */
	
	public void printItem() {
		System.out.print("확인할 내역의 번호를 입력 : ");
		int index = scan.nextInt();
		book.printItem(index-1);
	}
	
	/* 기능 : 가계부 금액을 출력하는 메소드
	 * */
	public void printTotal() {
		System.out.println("내역 합계 : " + book.getTotal() + "원");
	}
	 
	/* 기능 : 내역 정보를 입력받아 내역을 생성하여 알려주는 메소드
	 * 매개변수 : 없음
	 * 리턴타입 : 생성된 내역 => Item
	 * 메소드명 : createItem
	 * */
	private Item createItem() {
		System.out.println("가계부 내역을 입력하세요.");
		System.out.print("타입 : ");
		String type = scan.next();
		System.out.print("날짜 : ");
		String date = scan.next();
		System.out.print("자산 : ");
		String paymentType = scan.next();
		System.out.print("분류 : ");
		String category = scan.next();
		System.out.print("금액 : ");
		int cost = scan.nextInt();
		System.out.print("내용 : ");
		String contents = scan.next();
		Item item = new Item(type, date, paymentType, category, cost, contents);
		return item;
	}
	
	public void printMenu() {
		System.out.println("----메뉴----");
		System.out.println("1.가계부 입력");
		System.out.println("2.가계부 수정");
		System.out.println("3.가계부 삭제");
		System.out.println("4.가계부 확인");;
		System.out.println("5.가게부 종료");
		System.out.println("------------");
		System.out.print("메뉴를 선택 : ");	
	}
	public void printSynMenu() {
		System.out.println("----확인----");
		System.out.println("1.전체 내역 상세");
		System.out.println("2.전체 내역 요약");
		System.out.println("3.선택 내역 상세");
		System.out.println("4.내역 합계");
		System.out.println("-----------");
		System.out.print("메뉴를 선택 : ");	
	}
}
