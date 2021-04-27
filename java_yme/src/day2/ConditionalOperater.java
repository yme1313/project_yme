package day2;

public class ConditionalOperater {

	public static void main(String[] args) {
		// 조건선택연산자 예제
		// 조건식 : 결과가 참 또는 거짓으로 나오는 식
		// 결과가 숫자, 참 또는 거짓 모두가능함으로 알 수 없음
		int num = 8;
		String result = ( num % 2 == 0) ? "짝수" : "홀수";
		System.out.println(num + "는 " + result);
	}

}
