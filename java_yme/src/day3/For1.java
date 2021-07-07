package day3;

public class For1 {

	public static void main(String[] args) {
		/* Hello world 5번 for문으로 출력하는 예제*/
		int i;
		/* 반복횟수 : i는 1부터 5까지 1씩 증가
		 * 			=>초기화, 조건식, 증감식을 결정
		 * 			초기화 : ~부터
		 * 			조건식 : ~까지 (어디서부터 시작하느냐에 따라 표현이 달라짐)
		 * 			증감식 : ~씩 증가 또는 ~씩 감소
		 * 규칙성 : Hello world를 콘솔에 출력
		 */
		for(i=1; i<=5; i++) //동작하지 않기 떄문에 전위형,후위형 상관없음
	{ System.out.println("Hello world");
		}
	}

}
