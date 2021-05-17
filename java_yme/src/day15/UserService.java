package day15;
//회원과 관련된 처리를 하는 기능들을 모아 놓은 인터페이스
public interface UserService {
	
	/* 기능 : 회원의 아이디와 비밀번호가 주어졌을 때 로그인 가능여부를 알려주는 메소드
	 * 매개변수 : id / password => String id , String pw
	 * 리턴타입 : boolean
	 * 메소드명 : login
	 * */
	 boolean login (String id, String pw); 
	/* 기능 : 회원의 아이디, 비밀번호, 이메일, 전화번호가 주어지면 해당 정보로 회원가입하여 가입 여부를 알려주는 메소드
	 * 매개변수 : 아이디, 비밀번호, 이메일, 전화번호(회원정보) => User user
	 * 리턴타입 : 회원가입 성공 여부 => boolean
	 * 메소드명 : signup
	 * */
	 boolean signup(User user);
	/* 기능 : 회원의 이메일, 전화번호를 수정하는 메소드
	 * 매개변수 : 이메일, 전화번호(회원정보) => User user
	 * 리턴타입 : 없음 void
	 * 메소드명 : modifyUser
	 * */	
	 void modifyUser(User user);
}
class User{
	String id;
	String pw;
	String eMail;
	String phoneNum;
}
