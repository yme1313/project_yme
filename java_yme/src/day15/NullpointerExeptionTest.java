package day15;

public class NullpointerExeptionTest {

	public static void main(String[] args) {
		String name = null;
		//객체를 생성하지 않아 예외 발생
		System.out.println(name.toString());
		int [] arr= null;
		//배열을 생성 하지 않아 예외 발생
		//조건문을 이용하여 예외를 처리
		if(arr != null) {
			System.out.println(arr.length);
			}
}
}
