package day1;

public class valuable1 {

	public static void main(String[] args) {
		//정수형 변수 선언
		//변수타입 변수명
		byte num1 = 1;
		short num2 =32767;
		int num3 = 214748367;
		//long형은 뒤에 대,소문자L(접미사) 붙임,숫자가 int 범위보다 큰 경우
		long num4 = 214748368L;
		char ch1 = '한';
		int num5 = 0b111;//정수 앞에 0b를 붙이면 2진수, 2진수 111=>10진수 7
		int num6 = 0111; //정수 앞에 0을 붙이면 8진수, 8진수 111=>10진수 73
		int num7 = 0x111;//정수 앞에 0x를 붙이면 16진수, 16진수 111=>10진수 273
		int num8 = 111; //정수 앞에 아무것도 안 붙이면 10진수
		/* 10진수 : 123 = 1x10^2 + 2x10^1 + 3x10^0
		 * 8진수 : 123 = 1x8^2 + 2x8^1 = 3x8^0 , 10진수로 변환시 83
		 */
		System.out.println(num5);
		System.out.println(num6);
		System.out.println(num7);
		System.out.println(num8);
		float dnum1 = 1.12345678901234567f;
		double dnum2 = 1.12345678901234567;
		System.out.println(dnum1);
		System.out.println(dnum2);
		boolean stop = true;
		System.out.println(stop);
		String str = "Hello";
		System.out.println(str);
	}

}
