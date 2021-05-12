package free;

public class KoreanExample {

	public static void main(String[] args) {
		Korean k1 = new Korean("유명은", "123456-1234567");
		System.out.println(k1.nation);
		System.out.println(k1.name);
		System.out.println(k1.ssn);
		System.out.println("----------------");
		Korean k2 = new Korean("김혜인", "123456-2345678");
		System.out.println(k2.nation);
		System.out.println(k2.name);
		System.out.println(k2.ssn);
		
	}

}
