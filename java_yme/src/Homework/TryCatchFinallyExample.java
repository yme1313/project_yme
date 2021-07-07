package Homework;

public class TryCatchFinallyExample {

	public static void main(String[] args) {
		/* String str = null;
		System.out.println(str.length()); */

		try {
			Class clazz = Class.forName("java.lang.String2");
			System.out.println("정상 실행");
		} catch (ClassNotFoundException e) {
			System.out.println("클래스가 존재하지 않습니다.");
		} finally {
			System.out.println("JAVA 공부합시다.");
		}
	}

}
