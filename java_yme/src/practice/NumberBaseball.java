package practice;

import java.util.Scanner;

public class NumberBaseball {

	public static void main(String[] args) {
		/* 숫자 야구 게임 
		 *  - 1 ~ 9 사이의 중복되지 않은 3개의 정수를 랜덤으로 생성
		 *  - B : 숫자는 있지만 위치는 다른 경우
		 *  - S : 숫자도 있고, 위치가 같은 경우
		 *  - O : 일치하는 숫자가 하나도 없는 경우
		 *  예시 : 3 9 5
		 *  입력 하세요 : 1 2 3
		 *  1B
		 *  입력 하세요 : 4 5 6
		 *  1B
		 *  입력하세요 : 3 4 5
		 *  2S
		 *  입력하세요 : 3 5 9
		 *  1S2B
		 *  입력하세요 : 6 7 8
		 *  O
		 *  입력하세요 : 3 9 5
		 *  3S
		 *  정답입니다.
		 */
		int com[] = new int[3];
		int user[] = new int[3];
		int strike;
		int ball;
		int max =9;
		int min =1;
		int cnt=0; //컴퓨터가 랜덤한 수를 저장(중복되지 않아야 함)
		boolean isDuplicated; //중복여부
		
		while(cnt < 3) {
			int r = (int)(Math.random()*(max-min+1) + min);
			isDuplicated = false;
			for(int i = 0; i< cnt; i+=1) {
				if(com[i] == r) {
					isDuplicated = true;
				}
			}
			
			if(!isDuplicated) {
			com[cnt]= r;
				cnt ++;
			}
		}
		
		Scanner scan = new Scanner(System.in);
		do {
			System.out.print("숫자를 입력하세요 : ");
			for(int i =0 ; i<3 ; i++) {
				user[i] = scan.nextInt();
			}
		
		ball =0;
		for(int i=0 ; i< com.length ; i++) {
			for(int k=0; k < user.length ; k++) {
				if(com[i] ==user[k]) {
					ball++;
				}
			}
		}
		
		strike =0;
		for(int i=0 ; i< com.length ; i++) {
				if(com[i] == user[i]) {
					strike++;
				}
		}
		ball = ball-strike;
		
		if(strike!=0) {
			System.out.println(strike + "S");
		}
		if(ball!=0) {
			System.out.println(ball + "B");
		}
		if(strike==0 && ball==0)
			System.out.println("O");
			
		} while (strike !=3); {
			System.out.println("정답입니다.");
		}
		
		
		
		
		scan.close();
	}
}

