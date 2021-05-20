package day17;

public class StringTest6 {

	public static void main(String[] args) {
		//전부소문자로
		System.out.println("Hello".toLowerCase());
		//전부대문자로
		System.out.println("Hello".toUpperCase());
		//trim() 예제
		String str = "\n\n\n    안녕하세요     \n\n\n";
		System.out.println("trim()전 str");
		System.out.println(str);
		System.out.println("trim()후 str");
		System.out.println(str.trim());
		//valueOf() 예제
		String num = ""+1;
		System.out.println(num);
		String num1 = String.valueOf(1);
		System.out.println(num1);
		
		
	}
}
