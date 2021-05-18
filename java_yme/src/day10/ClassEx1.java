package day10;

public class ClassEx1 {

	public static void main(String[] args) {

		D d = new D();
		// d.num = 10; //에러 발생 : num의 접근제한자가 private이기 때문에
		d.setNum(10);
		System.out.println(d.getNum());
	}
}

