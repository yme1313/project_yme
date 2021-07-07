package day11;

public class StaticTest {

	public static void main(String[] args) {
		//객체 멤버 변수 num1을 호출 => 객체를 생성한 후 멤버 변수를 호출할 수 있다.
		//객체 생성 없이 객체 멤버변수를 호출할 수 없다.
		TestB t1 = new TestB();
		TestB t2 = new TestB();
		t1.num1 = 10;
		//t1.num2 = 30; 가능은 하지만 이러한 방법으로 클래스 멤버변수를 잘 사용하지 않음
		//클래스(정적) 멤버변수 num2를 호출 => 클래스 이름을 통해 호출
		//객체 생성이 필수가 아님
		TestB.num2 = 20;
		
		t2.printNum1();
		TestB.printNum2();
	}

}
class TestB{
	// 객체 멤버 변수 정수 num1을 선언
	public int num1;
	// 클래스(정적) 멤버 변수 정수 num2를 선언
	public static int num2;
	
	public void printNum1() {
		System.out.println("num1 : " + num1);
		//클래스 멤버변수/메소드는 객체 메소드에서 사용 가능
		num2 =20;
		printNum2();
	}
	public static void printNum2() {
		//클래스 멤버변수는 클래스 메소드에서 사용가능
		System.out.println("num2 : " + num2);
		//num1 = 10; // 에러 발생
		//rpintNum1(); // 에러 발생
	}
}
