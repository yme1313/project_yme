package accountbook;

import java.util.InputMismatchException;
import java.util.Scanner;

public class AccountBookTest {

	public static void main(String[] args) {
		AccountBookProgram abp = new AccountBookProgram();
		Scanner scan = new Scanner(System.in);
		int menu=0;
		int subMenu=0;
	
		do {
			try{abp.printMenu();
			menu= scan.nextInt();
			switch(menu) {
				case 1 : 
					abp.insertAcBook(); break;
				case 2 :
					abp.updateAcBook(null); break;
				case 3 :
					abp.deleteAcBook(); break;
				case 4 :
					abp.printSynMenu();
					subMenu= scan.nextInt();
					switch(subMenu) {
						case 1:
							abp.detailList(); break;
						case 2:
							abp.simpleList(); break;
						case 3:
							abp.printItem(); break;
						case 4:
							abp.printTotal(); break;
						default:
							System.out.println("잘못된 메뉴");
					} break;
				case 5 :
					System.out.println("프로그램 종료"); break;
				default: System.out.println("잘못된 메뉴입니다.");	
			}
			} catch(InputMismatchException e) {
				System.out.println("예외 : 값을 잘못 입력했습니다.");
				scan.nextLine();
				menu = 0;
			}
		}while(menu!=5);
		scan.close();
	} 
}

