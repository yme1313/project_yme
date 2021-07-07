package day2;

import java.util.Scanner;

public class Test2_6 {

	public static void main(String[] args) {
		/* 성적을 입력 받아 입력받은 성적을 출력하는 코드를 작성하세요.
		 * A: 90이상 100이하
		 * B: 80이상 90미만
		 * C:70이상 80미만
		 * D: 60이상 70미만
		 * F: 0이상 60미만
		 * 잘못된 성적 : 0미만 100초과 */
		
		System.out.print("성적을 입력하세요: ");
		Scanner scan = new Scanner(System.in);
		int score = scan.nextInt();
		
		if(90 <=score && score <=100) {
			System.out.println("A");
		} else if(80 <=score && score <90) {
			System.out.println("B");
		} else if(70 <=score && score <80) {
			System.out.println("C");
		} else if(60 <=score && score <70) {
			System.out.println("D");
		} else if(0 <=score && score <60) {
			System.out.println("F");
		} else {System.out.println("잘못된 성적");
	}
	}

}
