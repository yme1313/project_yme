package day17;

import java.util.Scanner;

public class StringTest2 {

	public static void main(String[] args) {
		System.out.println("홍길동".equals("홍길동"));
		/* 두 단어를 입력받아 두단어가 같은 단어인지 확인하는 코드를 작성하세요. */
		Scanner scan = new Scanner(System.in);
		System.out.print("두 단어를 입력하세요(예: abc cde) : ");
		String name1 = scan.next();
		String name2 = scan.next();
		
		if(name1 !=null && name1.equals(name2)) {
			System.out.println("같은 단어입니다.");
		} else {
			System.out.println("다른 단어입니다.");
		}		
	}
}
