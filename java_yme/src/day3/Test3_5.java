package day3;

import java.util.Scanner;

public class Test3_5 {

	public static void main(String[] args) {
		/* 월의 마지막 일수를 출력하는 예제를 swtich문으로 작성하세요
		 * 31: 1 3 5 7 8 10 12
		 * 30: 4 6 9 11
		 * 28" 2
		 * */
		/* 1 3 5 7 8 10 12 면 31을 출력 */
		System.out.print("월을 입력하세요 : ");
		
		Scanner scan = new Scanner(System.in);
		int month = scan.nextInt();
		
		switch(month) {
		case 1 ,3, 5, 7, 8, 10, 12:
			System.out.println(month +"월은 31일까지 있습니다.");
			break;	
		case 4 :
			System.out.println(month +"월은 30일까지 있습니다.");
			break;
		case 6 :
			System.out.println(month +"월은 30일까지 있습니다.");
			break;
		case 9 :
			System.out.println(month +"월은 30일까지 있습니다.");
			break;
		case 11 :
			System.out.println(month +"월은 30일까지 있습니다.");
			break;
		case 2:
			System.out.println(month +"월은 28일까지 있습니다.");
			break;
		default:
			System.out.println(month +"월은 올바른 월이 아닙니다.");
		scan.close();
		
		}
	}
}
