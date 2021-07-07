package day4;

public class After {

	public static void main(String[] args) {

	/* i는 1부터 5보다 작을 경우 실행문을 실행, i는 1씩 증가
	 * 실핼문 : k는 4부터 0보다 클 경우 실행문2를 실행, k는 1씩 감소
	 * 실행문2: k가 i보다 크다면 " " 을 출력하고 그렇지 않으면 "*"을 출력
	 * k = 횡으로 작업횟수
	 * i = 현재 작업하는 줄
	 * */
		
		for( int i=1 ; i <=4 ; i++ ) {
			for(int k=4 ;k > 0 ; k--) {	   //  
				if( i < k) {
					System.out.print(" "); // k가 i보다 크면 " "을 출력
				} else {
					System.out.print("*"); //그렇지 않으면 "*"을 출력
				}
			}System.out.println();         //줄바꾸기용
		}
	}
		}	

