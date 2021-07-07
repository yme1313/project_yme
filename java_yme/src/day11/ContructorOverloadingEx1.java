package day11;

public class ContructorOverloadingEx1 {

	public static void main(String[] args) {
		A a1 = new A();
		A a2 = new A(1,2);
		A a3 = new A(1.0 ,2); //실수가 정수로 자동형 변환이 안되기 때문에 
		A a4 = new A('a',3);
	}

}
class A{
	private int num1;
	private int num2;
	public A() {}
	
	public A(int num1, int num2) {
		super();
		this.num1 = num1;
		this.num2 = num2;
	}
	//복사 생성자 : 생성자의 매개변수로 같은 클래스의 객체가 오는 경우
	public A(A c) {
		num1 = c.num1;
		num2 = c.num2;
	}

	public int getNum1() {
		return num1;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	public int getNum2() {
		return num2;
	}
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	
	public A(double num10,double num11) {
	} 
	
}
