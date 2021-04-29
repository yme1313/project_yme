package day4;

import java.util.Scanner;

public class Test4_4 {

	public static void main(String[] args) {
		/* */
		
		//Math.random()은 0보다 크거나 같고 1보다 작은 임의의 실수를 생성하는 기능		

		/* 정수를 랜덤으로 생성하여 생성된 숫자를 맞추는 게임
		 * 예시 (랜덤하게 생성된 숫자가 25인 경우)
		 * 정수가 랜덤으로 생성되었습니다. 게임 시작!
		 * 정수를 입력하세요(1~100) : 100
		 * down
		 * 정수를 입력하세요(1~100) : 40
		 * down
		 * 정수를 입력하세요(1~100) : 10
		 * up
		 * 정수를 입력하세요(1~100) : 20
		 * up 
		 * 정수를 입력하세요(1~100) : 25
		 * 정답입니다.
		 * 반복횟수 : x
		 * 규칙성 : 정수를 입력하세요 문자열을 출력, 콘솔에서 정수를 입력 받음
		 * 		  입력받은 정수가 랜덤한 수보다 크면 down이라고 출력하고, 
		 *  	  입력받은 정수가 작으면 up이라고 출력하고 
		 *  	  입력받은 정수가 같으면 정답입니다라고 출력 후 종료
		 * */
		int min =1, max = 100;
		int r = (int)(Math.random() * (max - min + 1) + min);
		
		int num;
		Scanner scan = new Scanner(System.in);
		System.out.println(r);

		for( ; ; ) {
			System.out.print("정수를 입력하세요("+min + "~" + max+") : ");
		    num=scan.nextInt();
		 if (num > r) {
			System.out.println("down");
		} else if (num < r) {
			System.out.println("up");
		} if (num ==r) {
			System.out.println("정답입니다.");
			break;
		} 
		 
	}
}
}

