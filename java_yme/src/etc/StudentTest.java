package etc;

public class StudentTest {

	public static void main(String[] args) {
		Student st = new Student(1,1,1,"홍길동");
		st.Print();
	}
}
class Student {
	private int Grade;
	private int Group;
	private int Num;
	private String Name;
	public void Print() {
		System.out.println(Grade + "학년 " + Group + "반 " + Num + "번 " + Name );
	}
	public Student() {}
	public Student(int grade, int group, int num, String name) {
		Grade = grade;
		Group = group;
		Num = num;
		Name = name;
	}
	public int getGrade() {
		return Grade;
	}
	public void setGrade(int grade) {
		Grade = grade;
	}
	public int getGroup() {
		return Group;
	}
	public void setGroup(int group) {
		Group = group;
	}
	public int getNum() {
		return Num;
	}
	public void setNum(int num) {
		Num = num;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
}
