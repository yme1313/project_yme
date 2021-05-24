package day18;

import java.util.HashMap;
import java.util.Scanner;

public class MapTest2 {

	public static void main(String[] args) {
		HashMap<String, String> set = new HashMap <String,String>();
		int menu=0;
		Scanner scan = new Scanner(System.in);
		
		do {
			printMenu();
			menu = scan.nextInt();
			String id, pw;
			switch(menu) {
			case 1:
				System.out.print("아이디 : " );
				id = scan.next();
				if(!set.containsKey(id)) {
					System.out.print("비밀번호 : ");
					pw = scan.next();
					set.put(id, pw);
				}else {
					duplication();
				} break;
			case 2:
				System.out.print("아이디 : ");
				id = scan.next();
				System.out.print("비밀번호 : ");
				pw = scan.next();
				if(set.get(id).equals(pw)) {
					loginSuccess();
				}else {
					loginFail();
				} break;
			case 3:
				end();
			default:
				wrongMenu();
			} 
		}while(menu!=3);
		scan.close();
		/*
		do {
			printMenu();
			menu = scan.nextInt();
			switch(menu) {
			case 1 :
				System.out.print("아이디 : " );
				String id = scan.next();
				System.out.print("비밀번호 : ");
				String pw = scan.next();
				set.put(id,pw);
				boolean log1 = set.containsKey(id);
				if(log1 != true) {
					System.out.println("========이미 가입된 회원입니다========");
				} System.out.println("========회원가입되었습니다========");
				break;
				
				
			case 2 :
				System.out.print("아이디 : ");
				String id1 = scan.next();
				System.out.print("비밀번호 : ");
				String pw1 = scan.next();
				String log2 = set.get(id1);
				if(pw1 != log2){
					System.out.println("========로그인 실패========");					
				} else {
					System.out.println("========로그인 성공========");
				}
				break;
			case 3 :
					System.out.println("프로그램을 종료합니다.");
				break;
			}
		}while(menu !=3);
		scan.close();
	*/
	}

public static void printMenu() {
	System.out.println("1.회원가입");
	System.out.println("2.로그인" );
	System.out.println("3.종료" );
	System.out.print("메뉴 선택 : ");
}

public static void end() {
	System.out.println("==============");
	System.out.println("프로그램을 종료합니다.");
	System.out.println("==============");
}

public static void wrongMenu() {
	System.out.println("==============");
	System.out.println("잘못된 메뉴입니다.");
	System.out.println("==============");
}

public static void loginSuccess() {
	System.out.println("==============");
	System.out.println("로그인 성공");
	System.out.println("==============");
}

public static void loginFail() {
	System.out.println("==============");
	System.out.println("로그인 실패");
	System.out.println("==============");
}

public static void duplication() {
	System.out.println("==============");
	System.out.println("이미 가입된 아이디입니다.");
	System.out.println("==============");
}

}


