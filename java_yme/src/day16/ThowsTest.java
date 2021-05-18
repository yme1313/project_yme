package day16;

public class ThowsTest {

	public static void main(String[] args) {
		try{
			test();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public static void test() throws Exception{
		throw new Exception("test 메소드에서 예외 발생");
	}
}
