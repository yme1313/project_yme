package day5;

import java.util.Scanner;

public class Test5_4 {

	public static void main(String[] args) {
		/* 학생 3명의 성적을 입력 받은 후 총점과 평균을 출력하는 코드를 작성하세요.
		 * 
		 */
		
		Scanner scan = new Scanner(System.in);
		//학생 3명의 성적을 입력,
		int score[] = new int[3];
		int i;
		for(i=0 ; i <score.length ; i+=1 )
		{  System.out.print("성적 입력 : ");
			score[i]=scan.nextInt();
		}
		
		//총점을 구함
		int sum =0;
		for(i=0 ; i < score.length ; i+=1) {
			sum = sum + score[i];
		}
		
		//평균
		double avg = (double)sum / score.length;
		System.out.println("총점 : " + sum + "점, 평균 : " + avg + "점");
		
		}
	}


