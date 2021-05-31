package practice;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

public class BookProgram implements BookService{
	HashMap<String, String> map = new HashMap <String,String>();
	
	Scanner scan = new Scanner(System.in);
	
	
	@Override
	public void Insert() {
		System.out.print("등록할 책 이름을 입력하세요 : ");
		String bookName = scan.next();
		System.out.print("등록할 책 코드번호를 입력하세요 : ");
		String bookCode = scan.next();
		map.put(bookName, bookCode);
		System.out.println("도서가 등록되었습니다.");
	}

	@Override
	public void SearchBookName() {
		System.out.print("검색할 책 이름을 입력하세요 : ");
		String bookName = scan.next();
		if(map.containsKey(bookName) == true) {
			System.out.println(bookName + " 책이 있습니다.");
			System.out.println("책 코드 : " + map.get(bookName));
		} else {
			System.out.println("책이 없습니다.");
		}
	}

	@Override
	public void SearchBookCode() {
		System.out.print("검색할 책 코드를 입력하세요 : ");
		String bookCode = scan.next();
		if(map.containsValue(bookCode) == true) {
			System.out.println(bookCode + " 책이 있습니다.");
		} else {
			System.out.println("책이 없습니다.");
		}
	}

	@Override
	//반복문을 활용해서 다시 수정
	public void Lent() {
		System.out.print("대여할 책 코드를 입력하세요 : ");
		String bookCode = scan.next();
		if(map.containsValue(bookCode) == true) {
			System.out.println(getKey(map,bookCode) + " 책을 대여 합니다.");
			map.remove(getKey(map,bookCode));
		} else {
			System.out.println("책이 없습니다.");
		}
	}

	@Override
	public void Return() {
		System.out.print("반납할 책 이름을 입력하세요 : ");
		String bookName = scan.next();
		System.out.print("반납할 코드를 입력하세요 : ");
		String bookCode = scan.next();
		if(map.containsKey(bookName) == false) {
			System.out.println(bookName + " 책을 반납 합니다.");
			map.put(bookName, bookCode);
		} else {
			System.out.println("책이 있습니다.");
		}	
	}
	
	public void allList() {
		if(map.isEmpty() == true) {
			System.out.println("책이 없습니다.");
		} else {
			Set <String> keySet = map.keySet();
			Iterator<String> it = keySet.iterator();
			while(it.hasNext()) {
				String key = it.next();
				String value = map.get(key);
				System.out.println(key+", " + value);
			}
		}
	}
	
	 public static <K, V> K getKey(Map<K, V> map, V value) {
	        for (K key : map.keySet()) {
	            if (value.equals(map.get(key))) {
	                return key;
	            }
	        }
	        return null;
	 }
}	


