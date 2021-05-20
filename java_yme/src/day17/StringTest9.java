package day17;

import java.util.Scanner;

public class StringTest9 {

	public static void main(String[] args) {
		/* 공백을 포함한 긴 문자열을 입력한 후 단어를 입력받아 해당 단어가 몇번 나오는지 확인하는 코드를 작성하세요.
		 * 예시
		 * 문장 입력 : Hello, Hi, HHHH, He, His
		 * 단어 입력 : H
		 * 횟수 : 8번
		 * 단어 입력 : Hi
		 * 횟수 : 2번
		 * */
		
		System.out.print("문장 입력 : ");
		Scanner scan = new Scanner(System.in);
		String sentence = scan.nextLine();
		System.out.print("단어 입력 : ");
		String word = scan.next();
		int count = 0;	
		int index = 0; //해당 단어가 있는 시작 번지
			while(true) {
				//문장에 해당 단어가 있는 위치를 찾음
				index = sentence.indexOf(word);
				if(index == -1) {
					break;			
			} 
			count++;
			sentence = sentence.substring(index + 1);
		} System.out.println("횟수 : " + count + "번");
		scan.close();
	}
}
