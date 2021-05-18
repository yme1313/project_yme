package day16;

import java.util.Scanner;

public class TryTest4 {

	public static void main(String[] args) {
		/* 두 정수와 산술 연산자를 입력받아 산술연산 결과를 출력하는 코드를 작성하세요.*/
		
		Scanner scan = new Scanner(System.in);
		System.out.print("두 정수와 산술 연산자를 입력 하세요 : ");
		//예외 발생
		try {
			int num1 = scan.nextInt();
			char op = scan.next().charAt(0);
			int num2 = scan.nextInt();
			double res = 0.0;
			
			switch(op) {
			case '+' : 
				res = num1 + num2;
				break;
			case '-' :
				res = num1 - num2;
				break;
			case '*' :
				res= num1 * num2;
				break;
			case '/' : 
				res = (double)num1 / num2;
				break;
			case '%' : 
				//예외 발생
				res = num1 / num2;
				break;
			default :
				throw new Exception("잘못된 연산자입니다.");
				
		}
			System.out.println(num1  +" "+ op + " " + num2 + " = " + res);
		} catch (ArithmeticException e) {
			System.out.println("0으로 나눌 수 없습니다.");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} 
		System.out.println("프로그램 종료합니다.");
		scan.close();
	}
	
	/* 기능 : 두 정수와 산술 연산자가 주어지면 산술
	 * 
	 * 
	 * */
}
