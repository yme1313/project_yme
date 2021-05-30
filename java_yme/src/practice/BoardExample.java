package practice;

import java.util.Scanner;

public class BoardExample {

	public static void main(String[] args) {
		Board1 br = new Board1();
		Scanner scan = new Scanner(System.in);
		int menu=0;
	
		do {
			BoardPrint();
			menu= scan.nextInt();
			switch(menu) {
			case 1 :
				br.insert();
				break;
			case 2 :
				br.update();
				break;
			case 3 :
				br.delete();
				break;
			case 4 :
				br.getBorard();
				break;
			case 5 :
				br.getBoardList();
				break;
			case 6 :
				System.out.println("프로그램을 종료합니다.");
				break;
			default :
				System.out.println("잘못된 메뉴입니다.");
			}
		} while(menu !=6);
			scan.close();
	}

public static void BoardPrint() {
		System.out.println("------메뉴------");
		System.out.println("1. 등록");
		System.out.println("2. 수정");
		System.out.println("3. 삭제");
		System.out.println("4. 게시글 번호로 검색");
		System.out.println("5. 단어로 검색");
		System.out.println("6. 종료");
		System.out.println("----------------");
		System.out.print("메뉴를 선택하세요 : ");
		
	}
}
