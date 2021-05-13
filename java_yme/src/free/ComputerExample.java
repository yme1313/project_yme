package free;

public class ComputerExample {

	public static void main(String[] args) {
		
		Computer myCom = new Computer();
		
		int[] values1 = {1,2,3};
		int res1 = myCom.sum1(values1);
		System.out.println("res1 : " + res1);
		
		int res2 = myCom.sum1(new int[] {1,2,3,4,5});
		System.out.println("res2 : " + res2);

		int res3 = myCom.sum2(1,2,3);
		System.out.println("res3 : " + res3);
		
		int res4 = myCom.sum2(1,2,3,4,5);
		System.out.println("res4 : " + res4);
	}

}
