package day2;

public class If1 {

	public static void main(String[] args) {
		// if문 기본문법1 
		/* if(조건문){
		           실행문
		     }
		     
		기본문법2
		 if(조건식){
		        실행문
		     } else {
		       }
		       
		기본문법3
		if(조건식1){
		        실행문1
		     } else if(조건식2) {실행문2
		       } else {실행문3}
		 */
		int num =-1;
		
		if(num ==0) {
			System.out.println("0입니다.");
	} else if(num==1) {
		System.out.println("1입니다.");
	} else {
		System.out.println("0과 1이 아닙니다.");
	}
	// 조건문이 거짓이면 실행문은 작동 하지 않는다.
	}
}
