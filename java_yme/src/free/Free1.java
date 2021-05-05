package free;

import java.util.Scanner;

public class Free1 {

	public static void main(String[] args) {
		/* 정수가 2의배수, 3의배수 6의배수, 2,3,6의 배수가 아닌지 
		 * 판별하는 예제를 이중 if문을 이용 하여 작성
		 * */
		System.out.print("정수를 입력하세요 : ");
		Scanner scan = new Scanner(System.in);
		int n = scan.nextInt();
		
		if(n%2==0) {
			if(n%3==0) {
				System.out.println("6의 배수 입니다.");
			} else  {
				System.out.println("2의 배수 입니다.");
			} 
		}else if(n%3==0) {
				System.out.println("3의 배수 입니다.");
			} else {
				System.out.println("2,3,6의 배수가 아닙니다.");
			}
		}
	}
