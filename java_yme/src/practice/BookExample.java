package practice;

import java.util.Scanner;

public class BookExample {

	public static void main(String[] args) {
		BookProgram bg = new BookProgram();
		Scanner scan = new Scanner(System.in);
		int menu;
		
		do { 
			System.out.println("-----메뉴-----");
			System.out.println("1. 등록");
			System.out.println("2. 검색(책 이름)");
			System.out.println("3. 검색(책 코드)");
			System.out.println("4. 반출");
			System.out.println("5. 반납");
			System.out.println("6. 도서리스트");
			System.out.println("7. 종료");
			System.out.print("메뉴를 입력하세요 : ");
			menu = scan.nextInt();
			switch(menu) {
			case 1:
				bg.Insert();
				break;
			case 2:
				bg.SearchBookName();
				break;
			case 3:
				bg.SearchBookCode();
				break;
			case 4:
				bg.Lent();
				break;
			case 5:
				bg.Return();
				break;
			case 6:
				bg.allList();
				break;
			case 7:
				System.out.println("프로그램 종료");
				break;
			default :
				System.out.println("없는 메뉴입니다.");
			}
		} while(menu != 7);
	}
}
