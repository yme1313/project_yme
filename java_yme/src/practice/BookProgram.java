package practice;

import java.util.ArrayList;
import java.util.Arrays;

import java.util.Scanner;

public class BookProgram implements BookService{
	ArrayList<Book> list = new ArrayList<Book>();
	Scanner scan = new Scanner(System.in);
	
	
	@Override
	public void Insert() {
		System.out.print("등록할 책 코드번호를 입력하세요 : ");
		String bookCode = scan.next();
		System.out.print("등록할 책 이름을 입력하세요 : ");
		String bookName = scan.next();
		Book tmp = new Book(bookName,bookCode);
		list.add(tmp);
	}

	@Override
	public void SearchBookName() {
		System.out.print("검색할 책 이름을 입력하세요 : ");
		String bookName = scan.next();
		if(list.contains(bookName) == true) {
			System.out.println(bookName + " 책이 있습니다.");
		} else {
			System.out.println("책이 없습니다.");
		}
	}

	@Override
	public void SearchBookCode() {
		System.out.print("검색할 책 코드를 입력하세요 : ");
		String bookCode = scan.next();
		if(list.contains(bookCode) == true) {
			System.out.println(bookCode + " 책이 있습니다.");
		} else {
			System.out.println("책이 없습니다.");
		}
	}

	@Override
	public void Lent() {
		System.out.print("대여할 책 이름을 입력하세요 : ");
		String bookName = scan.next();
		if(list.contains(bookName) == true) {
			System.out.println(bookName + " 책을 대여 합니다.");
			list.remove(bookName);
		} else {
			System.out.println("책이 없습니다.");
		}
	}

	@Override
	public void Return() {
		System.out.print("반납할 책 이름과 책 코드를 입력하세요 : ");
		String bookName = scan.next();
		String bookCode = scan.next();
		if(list.contains(bookName) == false) {
			System.out.println(bookName + " 책을 반납 합니다.");
			Book tmp = new Book(bookName,bookCode);
			list.add(tmp);
		} else {
			System.out.println("책이 있습니다.");
		}
		
	}

}
