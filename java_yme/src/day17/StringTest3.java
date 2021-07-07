package day17;

import java.util.Scanner;

public class StringTest3 {

	public static void main(String[] args) {
		System.out.println("abcdef".indexOf("bc"));
		System.out.println("abcdef".indexOf("ad"));
		/*두 단어A 와 단어B 를 입력받고 단어A에 단어B가 있는지 없는지 확인하는 코드를 작성하세요.*/
		
		System.out.print("두 단어를 입력하세요(예: abcd ad) : ");
		Scanner scan = new Scanner(System.in);
		String word1 = scan.next();
		String wodr2 = scan.next();
		if(word1 != null && word1.indexOf(wodr2)!= -1) {
			System.out.println("중복되는 단어가 있습니다.");
		} else {
			System.out.println("중북되는 단어가 없습니다.");
		}
		if(word1 !=null) {
			System.out.println(word1.length());
		}
		scan.close();
	}
}
