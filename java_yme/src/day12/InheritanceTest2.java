package day12;

public class InheritanceTest2 {

	public static void main(String[] args) {
		smartPhone sp = new smartPhone("010 1234 5678", "Red", "아이폰12 mini");
		sp.print();
		
	}
}
//폰 클래스
class phone{
	private String num;
	private String color;
	private String model;
	public phone(String num, String color, String model) {
		System.out.println("폰 생성자입니다.");
		this.num = num;
		this.color = color;
		this.model = model;
	}
	public phone() {
		System.out.println("폰 기본 생성자입니다.");
	}
	public void print() {
		System.out.println("번호: " + num);
		System.out.println("색상: " + color);
		System.out.println("모델: " + model);
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	
}
//스마트폰 클래스
class smartPhone extends phone{
	int camera; // 카메라 화소(단위 만)
	public smartPhone(String num, String color, String model) {
		//부모 클래스의 생성자가 없으면 super();가 생략되어 있음
		//System.out.println( ); //에러 발생 : super() 생성자 위에 코드가 있으면 안 됨
		super(num, color, model);
		//this();//에러 발생 : 부모 클래스의 생성자를 2번 호출하는 경우이기 떄문에
		System.out.println("스마트 폰 생성자입니다.");
	}
	public smartPhone() {
		//super();
	}
}