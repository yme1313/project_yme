package free;

public class CarExample {

	public static void main(String[] args) {
		Car myCar = new Car();
		
		for(int i=1 ; i <=5 ; i++) {
			int problemlocation = myCar.run();
			switch(problemlocation){
				case 1:
					System.out.println("앞왼쪽 HankookTrie로 교채");
					myCar.frontLeftTire = new HankookTire("앞왼쪽", 15);
					break;
				case 2:
					System.out.println("앞오른쪽 KumhoTire로 교채");
					myCar.frontRightTire = new HankookTire("앞오른쪽", 13);
					break;
				case 3:
					System.out.println("뒤왼쪽 HankookTrie로 교채");
					myCar.backLeftTire = new HankookTire("뒤왼쪽", 14);
					break;
				case 4:
					System.out.println("뒤오른쪽 KumhoTire로 교채");
					myCar.backRightTire = new HankookTire("뒤오른쪽", 17);
					break;
			}
			System.out.println("-------------------------------------");
		}
	}
}

