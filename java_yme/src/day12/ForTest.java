package day12;

public class ForTest {

	public static void main(String[] args) {
		// 조건문과 반복문의 실행문이 1줄이면 {} 생략가능
		for( int i=1 ; i<=5 ; i+=1) 
			System.out.print(i + " ");
		System.out.println();
		int num = 2;
		if(num%2==0)
			System.out.println("짝수");
		else
			System.out.println("홀수");
	}

}
