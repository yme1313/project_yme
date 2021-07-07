package day4;

public class Test4_2 {

	public static void main(String[] args) {
		/* 1부터 10까지의 짝수들을 continue를 이용하여 출력하는 코드를 작성헤요.
		 * 반복횟수 : i를 1부터 10까지 i는 1씩 증가
		 * 규칙성: 짝수들을 출력
		 * 반복 종류 후 : 없음
		 * 1부터 10까지 출력 하되 2를 나누었을때 0이 아니면 증감식으로 continue
		 * */
		int i =1;
		for(i=1 ;i<=10 ;i+=1 ) {
			if(i%2!=0)
				continue;
			System.out.print(i + " ");
		}
		
	}

}
