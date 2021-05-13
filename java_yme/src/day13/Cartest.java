package day13;

public class Cartest {

	public static void main(String[] args) {
		AutoCar ac = new AutoCar("1종","기아");
		StickCar sc = new StickCar("2종","현대");
		ac.turnOn();
		ac.setGear('D');
		sc.setGear('3');
		ac.print();
		System.out.println("---------------------");
		sc.print();
		System.out.println("---------------------");
		Car c = ac;
		c.print();
		System.out.println("---------------------");
		//Car c2 = new Car("2종","기아");
		Car c2 = new AutoCar("2종","기아");
		ac = (AutoCar)c2;
		ac.print();
		//차를 관리하는데 수동은 수동끼리 자동은 자동끼리 관리
		AutoCar aclist[] = new AutoCar[5];
		StickCar sclist[] = new StickCar[5];
		//차를 관리하는데 수동과 자동 상관없이 같이 관리
		Car clist[] = new Car[5];
		clist[0] = ac;
		clist[1] = sc;
	}	
}
