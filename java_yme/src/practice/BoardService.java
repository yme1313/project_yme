package practice;

public interface BoardService {
	
	/* 기능 : 게시글 등록하는 메소드
	 * 매개변수 : 게시글 번호, 제목, 내용, 날짜, 작성자 => 게시글 정보(Board board)
	 * 리턴타입 : 없음
	 * 메소드명 : insert
	 */
	 public void insert(Board board);
	 
	/* 기능 : 게시글 번호로 게시글 정보를 삭제 후 삭제 여부를 알려주는 메소드
	 * 매개변수 : 게시글 번호 => int num
	 * 리턴타입 : boolean
	 * 메소드명 : delete
	 */
	public boolean delete(int num);
	
	/* 기능 : 수정할 게시글 정보가 주어지면 제목,내용을 수정하는 메소드
	 * 매개변수 : 게시글 번호와 수정할 게시글 정보
	 * 리턴타입 : void
	 * 메소드명 : update
	 */
	public void update(Board board);
	
	/* 기능 : 게시글 번호 주어지면 게시글을 전달(제목, 내용, 작성자, 작성일)을 알려주는 메소드
	 * 매개변수 : 게시글번호 -> int num
	 * 리턴타입 : Board
	 * 메소드명 : getBorard
	 */
	public Board getBorard(int num);
	
	/* 기능 : 게시글 리스트/ 게시글 정보(제목,내용,작성자,작성일)등을 메소드
	 * 매개변수 : 없음
	 * 리턴타입 : Board[]
	 * 메소드명 : getBoardList
	 */
	public Board[] getBoardList();
	
	/* 기능 : 검색어가 들어간 게시글 리스트를 가져오는 메소드
	 * 매개변수 : 검색어 => String search 를 통해 게시글 리스트
	 * 리턴타입 : Board[]
	 * 메소드명 : getBoardList
	 */
	public Board[] getBoardList(String search);
}
class Board{
	//게시글 번호,제목, 내용, 작성자, 작성일
	int num;
	String title;
	String contents;
	String writter;
	String date;
	
	}
	
	


