package day2;

public class IncreaseDecreaseOperater {

	public static void main(String[] args) {
		//증감연산자
		int num1 = 10, num2 = 10;
		System.out.println("  num1 = "+   num1 + ",   num2 = " +   num2);
		System.out.println("++num1 = "+ ++num1 + ",   num2++ = " + num2++);
		System.out.println("  num1 = "+ num1 + ",   num2 = " + num2);
		//11
		num1++;
		++num1;
		//이 때 num1을 출력하면 얼마가 나올까요?
		//13 
		
        num1=  10;
        num2 = 10;
        		
		System.out.println("  num1 = "+ num1 + ",   num2 = " + num2);
		num1++; // 동작이 없고 증가만 함
		System.out.println("++num1 = "+ num1 + ",   num2++ = " + num2);
		++num2; // 전위형과 후위형이 헷갈리면 동작을 나눠서 쓰자
		System.out.println("  num1 = "+ num1 + ",   num2 = " + num2);
	}

}
