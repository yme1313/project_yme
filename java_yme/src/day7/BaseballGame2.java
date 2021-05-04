package day7;

import java.util.Scanner;

public class BaseballGame2 {

	public static void main(String[] args) {
		/* 숫자 야구 게임을 메소드를 이용하여 구현하세요.
		 * 앞에서 사용한 contains와 initRandomArray를 이용하고
		 * 필요하면 새로운 메소드를 만들어서 작성해보세요.
		 */
		int []com = new int[3];
		int []user = new int[3];
		int i,k ;
		int ball,strike,out;
		//컴퓨터가 랜덤으로 중되지 않은 세수를 생성
		com = initRandomArray2(3, 1, 9);
		//3S(맞출떄)일 때까지 반복
			//숫자 입력
		Scanner scan = new Scanner(System.in);
		do {
			//사용자 숫자 입력 : 입력 시 중복된 숫자 입력하지 않을 거라고 가정
			System.out.print("입력하세요 : ");
			for(i = 0; i<3; i+=1) {
				user[i] = scan.nextInt();
			}
			
			//두 배열에서 같은 숫자가 있는지 확인하는데 같은 숫자의 갯수를 ball에 저장
			//이 때 찾은 같은 숫자의 갯수는 실제 ball의 갯수가 아니라 ball과 strike 갯수의 합
			ball = 0;
			for(i = 0; i<com.length; i+=1) {
				for(k=0; k<user.length; k+=1 ) {
					if(com[i] == user[k]) {
						ball++;
					}
				}
			}
			//strike 갯수 확인
			strike = 0;
			for(i = 0; i<com.length; i+=1) {
				if(com[i] == user[i]) {
					strike++;
				}
			}
			//ball 갯수 확인 : 같은 수의 갯수 - strike의 갯수
			ball = ball - strike;
			
			//결과 출력
			if(strike != 0) {
				System.out.print(strike+"S");
			}
			if(ball != 0) {
				System.out.print(ball+"B");
			}
			if(strike == 0 && ball == 0) {
				System.out.print("O");
			}
			System.out.println();
		}while(strike != 3);
		System.out.println("정답입니다.");
		scan.close();
	}
			//스트라이크와 볼의 갯수를 셈
		
			//스트라이크, 볼, 아웃을 판정
		
		
	

	public static boolean contains(int arr[],int num, int count){
		//예외처리 : 배열의 갯수보다 count가 큰 경우
		if(arr.length<count) {
			//비교할 갯수를 배열의 크기로수정
			count = arr.length;
		}
		for(int i=0; i <count; i+=1) {
			//배열의 값과 num의 값이 같은 경우(중복된 경우)
			if(arr[i]==num) {
				return true;
			}
	}
		return false;
	}
	
	public static int[] initRandomArray2(int size, int min, int max) { // size는 배열의 수
		int []arr = new int[size];
		//예외처리 : min 과 max가 바뀐 경우
		if(min > max) {
			int tmp = min;
			min = max;
			max = tmp;
	}
		//배열에 랜덤으로 수를 생성하여 저장(중복되지 않게 처리할 예정)
		for(int i=0 ; i < arr.length; i+=1) {
			
			int r = (int)(Math.random() * (max - min + 1) + min);
			int cnt = i;
			if(!contains(arr , r , cnt)) {
				arr[cnt]=r;
				cnt+=1;
	} 
	
} return arr;	
}
}
