package day6;

import java.util.Calendar;

public class Enum3 {

	public static void main(String[] args) {
		//열거형은 아니지만 열거형과 비슷하게 의미전달을 하는 예제
		Calendar now=Calendar.getInstance();
		int year = now.get(Calendar.YEAR); // now.get(1) / 현재 날짜의 년도
		int month = now.get(Calendar.MONTH) + 1; // now.get(2)/ 현재 날짜의 월, 시작을 0부터 하기 때문에 +1 필요
		System.out.println(year + "년" + month + "월");
		

	}

}
