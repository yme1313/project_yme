package day17;

import java.util.Scanner;

public class StringTest5 {

	public static void main(String[] args) {
		String str = "안녕하세요";
		//2번지부터 마지막번지까지 부분 문자열 생성
		System.out.println(str.substring(2));
		//substring은 원본 수정하는 것이 아니라 새로운 문자열을 생성
		System.out.println(str);
		//2번지부터 3번지전까지인 2번지까지 새로운 부분 문자열을 생성
		System.out.println(str.substring(2, 3));
		/* 주민등록번호를 입력해서 생년월일 부분을 추출하여 년도 월 일을 출력하는 코드를 작성하세요.
		 * 예시
		 * 주민번호를 입력하세요 : 020101-3234567
		 * 2002년 1월 1일
		 * 주민번호를 입력하세요 : 020101-1234567
		 * 1902년 1월 1일
		 * */
		
		Scanner scan = new Scanner(System.in);
		System.out.print("주민번호를 입력하세요 : ");
		String ssn = scan.next();
		String gender;
		gender = ssn.substring(7,8);
		String year = ssn.substring(0,2);
		String month = ssn.substring(2,4);
		String day = ssn.substring(4,6);
		/*
		if(gender.equals("3") || gender.equals("4")) {
			System.out.println("20"+ year +"년 " + month+ "월 "  + day + "일");
		} else {
			System.out.println("19"+ year +"년 " + month+ "월 "  + day + "일");
		} 
		*/
		switch(gender) {
		case "1","2" :
			year = "19" + year;
			break;
		case "3","4" :
			year = "20" + year;
			break;
		}
		System.out.println(year +"년 " + month+ "월 "  + day + "일");
		scan.close();
	}

}
