package day7;

public class MethodEx5 {

	public static void main(String[] args) {
		// *****을 출력하도록 메소드를 생성하여 테스트 해보세요
		printChar1('-',5);
		System.out.println(printChar2('+',9));
		System.out.println(printChar2('+',9) + printChar2('=',5));
	}
	/* 기능 : *****을 출력
	 * 매개변수: *을 출력 char = ch , 반복횟수 int =count
	 * 리턴타입: 없음
	 * 메소드명 : printChar1 
	 */
	public static void printChar1(char ch, int count) {
		int i;
		for ( i=0; i<count ; i+=1) {
			System.out.print(ch);
		} 
		System.out.println();
	}
	/* 기능 : 주어진 문자(ch)를 주어진 정수번(count) 반복하여 하나의 문자열로 알려주는 메소드
	 * 매개변수: *을 출력 char = ch , 반복횟수 int =count
	 * 리턴타입: 문자열 => String
	 * 메소드명 : printChar2 
	 */
	public static String printChar2(char ch, int count) {
		String str = "";
		//문자열 + 문자 => 문자열
		for(int i = 0 ; i <count; i+=1) {
			// i=0일때 "" + * => "*"
			// i=1일때 "" + ** => "**"
			// i=count=1 "**..**" + '*' => "*..*"(*이 count개)
			str = str + ch;
		}
		return str;
	}
}
