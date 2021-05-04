package day7;

public class MethodEx6 {

	public static void main(String[] args) {
		printLeftTri('*',5);
		printRightTri('*',5);
		printTri('*', 5, TriShape.LEFT_TRI);
		printTri('*', 5, TriShape.RIGHT_TRI);
		/* 다음과 같이 출력하는 메소드를 만드세요.
		 * *
		 * **
		 * ***
		 * ****
		 * ***** 
		 * 기능 : 주어진 문자를 이용하여 왼쪽으로 붙은 삼각형을 n줄 출력하는 메소드
		 * 매개변수 : 주어진 문자 = > char ch , n줄은 정수 => int n , 
		 * 리턴타입 : x => void
		 * 메소드명 : printLeftTri
		 * */
	}
	
	public static void printLeftTri(char ch ,int n) {
		for( int i=1; i<=n ; i+=1) {
			for( int k =1; k<= i ; k+=1) {
				System.out.print(ch);
		} System.out.println();
		}
		}
		/* 다음과 같이 출력하는 메소드를 만드세요.
		 * 기능 : 주어진 문자를 이용하여 오른쪽으로 붙은 삼각형을 n줄을 출력하는 메소드
		 * 매개변수 : 주어진 문자 = > 주어진 문자 = > char ch , n줄은 정수 => int n
		 * 리턴타입 : x => void
		 * 메소드명 : printRightTri
		 *     *
		 *    **
		 *   ***
		 *  ****
		 * ***** 
		 * */
	public static void printRightTri(char ch ,int n) {
		for( int i=1; i<=n ; i+=1) {
			for( int k =1; k<= n-i ; k+=1) {
				System.out.print(" ");
		} 
			for( int k =1; k<= i ; k+=1) {
				System.out.print(ch);
		}System.out.println();
		}
}
		/* 기능 : 주어진 문자를 이용하여 n줄 삼각형 출력하는데 주어진 삼각형 종류에 맞게 출력하는 메소드 
		 * 매개변수 : 주어진 문자, n줄 , 삼각형 => char ch, int n, TriShape shape
		 * 리턴타입 : 없음 => void
		 * 메소드명 : printTri
		 * */
	public static void printTri(char ch, int n, TriShape shape) {
		switch(shape){
		case LEFT_TRI:
			printLeftTri(ch,n);
			break;
		case RIGHT_TRI:
			printRightTri(ch,n);
			break;
	}
  }
}
enum TriShape{LEFT_TRI, RIGHT_TRI}
