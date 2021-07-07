package day2;

import java.util.Scanner;

public class Test2_7 {

	public static void main(String[] args) {
		/* 월의 마지막 일수를 출력하는 코드를 작성하세요.
		 * 31 : 1 3 5 7 8 10 12
		 * 30 : 4 6 9 11
		 * 28 : 2
		 * 예시
		 * 월을 입력하세요 : 2
		 * 2월은 28일까지 있습니다.*/
		
		System.out.print("월을 입력하세요: ");
		Scanner scan = new Scanner(System.in);
		int month = scan.nextInt();
		
		if(month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12) {
			System.out.println("31");
		} else if(month==4 || month==6 || month==9 || month==11) {
		    System.out.println("30");
		} else { System.out.println("28");
			}

	}

}
