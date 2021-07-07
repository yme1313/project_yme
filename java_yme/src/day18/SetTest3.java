package day18;

import java.util.HashSet;
import java.util.Iterator;

public class SetTest3 {

	public static void main(String[] args) {
		/* 중복되지 않은 6개의 수를 랜덤으로 생성하여 저장한 후 출력하는 코드를 작성하세요.
		 * 단 숫자의 범위는 1~45 */
		
		HashSet<Integer> lotto = new HashSet<Integer>();
		int min = 1, max = 45;
		while(lotto.size()<6) {
			Integer r = (int)(Math.random() * (max - min + 1) + min);
			lotto.add(r);
		} 
		System.out.print("로또 : ");
		Iterator<Integer> it = lotto.iterator();
		while(it.hasNext()) {
			System.out.print(it.next() + " ");
		}
	}
}
