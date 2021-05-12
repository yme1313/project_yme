package board;

import java.util.Scanner;

public class BoardTest {

	public static void main(String[] args) {
		/* 다음 메뉴를 가지는 게시글 콘솔 프로그램을 만드세요.
		1. 게시글 등록
		2. 게시글 수정
		3. 게시글 삭제
		4. 게시글 목록 확인
		5. 게시글 상세 확인
		6. 프로그램 종료
		*/
		//반복문을 이용하여 메뉴를 출력하고 메뉴를 선택하는 작업, 프로그램 종료를 선택할때까지
			//선택한 메뉴가 1이면 게시글 등록이라고 출력
			//선택한 메뉴가 2이면 게시글 수정이라고 출력
			//선택한 메뉴가 3이면 게시글 삭제라고 출력
			//선택한 메뉴가 4이면 게시글 목록 확인이라고 출력
			//선택한 메뉴가 5이면 게시글 상세 확인이라고 출력
			//선택한 메뉴가 6이면 프로그램 종료라고 출력
			//선택한 메뉴가 1~6이 아니면 잘못된 메뉴라고 출력
		Scanner scan = new Scanner(System.in);
		int menu = 0;
		int max = 10;
		Board []board = new Board[max];
		String title, writer, registerDate, contents, type;
		int num;
		int count = 0; // 저장된 게시글의 갯수(등록할 때 저장할 번지)
		Board tmpBoard;
		
		do {
			printMenu();
			menu= scan.nextInt();
			switch(menu) {
			case 1 : 
				//게시글 정보 입력(제목,작성자,작성일,내용)
				System.out.println("게시글 정보를 입력하세요.");
				System.out.print("제목 : ");
				title = scan.next();
				System.out.print("작성자 : ");
				writer = scan.next();
				System.out.print("작성일 : ");
				registerDate = scan.next();
				System.out.print("내용 : ");
				contents = scan.next();
				//타입은 게시글로 지정 번호는 배열의 번지
				type = "게시글";
				num = count +1;
				//입력된 정보를 이용하여 게시글 생성
				tmpBoard = new Board(num, title, contents, writer, registerDate, type);
				//생성된 게시글을 배열에 저장
				board[count] = tmpBoard;
				count += 1 ;
				break;
			case 2:  
				//수정할 게시글 번호 입력
				System.out.print("수정할 게시글 번호를 입력하세요 : ");
				num = scan.nextInt();
				//게시글 수정
				//게시글이 존재하고 -> num <= count
				//게시글이 삭제되지 않았으면 -> board[num-1] != null
				if(num<=count && board[num-1] != null){
					System.out.print("수정할 제목: ");
					title= scan.next();
					System.out.print("수정할 내용: ");
					contents = scan.next();
					board[num-1].edit(title,contents);
				}else {
					System.out.println("게시글이 없거나 삭제되었습니다.");
				}
				
				//게시글 수정
				break;
			case 3:  
				//게시글 번호를 입력하라는 문구 출력
				System.out.print("삭제할 게시글 번호를 입력하세요 : ");
				num = scan.nextInt();
				//입력하면 삭제
					if(num <= count) {
						board[num-1]= null;
					}
				break;
			case 4 : 
				//모든 게시글을 확인
				for(int i =0 ; i < count ; i+=1) {
					if(board[i] != null) {
						board[i].summaryPrint();
					}
				}	
				break;
			case 5 : 
				System.out.print("확인할 게시글 번호를 입력하세요 : ");
				num = scan.nextInt();
				//해당 게시글의 내용을 출력
				if(num<=count && board[num-1] != null) {
					//게시글을 확인하면 조회수를 1증가
					//Board에서 수정 프린트에서 views+=1; 추가
					board[num-1].print(); // 게시글 조회
				} else {
					System.out.println("해당 게시글이 없가나 삭제되었습니다.");
				}
				break;
			case 6 : 
				System.out.println("프로그램 종료"); 
				break;
			default: System.out.println("잘못된 메뉴입니다.");
			}
		} while(menu !=6);
		scan.close();
	}

	public static void printMenu() {
		System.out.println("----메뉴----");
		System.out.println("1.게시글 등록");
		System.out.println("2.게시글 수정");
		System.out.println("3.게시글 삭제");
		System.out.println("4.게시글 목록 확인");
		System.out.println("5.게시글 상세 확인");
		System.out.println("6.프로그램 종료");
		System.out.println("--------------");
		System.out.print("메뉴를 선택하세요 : ");
	}

}
