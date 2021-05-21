package day18;

import java.util.ArrayList;
import java.util.Scanner;

public class ListTest2 {

	public static void main(String[] args) {
		/* 오늘의 할일을 저장하는 리스트를 생성한 후 오늘의 할일을 입력받고, 다 받은 후에 
		 * 출력하는 코드를 작성하세요. 오늘의 할일은 종료를 입력하면 입력을 종료하고 출력하면 됩니다.
		 * 예시
		 * 오늘의 할일 입력 : 출근
		 * 오늘의 할일 입력 : 오전수업
		 * 오늘의 할일 입력 : 점심
		 * 오늘의 할일 입력 : 오후수업
		 * 오늘의 할일 입력 : 퇴근
		 * 오늘의 할일 입력 : 종료
		 * 오늘의 할일 
		 * 1. 출근
		 * 2. 오전수업
		 * 3. 점심
		 * 4. 오후수업
		 * 5. 퇴근
		 * */
		ArrayList<String> daily = new ArrayList<String>();
		Scanner scan = new Scanner(System.in);
		while(true) {
			System.out.print("오늘의 할일 : ");
			String str1 = scan.next();
			if(str1.equals("종료")) { 
				break;
			} 
			daily.add(str1);
		} scan.close();
		
		System.out.println("오늘의 할일");
		for(int i= 0 ; i < daily.size() ; i++) {
			System.out.println(i+1 + ". " + daily.get(i));
		}
		
		/* 내가 직접 한 코드
		for(int i = 0 ;  ; i++) {
			System.out.print("오늘의 할일 : ");
			String str1 = scan.next();
			daily.add(str1);
			if(str1.equals("종료")) { 
				break;
			} 
		} scan.close();
		
		System.out.println("오늘의 할일");
		for(int j= 0 ; j < daily.size()-1 ; j++) {
			System.out.println(j+1 + ". " + daily.get(j));
			}
 		*/

	}
}
