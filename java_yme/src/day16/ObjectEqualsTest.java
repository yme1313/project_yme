package day16;

public class ObjectEqualsTest {

	public static void main(String[] args) {
		String str1 = new String("abcd");
		String str2 = str1;
		System.out.println("str2 = str1");
		System.out.println("두 문자열 주소 비교 : " + (str1==str2));
		System.out.println("str2 = new String(\"abcd\")");
		str2 = new String("abcd");
		System.out.println("두 문자열 주소 비교 : " + (str1==str2));
		System.out.println("두 문자열 비교 : " + str1.equals(str2));
		
		Num n1 = new Num();
		Num n2 = new Num();
		System.out.println("n1과 n2 주소 비교 : " + (n1 ==n2));
		System.out.println(n1.equals(n2));
		System.out.println(n1.equals("abc"));
		
	}
}
class Num{
	private int num;

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public int hashCode() {
		//20개씩 하나의 그룹이 묶어준다
		return num /20 ;
	}
	@Override
	public boolean equals(Object obj) {
		//주소가 같으면 같은 값을 공유하기 때문에 무조건 true
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Num other = (Num) obj;
		if (num != other.num)
			return false;
		return true;
	}
	
	/*
	  @Override
	public boolean equals(Object obj) {
		if(obj == null) {
			return false;
		}
		//매개변수 obj를 Num클래스의 객체로 타입변환이 가능하지 않다면 false를 return
		//false로 리턴하는 이유는 다른 클래스의 객체와 비교할 필요가 없어서
		if(! (obj instanceof Num)) {
			return false;
		}
		//매개변수의 Num와 내 Num가 같은지를 비교
		Num tmp = (Num)obj;
		if(num == tmp.num) {
			return true;
		}
		return false;
	}
	*/
}
