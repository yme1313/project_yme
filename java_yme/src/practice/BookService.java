package practice;

public interface BookService {
	// 표준 규격임으로 좀 더 구체화해서 
	
	//등록 
	public void Insert();
	//책 이름으로 검색, 있다/없다, 책 코드번호 출력
	public void SearchBookName();
	//책 코드번호로 검색, 있다/없다
	public void SearchBookCode();
	//반출 , 책 코드번호로 실행
	public void Lent();
	//반납, 책 코드번호로 실행
	public void Return();
}
class Book{
	//책 코드 번호, 책 이름
	String bookName;
	String bookCode;
	
	public Book(String bookName, String bookCode) {
		this.bookName = bookName;
		this.bookCode = bookCode;
	}
	
	
	
}
	
	
	
	
	
	
	

