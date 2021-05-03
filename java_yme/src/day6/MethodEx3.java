package day6;

public class MethodEx3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num1 = 10, num2 = 20;
		System.out.println(num1 + ", " + num2);
		swap(num1, num2);
		System.out.println(num1 + ", " + num2);
	}
	/* 기능 : 두 정수의 값을 바꾸는 메소드 
	매개변수 : 두 정수 => int num1, int num2
	리턴타입 : 없음 => void
	메소드명 : swap
	*/
	public static void swap(int num1, int num2) {
		int tmp = num1;
		num1 = num2;
		num2 = tmp;
	}
}
/*
 * 메소드는 상황에 따라서 return값이 없을 수 있다.
 * 리턴타입이 없는 경우는 void라는 키워드로 대체
 * 메소드의 매개변수는 변수 선언시 값이 복사가 된다.
 * 매개변수가 일반변수인 경우 원본 값이 변하지 않는다.
 * 매개변수가 참조변수인 경우 원본 값이 변할 수 있음.
 * 일반변수 : 타입이 기본 타입인 경우
 * 		  : 값을 저장하는 변수
 * 참조변수 : 타입이 기본 타입이 아닌 경우 -> 배열, 열거형, 객체
 * 		  : 값이 아닌 주소를 저장
 * 
 * 메소드를 왜 사용하는가?
 * 재사용을 통해 코드의 길이를 줄이기 위해
 * 기능의 유지보수가 쉬워 진다.
 * 
 */
