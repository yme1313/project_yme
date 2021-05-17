package free;

public class CalculatorExample {

	public static void main(String[] args) {
		double res1 = 10 * 10 * Calculator.pi;
		int res2 = Calculator.plus(10,5);
		int res3 = Calculator.minus(10,5);
		
		System.out.println("res1: " + res1);
		System.out.println("res2: " + res2);
		System.out.println("res3: " + res3);
	
	}
}
