package practice;

import java.util.ArrayList;

import java.util.Scanner;

public class Board1 implements practice.BoardService{
	BoardTest board = new BoardTest(0,null,null, null,null);
	ArrayList<BoardTest> list = new ArrayList<BoardTest>();
	Scanner scan = new Scanner(System.in);
	
	@Override
	public void insert() {
		System.out.println("게시글 정보를 입력하세요.");
		System.out.print("제목을 입력하세요 : ");
		String title = scan.next();
		System.out.print("내용을 입력하세요 : ");
		String contents = scan.next();
		System.out.print("작성자를 입력하세요 : ");
		String writter = scan.next();
		System.out.print("작성날짜를 입력하세요 : ");
		String date = scan.next();
		int num = 0;
		num = num +1;
		BoardTest res = new BoardTest(num, title, contents, writter, date);
		list.add(res);  
	}

	@Override
	public void update() {
		System.out.print("수정할 게시글 번호를 입력하세요 : ");
		int num = scan.nextInt();
		if(list.contains(num)==false) {
			System.out.println("이미 삭제되었거나 게시물이 없습니다.");
		} else {
			System.out.print("게시글 번호를 입력하세요 : ");
			int num1 = scan.nextInt();
			System.out.print("제목을 입력하세요 : ");
			String title = scan.next();
			System.out.print("내용을 입력하세요 : ");
			String contents = scan.next();
			System.out.print("작성자를 입력하세요 : ");
			String writter = scan.next();
			System.out.print("작성날짜를 입력하세요 : ");
			String date = scan.next();
			BoardTest res1 = new BoardTest(num1, title, contents, writter, date);
			list.set(num,res1);
		}
	}
	
	@Override
	public boolean delete() {
		System.out.print("삭제할 게시글 번호를 입력하세요 : ");
		int num = scan.nextInt();
		if(list.contains(num)== false) {
		System.out.println("이미 삭제되었거나 게시물이 없습니다.");
		} else {
			list.remove(num-1);
			System.out.println("삭제가 완료되었습니다.");
		}
		return false;
	}

	@Override
	public BoardTest getBorard() {
		System.out.print("게시글 번호를 입력하세요 : ");
		int num = scan.nextInt();
		if(list.contains(num)== false) {
			System.out.println("이미 삭제되었거나 게시물이 없습니다.");
		} else {
			System.out.println(list.get(num-1));
		}
		return null;
	}

	@Override
	public BoardTest[] getBoardList() {
		System.out.print("단어를 입력하세요 : ");
		String search = scan.next();
		for(int i=0 ; i < list.size(); i++) {
		if(list.indexOf(search)==-1) {
			System.out.println("이미 삭제되었거나 게시물이 없습니다.");
		} else {
			System.out.println(list.get(i-1));
		}
	}
		return null;
		}
	}

	

