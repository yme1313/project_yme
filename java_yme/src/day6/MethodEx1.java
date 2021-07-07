package day6;

public class MethodEx1 {

	public static void main(String[] args) {
		// 메소드 예제
		// 메소드명(값);
		add(1,2); // 3
		System.out.println(add(1,2));
		add2(1,2);
		printMultiTable(2);
		
		int num1 = 10, num2 = 15;
		int res =gcd(num1, num2);
		System.out.println(num1 + " 와 " + num2 + "의 최대 공약수 : " + res);
	}
	/* 선생님이 학생한테 문제를 풀라고 시켰을 때 선생님에게 알려주느냐, 칠판에 쓰느냐에 따라 리턴타입 달라짐
	 
	 * 기능	  : 두 정수가 주어지면 두 정수의 합을 알려주는 메소드
	 * 매개변수 : 두 정수 => int num1, int num2
	 * 리턴타입 : 정수의 합 => 정수 => int
	 * 매소드명 : add
	 * */
	public static int add(int num1, int num2) {
		int res = num1 + num2;
		return res;
	}
	/* 
	 * 기능	  : 두 정수가 주어지면 두 정수의 합을 콘솔에 출력하는 메소드
	 * 매개변수 : 두 정수 => int num1, int num2
	 * 리턴타입 : 없음 => void
	 * 매소드명 : add
	 * */
	public static void add2(int num1, int num2) {
		int res = num1 + num2;
		System.out.println(num1 + " + " + num2 + " = " + res);
	}
	/* 
	 기능 : 두 정수 와 산술 연산자가 주어지면 두 정수의 산술 연산 결과를 알려주는 메소드
	 매게변수 : 두 정수=> int num1, int num2  산술 연산자 => char ari
	 리턴타입 : 두 정수와 산술연산자에 의해 실행한 결과 => 실수 (double)
	 메소드명 : calculate
	 */
	public static double calculate(int num1, char op, int num2) {
		return 0.0;
	}
	/* 
	 기능 : 두 정수의 최대 공약수를 알려주는 메소드
	 매게변수 : 두 정수  => int num1, int num2
	 리턴타입 : 최대 공약수  => 정수(int)
	 메소드명 : gcd
	 */
	public static int gcd(int num1, int num2) {
		int i;
		int gcd=1;
		for(i=1 ; i<=num1 ; i+=1) {
			if(num1%i==0 && num2%i==0) {
		gcd=i;
			} 
		}return gcd;
	}
	/* 
	 기능 : num단을 출력하드 메소드
	 매게변수 : 정수 num => int num
	 리턴타입 : 없음 => void
	 메소드명 : printMultiTable
	 */
	public static void printMultiTable(int num) {
		int i; // num를 초기화하면 그값으로 계속 계산하기 때문에 초기화 하면 안됨
		System.out.println(num +"단");
		for(i=1 ; i<=9 ; i+=1) {
			System.out.println(num + " x " + i + " = " + num*i);
		}
		}
	}


