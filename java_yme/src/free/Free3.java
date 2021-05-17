package free;

public class Free3 {

	public static void main(String[] args) {	
		boolean res = login("hong","12345");
		if(res) {
			System.out.println("로그인 되었습니다.");
		} else {
			System.out.println("id 또는 password가 일치하지 않습니다.");
		}
		
	
}
	

	static boolean login(String id , String password) {
		if(id == "hong" && password == "12345") {
			return true;
		} else {
			return false;
		}
	}
	
	void logout(String id) {
		System.out.println("로그아웃 되었습니다.");
	}
}
