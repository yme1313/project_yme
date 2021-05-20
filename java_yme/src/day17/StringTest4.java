package day17;

import java.util.Scanner;

public class StringTest4 {

	public static void main(String[] args) {
		System.out.println("제 이름은 홍길동입니다.".replace("홍길동","임꺽정"));
		/* 문자열 C를 입력 받고, 해당 단어에 문자열 A와 문자열 B를 입력받아
		 * 문자열C 에 있는 문자열 A를 문자열 B로 바꾸는 코드를 작성하세요. */
		Scanner scan = new Scanner(System.in);
		System.out.print("내용을 입력하세요 : ");
		String word1 = scan.next();
		System.out.print("바꿀 단어를 입력하세요 : ");
		String word2 = scan.next();
		String word3 = scan.next();
		
		if(word1 != null && word1.indexOf(word2) !=-1) {
			word1 = word1.replace(word2, word3);
			System.out.println("바뀐 단어 : " + word1);
		} else {
			System.out.println("단어를 바꿀 수 없습니다.");
		}
		scan.close();
	}
}
