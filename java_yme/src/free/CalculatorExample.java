package free;

public class CalculatorExample {

	public static void main(String[] args) {
		Calculator myCalc = new Calculator();
		
		double res = myCalc.areaRectangle(10);
		double res1 = myCalc.areaRectangle(10, 20);
		
		System.out.println("정사각형의 넓이 : " + res);
		System.out.println("직사각형의 넓이 : " + res1);
		
	}
}
