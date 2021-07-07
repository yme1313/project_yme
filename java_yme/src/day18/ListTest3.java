package day18;

import java.util.ArrayList;
import java.util.Scanner;

public class ListTest3 {

	public static void main(String[] args) {
		/* 리스트에서 indexOf()와 contains() 메소드를 잘 활용하려면
		 * 해당 클래스에서 equals를 오버라이딩해야 한다. */
		int num, num1, num2;
		String name;

		
		ArrayList<Student> list = new ArrayList<Student>();
		Scanner scan = new Scanner(System.in);
		
		System.out.print("입력하세요 : ");
		num = scan.nextInt();
		System.out.print("입력하세요 : ");
		num1 = scan.nextInt();
		System.out.print("입력하세요 : ");
		num2 = scan.nextInt();
		System.out.print("입력하세요 : ");
		name = scan.next();
		Student std = new Student(num, num1, num2, name);
		list.add(std);

		Student std2= new Student(0,0,0,"홍길동");
		Student std3 = new Student(1,2,3,"임꺽정");
		
		list.add(std2);
		
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		System.out.println("리스트에 학생 정보가 있습니까? " + list.indexOf(std2));
		System.out.println("리스트에 학생 정보가 있습니까? " + list.contains(std2));
		
	}
}
class Student {
	int grede;
	int classNum;
	int num;
	String name;
	
	public Student(int grede, int classNum, int num, String name) {
		super();
		this.grede = grede;
		this.classNum = classNum;
		this.num = num;
		this.name = name;
	}

	@Override
	public String toString() {
		return "학년 : " + grede + ", 반 : " + classNum + ", 번호 : " + num + ", 이름 : " + name;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + classNum;
		result = prime * result + grede;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + num;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Student other = (Student) obj;
		if (classNum != other.classNum)
			return false;
		if (grede != other.grede)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (num != other.num)
			return false;
		return true;
	}
	
	
}