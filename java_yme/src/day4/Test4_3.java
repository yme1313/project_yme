package day4;

import java.util.Scanner;

public class Test4_3 {

	public static void main(String[] args) {
		/* 정수를 거꾸로 출력하는 코드를 작성하세요.
		 * 예시
		 * 정수를 입력하세요 : 1234
		 * 결과 : 4321
		 * 예시
		 * 정수를 입력하세요 : 120
		 * 결과 : 021
		 * 반복횟수 : X 
		 * 규칙성 : num를 10으로 나눈 나머지를 출력하고
		 * 		  num에 num를 10으로 나눈 몫을 저장
		 * 		  num가 0이면 반복문을 종료
		 * 반복문 종료 후 :
		 * */
		
		System.out.print("정수를 입력하세요 : ");
		Scanner scan = new Scanner(System.in);
		
		int num = scan.nextInt();
		System.out.print("결과 : ");
		scan.close();
		for( ; ;  ) {
			System.out.print(num % 10);
			num=num/10;
			if(num==0) {
				break;
			}
		}
	}

}
