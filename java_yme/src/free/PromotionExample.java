package free;

public class PromotionExample {

	public static void main(String[] args) {
		B b = new B();
		C c = new C();
		D d = new D();

		
		A a1 = b;
		A a2 = c;
		A a3 = d;
		A a4 = e;
		B b1 = d;
		//B b2 = e; // 부모클래스가 아님으로 자동변환 불가
		C c1 = e;

	}

}
