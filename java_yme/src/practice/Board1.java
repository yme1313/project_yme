package practice;

import java.util.ArrayList;
import java.util.Scanner;

public class Board1 implements BoardService{
	ArrayList<Integer> list = new ArrayList<Integer>();
	Board board = new Board();
	
	Scanner scan = new Scanner(System.in);
	
	
	String title;
	String contents;
	String writter;
	String date;
	
	int num=0;
	int view=0;
	
	@Override
	public void insert(Board board) {
		title = scan.next();
		System.out.print("제목을 입력하세요 : ");
		this.title = title;
		contents = scan.next();
		System.out.print("내용을 입력하세요 : ");
		this.contents = contents;
		writter = scan.next();
		System.out.print("작성자를 입력하세요 : ");
		this.writter = writter;
		date = scan.next();
		System.out.print("작성날짜를 입력하세요 : ");
		this.date = date;
		 num++;
		 for(int i=num ; ; i++) {
			list.add(num);
		 }
	}

	@Override
	public boolean delete(int num) {
		System.out.print("삭제할 게시글 번호를 입력하세요 : ");
		num = scan.nextInt();
		if(list.indexOf(num)== -1) {
			System.out.println("이미 삭제되었거나 게시물이 없습니다.");
		} else {
			list.remove(num);
		}
		return false;
	}
	
	@Override
	public void update(Board board) {
		System.out.print("수정할 게시글 번호를 입력하세요 : ");
		num = scan.nextInt();
		if(list.get(num) ==null) {
			System.out.println("이미 삭제되었거나 게시물이 없습니다.");
		} else {
			title = scan.next();
			System.out.print("제목을 입력하세요 : ");
			this.title = title;
			contents = scan.next();
			System.out.print("내용을 입력하세요 : ");
			this.contents = contents;
			writter = scan.next();
			System.out.print("작성자를 입력하세요 : ");
			this.writter = writter;
			date = scan.next();
			System.out.print("작성날짜를 입력하세요 : ");
			this.date = date;
		}
	}

	@Override
	public Board getBorard(int num) {
		System.out.println("게시글 번호를 입력하세요 : ");
		num = scan.nextInt();
		if(list.indexOf(num)== -1) {
			System.out.println("이미 삭제되었거나 게시물이 없습니다.");
		} else {
			System.out.println(board);
		}
		view ++;
		return null;
	}

	@Override
	public Board[] getBoardList() {
		for(int i =0 ;  ; i ++) {
			if(!list.isEmpty()){
				System.out.println(list.get(i));
			}
		}
	}

	@Override
	public Board[] getBoardList(String search) {
		System.out.print("단어를 입력하세요 : ");
		search = scan.next();
		for(int i=0 ; ; i++) {
		if(list.contains(search)==true) {
			System.out.println(list.get(i));
			}
		}
	}
	
}
