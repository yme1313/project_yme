package free;

public class ChileExample {

	public static void main(String[] args) {
		Child c = new Child();
		Parent p = c;
		p.method1();
		p.method2();
		//p.method3(); // 부모클래스로 타입변환이 되었음으로 자식클래스의 메소드는 호출 불가

	}

}
