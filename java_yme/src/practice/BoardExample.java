package practice;

import java.util.Scanner;

public class BoardExample {

	public static void main(String[] args) {
		Board1 br = new Board1();
		Scanner scan = new Scanner(System.in);
		int menu=0;
		int num=0;
	
		do {
			BoardPrint();
			menu= scan.nextInt();
			switch(menu) {
			case 1 :
				br.insert(null);
				break;
			case 2 :
				br.update(null);
				break;
			case 3 :
				br.delete(num);
				break;
			case 4 :
				br.getBorard(num);
				break;
			case 5 :
				br.getBoardList();
				break;
			case 6 :
				br.getBoardList(null);
				break;
			case 7 :
				System.out.println("프로그램을 종료합니다.");
				break;
			default :
				System.out.println("잘못된 메뉴입니다.");
			}
		} while(menu !=7);
			scan.close();
	}

public static void BoardPrint() {
		System.out.println("메뉴를 입력하세요 : ");
		System.out.println("1. 등록");
		System.out.println("2. 수정");
		System.out.println("3. 삭제");
		System.out.println("4. 게시글 번호로 검색");
		System.out.println("5. 게시글 상세내역");
		System.out.println("6. 단어로 검색");
		System.out.println("7. 종료");
		System.out.println("----------------");
		System.out.print("메뉴를 선택하세요 : ");
		
	}
}
