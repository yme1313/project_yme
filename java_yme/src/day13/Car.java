package day13;

public class Car {
	//전원, 기어, 차종, 제조사
	private boolean power; //전원 on/off
	private char gear; //기어 수동, 자동
	private String type; //종류 
	private String company; //현대, 기아
	
	public void turnOn() {power = true;}
	public void turnOff() {power = false;}
	
	public Car(String type , String company) {
		this.type=type;
		this.company=company;
	}
	public void print() {
		System.out.println("제조 : " + company);
		System.out.println("타입 : " + type);
		System.out.println("전원 : " + power);
		System.out.println("기어 : " + gear);
	}
	public boolean isPower() {
		return power;
	}
	public char getGear() {
		return gear;
	}
	public void setGear(char gear) {
		this.gear = gear;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCompany() {
		return company;
	}

}
