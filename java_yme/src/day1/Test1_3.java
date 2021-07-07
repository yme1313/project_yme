package day1;

import java.util.Scanner;

public class Test1_3 {

	public static void main(String[] args) {
		// 두 정수와 문자를 입력받아 출력하는 예제를 작성하세요.
		/* 예시
		 * 정수1을 입력하세요 : 1
		 * 문자를 입력하세요  : +
		 * 정수2를 입력하세요 : 2
		 * 1 + 2 
		 * 예시2
		 * 두 정수와 문자를 입력하세요(예: 1 + 2) : 1 + 2 */
		 
		
			Scanner scan = new Scanner(System.in);
			
			System.out.print("정수1을 입력하세요 : ");
			int num = scan.nextInt();
			System.out.print("문자를 입력하세요 : ");
			char ch = scan.next().charAt(0);			
			System.out.print("정수2를 입력하세요 : ");
			int num1 = scan.nextInt();
			System.out.println(""+num+ch+num1);
			
			System.out.print("두 정수와 문자를 입력하세요(예: 1 + 2) : ");
			num = scan.nextInt();
			ch= scan.next().charAt(0);
			num1 = scan.nextInt();
			System.out.println(""+num+ch+num1);
			
			scan.close();
			
	}

}
