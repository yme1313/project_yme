package day15;

public class ClassCastExeptionTest {

	public static void main(String[] args) {
		Figure f1 = new Rect();
		Figure f2 = new Figure();
		
		Rect r1 = (Rect)f1;
		//클래스 타입 변환이 불가능하여 예외 발생
		//Rect r2 = (Rect)f2
		if(f2 instanceof  Rect) {
			Rect r2 = (Rect)f2;
			System.out.println("타입 변환 성공");
		}
		
	}
}
class Figure{}
class Rect extends Figure{}