package free;

public class Free1 {

	public static void main(String[] args) {
		System.out.println(sum(1,6));
		sum2(3,7);
		System.out.println();
		System.out.println(cal(2,'*',9));
		
		
		} 
	
	/* 선생님이 학생한테 문제를 풀라고 시켰을 때 선생님에게 알려주느냐, 칠판에 쓰느냐에 따라 리턴타입 달라짐
	 
	 * 기능	  : 두 정수가 주어지면 두 정수의 합을 알려주는 메소드
	 * 매개변수 : 두 정수 => int n1, int n2
	 * 리턴타입 : 정수 => int
	 * 매소드명 : sum
	 * */
		public static int sum(int n1, int n2) {
			int res =  n1 + n2;
			return res;
		}
		
		/* 
		 * 기능	  : 두 정수가 주어지면 두 정수의 합을 콘솔에 출력하는 메소드
		 * 매개변수 : 두 정수 => int n1, int n2
		 * 리턴타입 : 없음 -> void
		 * 매소드명 : sum2
		 * */
		public static void sum2(int n1, int n2) {
			int res = n1 + n2;
			System.out.print(res);
		}
		/* 
		 기능 : 두 정수 와 산술 연산자가 주어지면 두 정수의 산술 연산 결과를 알려주는 메소드
		 매게변수 : 두 정수 => int n1, int n2 / 산술 연산자 => char op
		 리턴타입 : double => 두 정수를 나눌 경우 실수가 나올 수도 있음
		 메소드명 : cal
		 */
		public static double cal(int n1, char op , int n2) {
			double res = 0.0;
			switch(op) {
			case '+' : res= n1 + n2;			break;
			case '-' : res= n1 - n2;			break;	
			case '*' : res= n1 * n2;			break;
			case '/' : res= (double)n1 / n2; 	break;
			case '%' : res= n1 % n2;			break;
			} 
			return res;
}
		
		
		
		
}
		


	
