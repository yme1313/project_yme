package free;

public class MyClassExample {

	public static void main(String[] args) {
		//필드 활용
		System.out.println("1)--------------------------");
		MyClass c1 = new MyClass();
		c1.rc.turnOn();
		c1.rc.setVolume(5);
		//생성자 활용
		System.out.println("2)--------------------------");
		MyClass c2 = new MyClass(new Audio());
		//메소드A활용
		System.out.println("3)--------------------------");
		MyClass c3 = new MyClass();
		c3.methodA();
		//메소드B활용
		System.out.println("4)--------------------------");
		MyClass c4 = new MyClass();
		c3.methodB(new Television());

	}

}
