package day7;

public class MethodEx4 {

	public static void main(String[] args) {
		// 최대 공약수를 이용하여 최소 공배수를 구하는 메소드를 작성하세요.
		// 두 정수를 A, B라 하고 최대 공약수를 G, 최소 공배수를 L이라고 했을때
		// A = Ga , B=Gb 로 표현할 수 있고,
		// L = A*B/G 로 나타낼 수 있다.
		System.out.println(gcd1(8,12));
		gcd2(8,12);
		System.out.println(lcm(8,12));
		
		/*
		 * 기능 : 두 정수의 최대 공약수를 알려주는 메소드
		 * 매개변수 : 두 정수 => int num1 , int num2
		 * 리턴타입 : 최대공약수 정수 int
		 * 메소드명 : gcd1
		 * */
	}
		public static int gcd1(int num1, int num2) {
			int i;
			int res=1;
			for(i=1 ; i<=num1 ; i+=1) {
				if(num1%i==0 && num2%i==0) {
			res=i;
				} 
			}return res;
		/* 
		 * 기능 : 두 정수의 최대 공약수를 출력하는 메소드
		 * 매개변수 : 두 정수 => int num1 , int num2
		 * 리턴타입 : 없음 => void
	 	 * 메소드명 : gcd2
		 * */	
		}
		public static void gcd2(int num1, int num2) {
			int i;
			int res=1;
			for(i=1 ; i<=num1 ; i+=1) {
				if(num1%i==0 && num2%i==0) {
			res=i;
				} 
			} System.out.println(num1 + " 와 " + num2 + " 의 최대 공약수 : " + res);
		}
		/* 기능 : 두 정수의 최소 공배수를 알려주는 메소드
		 * 매개변수 : 두 정수 => int num1, int num2 
		 * 리턴타입 : 최소 공배수 => 정수 => int
		 * 메소드명 : lcm 
		 * */
		public static int lcm(int num1, int num2) {
			int res = num1 * num2 / gcd1(num1, num2);
			return res;
		}
}
	

