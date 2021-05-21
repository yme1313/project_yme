package day18;

import java.util.HashMap;
import java.util.Scanner;

public class MapTest2 {

	public static void main(String[] args) {
		HashMap<String, String> signUp = new HashMap <String,String>();
		int menu=0;
		Scanner scan = new Scanner(System.in);
		
		do {
			printMenu();
			menu = scan.nextInt();
			switch(menu) {
			case 1 :
				System.out.println("아이디 : " );
				String id = scan.next();
				String pw = scan.next();
				boolean log1 = signUp.containsKey(id);
				if(log1== true) {
					System.out.println("이미 가입된 회원입니다.");
				} else {
					System.out.println("비밀번호 : " + pw);
				}
				System.out.println("회원가입되었습니다.");
				signUp.put(id, pw);
				break;
			case 2 :
				String id1 = scan.next();
				String pw1 = scan.next();
				System.out.println("아이디 : " + id1);
				System.out.println("비밀번호 : " + pw1);
				
				if(signUp.containsKey(id1)==true && signUp.containsValue(pw1)== true ){
					System.out.println("로그인 성공");					
				} else {
					System.out.println("로그인 실패");
				}
				break;
			case 3 :
					System.out.println("프로그램을 종료합니다.");
				break;
			}
		}while(menu !=3);
		scan.close();

	}

public static void printMenu() {
	System.out.println("1.회원가입");
	System.out.println("2.로그인" );
	System.out.println("3.종료" );
	System.out.print("메뉴 선택 : ");
}
}
