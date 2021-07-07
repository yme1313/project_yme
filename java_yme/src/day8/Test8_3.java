package day8;

import java.util.Scanner;

public class Test8_3 {

	public static void main(String[] args) {
		/* 4개의 성적을 입력받아 합격인지 불합격인지 판별하는 코드를 작성하세요.
		 * 합격 기준은 
		 *   - 모든 성적이 과락이 없어야 함
		 *   - 평균 60점이상
		 *   과락 : 성적이 40점 미만인 경우
		 * 
		 * 예시 
		 * 성적 : 40 30 100 100
		 * 불합격입니다.
		 * 성적 : 60 40 100 100
		 * 합격입니다.
		 * 성적 : 40 50 40 60
		 * 불합격입니다.
		 * */
		
		//성적을 입력
		System.out.print("성적 : ");
		
		Scanner scan = new Scanner(System.in);
		/*
		int sco1 = scan.nextInt();
		int sco2 = scan.nextInt();
		int sco3 = scan.nextInt();
		int sco4 = scan.nextInt();
		
		//합격 여부 설정
		if((sco1+sco2+sco3+sco4)/4 <60) {
			System.out.println("불합격");
		} else if(sco1 < 40 || sco2 < 40 || sco3 < 40 || sco4 < 40 ) {
			System.out.println("불합격");
		} else {
			System.out.println("합격");
		}
		*/
		
		/* 
		 반복횟수 : 
		 규칙성 : 
		 반복문 종료 후 :*/
		int score[] = new int[4];
		for(int i=0 ; i<score.length ; i+=1) {
			score[i]=scan.nextInt();
		}
		scan.close();
		
		//합격 여부 결정
		//평균 60점 이상
		int sum = 0;
		boolean pass = true; // 합격여부를 알려주는 변수
		for(int tmp : score) {
			sum += tmp;
		}
		double avg = (double)sum / score.length;
		if(avg<60) {
			pass = false;
		}
		//과락이 있는지 없는지
		for(int tmp : score) {
			if(tmp <40) {
			pass = false;
			}
		}
		if(pass) {
			System.out.println("합격입니다.");
		} else {
			System.out.println("불합격입니다.");
		}
}
}